import numpy as np
import random
import pandas as pd
from pathlib import Path
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False


g = 9.8
sink_v = 3.0
radius = 10.0
effective_time = 20.0

M0 = np.array([20000.0,0.0,2000.0])      #导弹初始
TARGET = np.array([0.0,200.0,0.0])         #真目标
FAKE_TARGET = np.array([0.0,0.0,0.0])    #假目标

FY = {
    "FY1": np.array([17800.0,0.0,1800.0]),
    "FY2": np.array([12000.0,1400.0,1400.0]),
    "FY3": np.array([6000.0,-3000.0,700.0]),
}

v_m = 300.0
u_m = (FAKE_TARGET-M0)/np.linalg.norm(FAKE_TARGET-M0)
t_hit_fake = np.linalg.norm(M0-FAKE_TARGET)/v_m

THETA_RANGE = (0.0,2*np.pi)
V_RANGE = (70.0,140.0)
T_RANGE = (0.0,20.0)
F_RANGE = (2.0,6.0)


def missile_pos_vec(t):
    t = np.asarray(t)
    return M0 + (v_m*t)[:, None]*u_m

def dist_point_to_segment_vec(P,A,B):
    AB = B[None, :]-A
    AP = P-A
    denom = np.einsum("ij,ij->i",AB,AB)
    denom = np.where(denom < 1e-12,1e-12,denom)
    tau = np.einsum("ij,ij->i",AP,AB)/denom
    tau = np.clip(tau,0.0,1.0)
    Q = A+tau[:, None]*AB
    return np.linalg.norm(P-Q,axis=1)

def one_cloud_mask(C_exp,t_exp,t_grid):
    dz = -sink_v*np.maximum(0.0,t_grid-t_exp)
    C_t = C_exp[None, :]+np.stack([
        np.zeros_like(t_grid),
        np.zeros_like(t_grid),
        dz
    ], axis=1)
    valid = (t_grid >= t_exp)&(t_grid <= t_exp + effective_time)
    A = missile_pos_vec(t_grid)
    d = dist_point_to_segment_vec(C_t, A, TARGET)
    return valid & (d <= radius)

def drop_and_explode(F0, v_f, theta, t_drop, fuse):
    u_f = np.array([np.cos(theta), np.sin(theta), 0.0])
    P_drop = F0 + v_f * t_drop * u_f
    C_exp  = P_drop+v_f*fuse*u_f+np.array([0.0,0.0,-0.5*g*fuse**2])
    return P_drop,C_exp, (t_drop+fuse)


def evaluate_union_3(plan12,dt=0.02):
    th1,v1,t1,f1, th2,v2,t2,f2, th3,v3,t3,f3 = plan12
    for v in (v1,v2,v3):
        if not (V_RANGE[0] <= v <= V_RANGE[1]): return 0,[0,0,0],None

    P1,C1,Te1 = drop_and_explode(FY["FY1"], v1,th1,t1,f1)
    P2,C2,Te2 = drop_and_explode(FY["FY2"], v2,th2,t2,f2)
    P3,C3,Te3 = drop_and_explode(FY["FY3"], v3,th3,t3,f3)

    drops = [P1,C1,Te1],[P2,C2,Te2],[P3,C3,Te3]
    t0 = min(Te1,Te2,Te3)
    tend = min(t_hit_fake, max(Te1,Te2,Te3)+effective_time)
    if tend <= t0: return 0,[0,0,0],drops

    t_grid = np.arange(t0, tend+1e-9, dt)
    m1 = one_cloud_mask(C1,Te1,t_grid)
    m2 = one_cloud_mask(C2,Te2,t_grid)
    m3 = one_cloud_mask(C3,Te3,t_grid)
    per=[float(m1.sum()*dt), float(m2.sum()*dt), float(m3.sum()*dt)]
    union=float((m1|m2|m3).sum()*dt)
    return union,per,drops


def backsolve_seed(F0):
    t_star = random.uniform(5.0,25.0)
    A = missile_pos_vec(np.array([t_star]))[0]
    B = TARGET
    AB = B-A
    tau = np.dot(F0-A,AB)/np.dot(AB,AB)
    tau = np.clip(tau,0,1)
    Q = A + tau*AB
    base_theta = np.arctan2(Q[1]-F0[1],Q[0]-F0[0])
    theta = float((base_theta + np.random.normal(0,0.2))%(2*np.pi))
    v = random.uniform(*V_RANGE)
    fuse = random.uniform(*F_RANGE)
    t_drop = max(0.0,t_star-fuse)
    return [theta,v,t_drop,fuse]

def seed_candidates(n=100):
    seeds=[]
    for _ in range(n):
        vals=[]
        for name in ("FY1","FY2","FY3"):
            vals+=backsolve_seed(FY[name])
        seeds.append(vals)
    return seeds


def crossover(p1,p2):
    point=random.randint(1,len(p1)-2)
    return p1[:point]+p2[point:],p2[:point]+p1[point:]

def mutate(ind,rate=0.2):
    for j in range(len(ind)):
        if random.random()<rate:
            if j%4==0: ind[j]=(ind[j]+random.uniform(-0.3,0.3))%(2*np.pi)
            elif j%4==1: ind[j]=random.uniform(*V_RANGE)
            elif j%4==2: ind[j]=random.uniform(*T_RANGE)
            else: ind[j]=random.uniform(*F_RANGE)
    return ind

def genetic(n_gen=40,pop_size=80):
    pop=seed_candidates(pop_size)
    best=None; best_val=-1
    best_hist=[]; avg_hist=[]
    for g in range(n_gen):
        scored=[(evaluate_union_3(ind,dt=0.04)[0],ind) for ind in pop]
        scored.sort(key=lambda x:x[0],reverse=True)
        vals=[s for s,_ in scored]
        avg_hist.append(np.mean(vals))
        best_hist.append(vals[0])
        if scored[0][0]>best_val:
            best_val,best=scored[0]
        elites=[ind for _,ind in scored[:10]]
        new_pop=elites.copy()
        while len(new_pop)<pop_size:
            p1,p2=random.sample(elites,2)
            c1,c2=crossover(p1.copy(),p2.copy())
            new_pop.append(mutate(c1))
            if len(new_pop)<pop_size: new_pop.append(mutate(c2))
        pop=new_pop
    return best,best_hist,avg_hist


def plot_convergence(best_hist, avg_hist):
    plt.figure(figsize=(8,5),dpi=110)
    plt.plot(best_hist,label="最优值",marker="o")
    plt.plot(avg_hist,label="平均值",marker="x")
    plt.xlabel("迭代代数")
    plt.ylabel("遮蔽时间 (s)")
    max_val = max(best_hist)
    max_gen = int(np.argmax(best_hist))
    plt.title(f"遗传算法收敛曲线 (最大遮蔽时间 = {max_val:.2f} s)")
    plt.grid(True,ls="--",alpha=0.5)
    plt.legend()

    plt.annotate(f"{max_val:.2f} s",
                 xy=(max_gen, max_val),
                 xytext=(max_gen, max_val+0.5),
                 arrowprops=dict(arrowstyle="->",color="red"),
                 ha="center",color="red")
    plt.tight_layout()
    plt.show()


def main():
    best_plan,best_hist,avg_hist=genetic(n_gen=60,pop_size=120)
    best_union,best_per,best_drops=evaluate_union_3(best_plan,dt=0.01)
    print("\n【问题四 最优策略】")
    for name,(P,C,Te),per in zip(("FY1","FY2","FY3"),best_drops,best_per):
        print(f"{name}: 遮蔽={per:.2f}s 起爆={Te:.2f}")
    print("并集遮蔽时间=",best_union)


    th1,v1,t1,f1, th2,v2,t2,f2, th3,v3,t3,f3 = best_plan
    items = [
        ("FY1",th1,v1,best_drops[0],best_per[0]),
        ("FY2",th2,v2,best_drops[1],best_per[1]),
        ("FY3",th3,v3,best_drops[2],best_per[2]),
    ]

    cols = [
        "无人机编号",
        "无人机运动方向",
        "无人机运动速度(m/s)",
        "烟幕干扰弹投放点的x坐标(m)",
        "烟幕干扰弹投放点的y坐标(m)",
        "烟幕干扰弹投放点的z坐标(m)",
        "烟幕干扰弹起爆点的x坐标(m)",
        "烟幕干扰弹起爆点的y坐标(m)",
        "烟幕干扰弹起爆点的z坐标(m)",
        "有效干扰时长(s)"
    ]

    out_rows = []
    for name, th, v, (P, C, Te), per in items:
        deg = float(np.degrees(th) % 360.0)
        out_rows.append({
            "无人机编号": name,
            "无人机运动方向": round(deg, 2),
            "无人机运动速度(m/s)": round(v, 2),
            "烟幕干扰弹投放点的x坐标(m)": round(P[0],2),
            "烟幕干扰弹投放点的y坐标(m)": round(P[1],2),
            "烟幕干扰弹投放点的z坐标(m)": round(P[2],2),
            "烟幕干扰弹起爆点的x坐标(m)": round(C[0],2),
            "烟幕干扰弹起爆点的y坐标(m)": round(C[1],2),
            "烟幕干扰弹起爆点的z坐标(m)": round(C[2],2),
            "有效干扰时长(s)": round(per,2)
        })

    df_out = pd.DataFrame(out_rows,columns=cols)
    with pd.ExcelWriter("result2.xlsx",engine="openpyxl",mode="w") as writer:
        df_out.to_excel(writer, sheet_name="结果",index=False)
    print("已保存为 result2.xlsx（格式与截图一致，仅此一张表）")


    plot_convergence(best_hist,avg_hist)

if __name__=="__main__":
    main()
