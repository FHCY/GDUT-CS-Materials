import numpy as np
import random
import pandas as pd
from pathlib import Path
import time


g = 9.8
sink_v = 3.0
radius = 10.0
effective_time = 20.0

M0 = np.array([20000.0,0.0,2000.0])    # 导弹初始
F0 = np.array([17800.0,0.0,1800.0])     # 无人机初始
TARGET = np.array([0.0,200.0,0.0])     # 真目标

v_m = 300.0
u_m = -M0 / np.linalg.norm(M0)
t_hit_fake = np.linalg.norm(M0)/v_m


THETA_RANGE = (np.pi-0.55, np.pi+0.25)   
V_RANGE = (70.0,140.0)
T_RANGE = (0.0,20.0)                    
F_RANGE = (2.0,6.0)


def missile_pos_vec(t):
    t = np.asarray(t)
    return M0 + (v_m*t)[:,None]*u_m

def dist_point_to_segment_vec(P,A,B):
    AB = B[None,:]-A
    AP = P-A
    denom = np.einsum('ij,ij->i',AB,AB)
    denom = np.where(denom < 1e-12,1e-12,denom)
    tau = np.einsum('ij,ij->i', AP,AB)/denom
    tau = np.clip(tau,0.0,1.0)
    Q = A + tau[:,None]*AB
    return np.linalg.norm(P-Q,axis=1)

def one_cloud_mask(C_exp,t_exp,t_grid):
    dz = -sink_v * np.maximum(0.0,t_grid-t_exp)
    C_t = C_exp[None, :] + np.stack([np.zeros_like(t_grid),
                                     np.zeros_like(t_grid),
                                     dz], axis=1)
    valid = (t_grid >= t_exp)&(t_grid <= t_exp+effective_time)
    A = missile_pos_vec(t_grid)
    d = dist_point_to_segment_vec(C_t,A,TARGET)
    return valid & (d <= radius)

def drop_and_explode(F0,v_f, theta,t_drop,fuse):
    u_f = np.array([np.cos(theta),np.sin(theta),0.0])
    P_drop = F0+v_f*t_drop*u_f
    C_exp  = P_drop+v_f*fuse*u_f+np.array([0.0,0.0,-0.5*g*fuse**2])
    return P_drop, C_exp, (t_drop+fuse)


def evaluate_union(plan,dt=0.02):
    """
    返回：union_time（并集遮蔽时长）、per_times(三枚各自时长)、drops(明细)
    """
    theta, v_f, t1, f1, t2, f2, t3, f3 = plan

    # 硬约束
    if not (THETA_RANGE[0] <= theta <= THETA_RANGE[1]): return 0.0, [0,0,0], None
    if not (V_RANGE[0] <= v_f <= V_RANGE[1]):        return 0.0, [0,0,0], None
    if t1 < 0.0 or t2 < 1.0 or t3 < 1.0:          return 0.0, [0,0,0], None
    if not (F_RANGE[0] <= f1 <= F_RANGE[1] and F_RANGE[0] <= f2 <= F_RANGE[1] and F_RANGE[0] <= f3 <= F_RANGE[1]):
        return 0.0, [0,0,0], None

    P1, C1, Te1 = drop_and_explode(F0,v_f,theta,t1,f1)
    P2, C2, Te2 = drop_and_explode(F0,v_f,theta,t1+t2,f2)
    P3, C3, Te3 = drop_and_explode(F0,v_f,theta,t1+t2+t3,f3)

    drops = [
        {"i":1,"P":P1,"C":C1,"t_drop":t1,"t_exp":Te1,"fuse":f1},
        {"i":2,"P":P2,"C":C2,"t_drop":t1+t2,"t_exp":Te2,"fuse":f2},
        {"i":3,"P":P3,"C":C3,"t_drop":t1+t2+t3,"t_exp":Te3,"fuse":f3},
    ]

    t0 = min(Te1, Te2, Te3)
    t_end = min(t_hit_fake, max(Te1, Te2, Te3) + effective_time)
    if t_end <= t0: return 0.0, [0,0,0], drops

    t_grid = np.arange(t0,t_end+1e-9, dt)
    m1 = one_cloud_mask(C1,Te1,t_grid)
    m2 = one_cloud_mask(C2,Te2,t_grid)
    m3 = one_cloud_mask(C3,Te3,t_grid)

    per = [float(m1.sum()*dt), float(m2.sum()*dt), float(m3.sum()*dt)]
    union_time = float(( m1 | m2 | m3 ).sum() * dt)
    return union_time, per, drops


def rand_plan():
    return [
        random.uniform(*THETA_RANGE),
        random.uniform(*V_RANGE),
        random.uniform(*T_RANGE),                 
        random.uniform(*F_RANGE),                 
        1.0 + random.uniform(0.0,T_RANGE[1]),   
        random.uniform(*F_RANGE),                 
        1.0 + random.uniform(0.0,T_RANGE[1]),   
        random.uniform(*F_RANGE),                 
    ]

def seed_candidates(n=260):
    seeds=[]
    for _ in range(n):
        theta = np.random.normal(loc=np.pi-0.12,scale=0.18)
        theta = float(np.clip(theta, *THETA_RANGE))
        v_f   = float(np.clip(np.random.normal(118,16), *V_RANGE))
        t1    = random.uniform(0.10,6.0)
        f1    = random.uniform(2.3,4.9)
        t2    = 1.0 + random.uniform(0.8,9.0)
        f2    = random.uniform(2.3,4.9)
        t3    = 1.0 + random.uniform(0.8,9.0)
        f3    = random.uniform(2.3,4.9)
        seeds.append([theta, v_f,t1,f1,t2,f2,t3,f3])
    return seeds

def polish(base_plan,iters=420,dt=0.02):
    """
    局部随机坐标扰动 + 接受改进（只要并集更大就接受）
    退火缩步：每80步缩 0.6 倍
    记录：best_hist（到目前为止的最佳并集）、avg_hist（累计平均并集）
    """
    best = np.array(base_plan,dtype=float)
    best_union,best_per,best_drops = evaluate_union(best, dt=dt)


    best_hist = [best_union]
    cum_values = [best_union]
    avg_hist  = [np.mean(cum_values)]

    step = np.array([0.12,4.0,0.8,0.45,0.9,0.45,0.9,0.45])
    for k in range(iters):
        cand = best.copy()
        j = np.random.randint(0, 8)
        cand[j] += np.random.uniform(-1, 1) * step[j]
        # 边界
        cand[0] = float(np.clip(cand[0],*THETA_RANGE))
        cand[1] = float(np.clip(cand[1],*V_RANGE))
        cand[2] = float(np.clip(cand[2],*T_RANGE))
        cand[3] = float(np.clip(cand[3],*F_RANGE))
        cand[4] = float(max(1.0, min(cand[4],T_RANGE[1]+1.0)))
        cand[5] = float(np.clip(cand[5],*F_RANGE))
        cand[6] = float(max(1.0, min(cand[6], T_RANGE[1]+1.0)))
        cand[7] = float(np.clip(cand[7],*F_RANGE))

        union_c, per_c, drops_c = evaluate_union(cand, dt=dt)
        cum_values.append(union_c)
        avg_hist.append(float(np.mean(cum_values)))

        if union_c > best_union:
            best, best_union, best_per, best_drops = cand, union_c, per_c, drops_c
        best_hist.append(best_union)

        if (k+1) % 80 == 0:
            step *= 0.6

    union_c, per_c, drops_c = evaluate_union(best,dt=0.01)
    cum_values.append(union_c)
    avg_hist.append(float(np.mean(cum_values)))
    if union_c > best_union:
        best_union, best_per, best_drops = union_c,per_c,drops_c
    best_hist.append(best_union)

    return best.tolist(),best_union,best_per,best_drops,best_hist,avg_hist


def plot_convergence(best_hist,avg_hist):
    import matplotlib.pyplot as plt
    import matplotlib
    matplotlib.rcParams['font.sans-serif'] = ['SimHei','Microsoft YaHei','Arial Unicode MS']
    matplotlib.rcParams['axes.unicode_minus'] = False

    x = np.arange(len(best_hist))
    plt.figure(figsize=(8.6, 5.0),dpi=110)
    plt.scatter(x,best_hist, s=18,label="最佳遮蔽时间",alpha=0.9)
    plt.scatter(x,avg_hist,  s=18,label="平均遮蔽时间",alpha=0.9)

    title = f"迭代收敛曲线\n最大：{max(best_hist):.3f}   平均：{avg_hist[-1]:.5f}"
    plt.title(title,fontsize=14)
    plt.xlabel("迭代次数",fontsize=12)
    plt.ylabel("遮蔽时间（秒）",fontsize=12)
    plt.grid(True, linestyle="--",alpha=0.4)
    plt.legend()
    plt.tight_layout()
    plt.show()


def main():
    seeds = seed_candidates(260)
    scored = []
    for s in seeds:
        u, _, _ = evaluate_union(s,dt=0.04)
        scored.append((u, s))
    scored.sort(key=lambda x: x[0],reverse=True)
    pool = [x[1] for x in scored[:36]]

    best_plan, best_union, best_per, best_drops = None,-1.0,None,None
    best_hist_for_plot, avg_hist_for_plot = None,None
    for p in pool:
        cand, uni, per, dr, bh, ah = polish(p,iters=420,dt=0.02)
        if uni > best_union:
            best_plan, best_union, best_per, best_drops = cand,uni,per,dr
            best_hist_for_plot, avg_hist_for_plot = bh,ah

    final_u, final_per, final_drops = evaluate_union(best_plan,dt=0.01)
    if final_u > best_union:
        best_union, best_per, best_drops = final_u, final_per, final_drops
    if best_hist_for_plot is not None and avg_hist_for_plot is not None:
        best_hist_for_plot.append(best_union)
        avg_hist_for_plot.append(float(np.mean(avg_hist_for_plot + [best_union])))

    theta, v_f, *_ = best_plan
    deg = float(np.degrees(theta) % 360.0)  
    print("\n【最终最优策略（MaxUnion）】")
    print(f"无人机运动方向 = {deg:.2f}°")
    print(f"速度 v_f = {v_f:.2f} m/s")
    print(f"单枚遮蔽时间：{[round(x,2) for x in best_per]} s")
    print(f"三枚烟幕弹总遮蔽时间（并集） = {best_union:.2f} s")


    cols = [
        "无人机运动方向",
        "无人机运动速度(m/s)",
        "烟幕干扰弹编号",
        "烟幕干扰弹投放点的x坐标(m)",
        "烟幕干扰弹投放点的y坐标(m)",
        "烟幕干扰弹投放点的z坐标(m)",
        "烟幕干扰弹起爆点的x坐标(m)",
        "烟幕干扰弹起爆点的y坐标(m)",
        "烟幕干扰弹起爆点的z坐标(m)",
        "有效干扰时长(s)"
    ]

    rows = []
    for d, per_t in zip(best_drops,best_per):
        rows.append({
            "无人机运动方向": round(deg,2),
            "无人机运动速度(m/s)": round(v_f,2),
            "烟幕干扰弹编号": d["i"],
            "烟幕干扰弹投放点的x坐标(m)": round(d["P"][0],2),
            "烟幕干扰弹投放点的y坐标(m)": round(d["P"][1],2),
            "烟幕干扰弹投放点的z坐标(m)": round(d["P"][2],2),
            "烟幕干扰弹起爆点的x坐标(m)": round(d["C"][0],2),
            "烟幕干扰弹起爆点的y坐标(m)": round(d["C"][1],2),
            "烟幕干扰弹起爆点的z坐标(m)": round(d["C"][2],2),
            "有效干扰时长(s)": round(per_t,2)
        })
    df_out = pd.DataFrame(rows,columns=cols)


    note = "注：以x轴为正向，逆时针方向为正，取值0~360（度）。"
    note_row = {c: "" for c in cols}
    note_row[cols[0]] = note
    df_out = pd.concat([df_out, pd.DataFrame([note_row])],ignore_index=True)


    save_template_only(df_out,"result1.xlsx")


    if best_hist_for_plot is not None and avg_hist_for_plot is not None:
        plot_convergence(best_hist_for_plot, avg_hist_for_plot)


def save_template_only(df_out, out_path="result1.xlsx"):
    out_path = Path(out_path)
    try:
        with pd.ExcelWriter(out_path,engine="openpyxl",mode="w") as writer:
            df_out.to_excel(writer,sheet_name="结果",index=False)
        print(f"\n已保存到文件：{out_path.resolve()}")
    except PermissionError:
        ts = time.strftime("%Y%m%d_%H%M%S")
        alt_path = out_path.with_name(f"{out_path.stem}_{ts}{out_path.suffix}")
        with pd.ExcelWriter(alt_path, engine="openpyxl", mode="w") as writer:
            df_out.to_excel(writer, sheet_name="结果", index=False)
        print(f"\n原文件被占用，改名保存到：{alt_path.resolve()}")

if __name__ == "__main__":
    main()
