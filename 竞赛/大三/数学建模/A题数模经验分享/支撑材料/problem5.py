import numpy as np
import random
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False


g = 9.8
SINK_V = 3.0
R_EFFECT = 10.0
EFFECTIVE_T = 20.0

M_INIT = {
    0: np.array([20000.0,     0.0, 2000.0]),   #M1
    1: np.array([19000.0,   600.0, 2100.0]),   #M2
    2: np.array([18000.0,  -600.0, 1900.0])    #M3
}
FAKE_TARGET = np.array([0.0,0.0,0.0])
TARGET_TRUE = np.array([0.0,200.0,0.0])
V_M = 300.0

FY = {
    "FY1": np.array([17800.0,0.0,1800.0]),
    "FY2": np.array([12000.0,1400.0,1400.0]),
    "FY3": np.array([ 6000.0,-3000.0, 700.0]),
    "FY4": np.array([11000.0,2000.0,1800.0]),
    "FY5": np.array([13000.0,-2000.0,1300.0]),
}

THETA_RANGE  = (0.0,2*np.pi)
V_RANGE = (70.0,140.0)
T_DROP_RANGE = (0.0,20.0)
FUSE_RANGE = (2.0,6.0)
MIN_GAP = 1.0

UAV_LIST = ["FY1","FY2","FY3","FY4","FY5"]
MISS_IDS = [0,1,2]
NUM_SMOKES_PER_UAV = 3


def missile_dir(m_id):
    u = (FAKE_TARGET-M_INIT[m_id])
    return u/np.linalg.norm(u)

def missile_pos_vec(m_id,t):
    t = np.asarray(t)
    return M_INIT[m_id]+(V_M*t)[:,None]*missile_dir(m_id)

def t_hit_fake(m_id):
    return np.linalg.norm(M_INIT[m_id]-FAKE_TARGET)/V_M

def dist_point_to_segment_vec(P,A,B):
    AB = B-A
    denom = np.einsum('ij,ij->i',AB,AB)
    denom = np.where(denom < 1e-12,1e-12,denom)
    tau = np.einsum('ij,ij->i', (P - A),AB)/denom
    tau = np.clip(tau,0.0,1.0)
    Q = A + tau[:,None]*AB
    return np.linalg.norm(P-Q,axis=1)

def one_cloud_mask(m_id,C_exp,t_exp,t_grid):
    dz = -SINK_V*np.maximum(0.0,t_grid-t_exp)
    C_t = C_exp[None,:]+np.stack([np.zeros_like(t_grid),
                                     np.zeros_like(t_grid),
                                     dz],axis=1)
    valid = (t_grid >= t_exp)&(t_grid <= t_exp+EFFECTIVE_T)
    A = missile_pos_vec(m_id,t_grid)
    d = dist_point_to_segment_vec(C_t,A,TARGET_TRUE)
    return valid & (d <= R_EFFECT)

def drop_and_explode(F0,v_uav,theta,t_drop,fuse):
    u = np.array([np.cos(theta),np.sin(theta),0.0])
    P_drop = F0+v_uav*t_drop*u
    C_exp  = P_drop+v_uav*fuse*u+np.array([0.0,0.0,-0.5*g*fuse**2])
    return P_drop,C_exp,t_drop+fuse


GENE_LEN_PER_UAV = 2+NUM_SMOKES_PER_UAV*4
CHROM_LEN = len(UAV_LIST)*GENE_LEN_PER_UAV

def clip_gene_vec(ch):
    ch = list(ch)
    for i in range(len(UAV_LIST)):
        base = i*GENE_LEN_PER_UAV
        ch[base+0] %= 2*np.pi
        ch[base+1] = float(np.clip(ch[base+1],*V_RANGE))
        for k in range(NUM_SMOKES_PER_UAV):
            o = base + 2 + k*4
            ch[o+0] = 1 if ch[o+0] >= 0.5 else 0
            if k == 0:
                ch[o+1] = float(np.clip(ch[o+1],*T_DROP_RANGE))  # 绝对投放时刻
            else:
                ch[o+1] = float(max(MIN_GAP,ch[o+1]))            # 相对间隔 ≥1s
            ch[o+2] = float(np.clip(ch[o+2],*FUSE_RANGE))
            ch[o+3] = int(np.clip(round(ch[o+3]),0,2))
    return ch


def evaluate(chrom, dt=0.02):
    chrom = clip_gene_vec(chrom)


    smokes = []
    for i,uav in enumerate(UAV_LIST):
        F0 = FY[uav]
        base = i*GENE_LEN_PER_UAV
        theta, v = chrom[base+0],chrom[base+1]
        last_drop_time = None
        for k in range(NUM_SMOKES_PER_UAV):
            o = base + 2 + k*4
            active, t_or_gap, fuse,mid = chrom[o:o+4]
            if active != 1: continue
            if k == 0 or last_drop_time is None:
                t_drop = float(np.clip(t_or_gap,*T_DROP_RANGE))
            else:
                t_drop = last_drop_time+float(max(MIN_GAP,t_or_gap))
            P_drop, C_exp, t_exp = drop_and_explode(F0,v,theta,t_drop,fuse)
            smokes.append((mid, t_exp,C_exp,P_drop,uav, theta,v,t_drop,fuse))
            last_drop_time = t_drop  

    union_sum = 0.0
    per_missile = {m:0.0 for m in MISS_IDS}
    per_smoke_time = []


    for m in MISS_IDS:
        group = [(t_exp,C_exp,P_drop,uav,theta,v,t_drop,fuse)
                 for (mid,t_exp,C_exp,P_drop,uav,theta,v,t_drop,fuse) in smokes if mid==m]
        if not group: continue
        t0 = min(t for (t,_,_,_,_,_,_,_) in group)
        tend = min(t_hit_fake(m), max(t for (t,_,_,_,_,_,_,_) in group) + EFFECTIVE_T)
        if tend <= t0: continue
        t_grid = np.arange(t0,tend+1e-9,dt)
        masks = []
        for (t_exp,C_exp,P_drop,uav,theta,v,t_drop,fuse) in group:
            msk = one_cloud_mask(m, C_exp, t_exp, t_grid)
            per_smoke_time.append((uav, m, float(msk.sum()*dt), t_exp, P_drop, C_exp, theta, v, t_drop, fuse))
            masks.append(msk)
        M = np.zeros_like(masks[0],dtype=bool)
        for msk in masks: M |= msk
        per = float(M.sum()*dt)
        per_missile[m] = per
        union_sum += per

    return union_sum, per_missile, per_smoke_time, chrom


def closest_Q_on_LOS(m_id,F0,t_min=6.0,t_max=35.0):
    ts = np.linspace(t_min,min(t_max, t_hit_fake(m_id)),120)
    A = missile_pos_vec(m_id, ts)
    B = TARGET_TRUE
    AB = B-A
    denom = np.einsum('ij,ij->i',AB,AB)
    denom = np.where(denom < 1e-12,1e-12,denom)
    tau = np.einsum('ij,ij->i',(F0[None,:]-A),AB)/denom
    tau = np.clip(tau,0.0,1.0)
    Q = A + tau[:,None]*AB
    d = np.linalg.norm(Q-F0[None,:],axis=1)
    k = int(np.argmin(d))
    return float(ts[k]),Q[k]

def ballistic_seed_one_smoke(F0,m_id):
    t_star, Q = closest_Q_on_LOS(m_id,F0)
    if F0[2] >= Q[2]:
        fuse = np.sqrt(max(2.0*(F0[2]-Q[2])/g,FUSE_RANGE[0]**2))
    else:
        fuse = FUSE_RANGE[0]
    fuse = float(np.clip(fuse,*FUSE_RANGE))

    Dxy = Q[:2] - F0[:2]
    dist_xy = float(np.linalg.norm(Dxy))
    if dist_xy < 1e-6:
        theta = 0.0; v = V_RANGE[0]
    else:
        theta = float(np.arctan2(Dxy[1],Dxy[0]))
        v = dist_xy / fuse
        v = float(np.clip(v,*V_RANGE))
    t_drop = t_star - fuse
    t_drop = float(np.clip(t_drop,*T_DROP_RANGE))
    return theta % (2*np.pi),v,t_drop,fuse,m_id

def ballistic_aim_seeds_for_uav(uav_name):
    F0 = FY[uav_name]
    seeds=[]
    mids = random.sample(MISS_IDS,k=len(MISS_IDS))
    for mid in mids:
        seeds.append(ballistic_seed_one_smoke(F0, mid))
    return seeds

def make_chrom_from_ballistic():
    chrom=[]
    for uav in UAV_LIST:
        shoots = ballistic_aim_seeds_for_uav(uav)
        if len(shoots)==0:
            theta = 0.0; v = np.mean(V_RANGE)
        else:
            theta, v = shoots[0][0], shoots[0][1]
        chrom += [theta, float(np.clip(v,*V_RANGE))]
        for k in range(NUM_SMOKES_PER_UAV):
            if k < len(shoots):
                th, vv, t_drop, fuse, mid = shoots[k]
                chrom += [1, t_drop if k==0 else max(MIN_GAP, 0.8),fuse,mid]
            else:
                chrom += [0,T_DROP_RANGE[0],np.mean(FUSE_RANGE),0]
    return clip_gene_vec(chrom)

def seed_population(pop_size=180):
    pop=[]
    for i in range(pop_size):
        ch = make_chrom_from_ballistic()
        if i >= pop_size//2:
            for j in range(CHROM_LEN):
                if random.random() < 0.25:
                    r = j % GENE_LEN_PER_UAV
                    if r==0: ch[j] = (ch[j]+np.random.normal(0,0.25))%(2*np.pi)
                    elif r==1: ch[j] = float(np.clip(ch[j]+np.random.normal(0,6.0),*V_RANGE))
                    elif (r-2)%4==0: ch[j] = 1 if random.random()<0.75 else 0
                    elif (r-2)%4==1:
                        ch[j] = float(np.clip(ch[j]+np.random.normal(0,1.2),*T_DROP_RANGE)) if (r-2)//4==0 else max(MIN_GAP, ch[j]+np.random.normal(0,0.8))
                    elif (r-2)%4==2: ch[j] = float(np.clip(ch[j]+np.random.normal(0,0.4),*FUSE_RANGE))
                    else: ch[j] = random.randint(0,2)
            ch = clip_gene_vec(ch)
        pop.append(ch)
    return pop


def crossover(p1,p2):
    i = random.randint(1, CHROM_LEN-2)
    return p1[:i]+p2[i:], p2[:i]+p1[i:]

def mutate(ind, rate=0.12):
    ind = list(ind)
    for j in range(CHROM_LEN):
        if random.random() < rate:
            r = j % GENE_LEN_PER_UAV
            if r==0: ind[j]=(ind[j]+random.uniform(-0.35,0.35))%(2*np.pi)
            elif r==1: ind[j]=float(np.clip(ind[j]+np.random.normal(0,5.0), *V_RANGE))
            elif (r-2)%4==0: ind[j]=1 if random.random()<0.65 else 0
            elif (r-2)%4==1: ind[j]=random.uniform(*T_DROP_RANGE) if (r-2)//4==0 else max(MIN_GAP, ind[j]+np.random.normal(0,0.9))
            elif (r-2)%4==2: ind[j]=float(np.clip(ind[j]+np.random.normal(0,0.35), *FUSE_RANGE))
            else: ind[j]=random.randint(0,2)
    return clip_gene_vec(ind)

def genetic(n_gen=100,pop_size=220):
    pop = seed_population(pop_size)
    best=None; best_val=-1.0
    best_hist=[]; avg_hist=[]
    for g in range(n_gen):
        scored=[]; vals=[]
        for ind in pop:
            val,_,_,_ = evaluate(ind,dt=0.03)
            scored.append((val,ind)); vals.append(val)
        scored.sort(key=lambda x:x[0], reverse=True)
        best_hist.append(scored[0][0]); avg_hist.append(float(np.mean(vals)))
        if scored[0][0] > best_val: best_val, best = scored[0]
        elites=[ind for _,ind in scored[:max(12,pop_size//10)]]
        new_pop=elites.copy()
        while len(new_pop) < pop_size:
            p1,p2=random.sample(elites,2)
            c1,c2=crossover(p1,p2)
            new_pop.append(mutate(c1))
            if len(new_pop)<pop_size: new_pop.append(mutate(c2))
        pop=new_pop
    return best, best_hist, avg_hist

def polish(plan, iters=600, dt=0.02):
    best = np.array(plan, dtype=float)
    best_val, _, _, _ = evaluate(best, dt=dt)
    step = np.full(CHROM_LEN, 0.0)
    for i in range(len(UAV_LIST)):
        base = i*GENE_LEN_PER_UAV
        step[base+0]=0.15; step[base+1]=3.5
        for k in range(NUM_SMOKES_PER_UAV):
            o=base+2+k*4
            step[o+0]=0.0;step[o+1]=0.8 if k>0 else 0.6;step[o+2]=0.25; step[o+3]=0.0
    for t in range(iters):
        cand=best.copy()
        j = np.random.randint(0,CHROM_LEN)
        r = j % GENE_LEN_PER_UAV
        delta = (np.random.uniform(-1,1)*step[j])
        if r==0: cand[j]=(cand[j]+delta)%(2*np.pi)
        elif r==1: cand[j]=float(np.clip(cand[j]+delta,*V_RANGE))
        elif (r-2)%4==1:
            if (r-2)//4==0: cand[j]=float(np.clip(cand[j]+delta,*T_DROP_RANGE))
            else: cand[j]=max(MIN_GAP, cand[j]+delta)
        elif (r-2)%4==2: cand[j]=float(np.clip(cand[j]+delta,*FUSE_RANGE))
        cand = clip_gene_vec(cand)
        val,_,_,_ = evaluate(cand, dt=dt)
        if val > best_val:
            best, best_val = cand, val
        if (t+1)%120==0:
            step *= 0.7
    final_val,_,_,_ = evaluate(best,dt=0.01)
    if final_val > best_val:
        best_val = final_val
    return best, best_val

def plot_convergence(best_hist, avg_hist):
    plt.figure(figsize=(8,5))
    plt.plot(best_hist, marker="o", label="最优值")
    plt.plot(avg_hist,  marker="x", label="平均值")
    mv=max(best_hist); mg=int(np.argmax(best_hist))
    plt.title(f"遗传算法收敛曲线（最大总遮蔽时间 = {mv:.2f} s）")
    plt.xlabel("迭代数"); plt.ylabel("三导弹遮蔽时间总和 (s)")
    plt.grid(ls="--", alpha=0.5); plt.legend()
    plt.annotate(f"{mv:.2f} s", xy=(mg,mv), xytext=(mg, mv+0.8),
                 arrowprops=dict(arrowstyle='->'),
                 ha='center')
    plt.tight_layout();plt.show()


def main():
    random.seed(42); np.random.seed(42)
    base, bh, ah = genetic(n_gen=100, pop_size=220)
    best_plan, best_val = polish(base,iters=800,dt=0.02)
    total, per_miss, per_smokes, _ = evaluate(best_plan,dt=0.01)

    print("\n【问题五 最优策略（强化版）】")
    print(f"M1={per_miss[0]:.2f}s  M2={per_miss[1]:.2f}s  M3={per_miss[2]:.2f}s  总和={total:.2f}s")


    uav_rank = {u:i for i,u in enumerate(UAV_LIST)}


    per_smokes_sorted = sorted(
        per_smokes,
        key=lambda x: (uav_rank[x[0]], x[8], x[3])  
    )


    smoke_no_counter = {u: 0 for u in UAV_LIST}

    cols = [
        "无人机编号",
        "无人机运动方向",
        "无人机运动速度(m/s)",
        "烟幕干扰弹编号",
        "烟幕干扰弹投放点的x坐标(m)",
        "烟幕干扰弹投放点的y坐标(m)",
        "烟幕干扰弹投放点的z坐标(m)",
        "烟幕干扰弹起爆点的x坐标(m)",
        "烟幕干扰弹起爆点的y坐标(m)",
        "烟幕干扰弹起爆点的z坐标(m)",
        "有效干扰时长(s)",
        "干扰的导弹编号",
    ]

    out_rows = []
    for (uav, m_id,t_single,t_exp,P_drop,C_exp,theta,v,t_drop,fuse) in per_smokes_sorted:
        smoke_no_counter[uav] += 1
        smoke_no = smoke_no_counter[uav]
        deg = float(np.degrees(theta) % 360.0)

        out_rows.append({
            "无人机编号": uav,
            "无人机运动方向": round(deg, 2),
            "无人机运动速度(m/s)": round(v, 2),
            "烟幕干扰弹编号": smoke_no,
            "烟幕干扰弹投放点的x坐标(m)": round(P_drop[0], 2),
            "烟幕干扰弹投放点的y坐标(m)": round(P_drop[1], 2),
            "烟幕干扰弹投放点的z坐标(m)": round(P_drop[2], 2),
            "烟幕干扰弹起爆点的x坐标(m)": round(C_exp[0], 2),
            "烟幕干扰弹起爆点的y坐标(m)": round(C_exp[1], 2),
            "烟幕干扰弹起爆点的z坐标(m)": round(C_exp[2], 2),
            "有效干扰时长(s)": round(float(t_single), 2),
            "干扰的导弹编号": int(m_id + 1),
        })

    df_out = pd.DataFrame(out_rows, columns=cols)
    with pd.ExcelWriter("result3.xlsx", engine="openpyxl", mode="w") as writer:
        df_out.to_excel(writer, sheet_name="结果", index=False)
    print("已保存到 result3.xlsx（按 UAV 序号且单机内按发射时间排序）")


    plot_convergence(bh, ah)

if __name__=="__main__":
    main()
