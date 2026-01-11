import numpy as np
import matplotlib.pyplot as plt
import random
import test2p as m

plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False


 


def find_baseline_best(seed_n=260,top_k=36,iters=420):
    """
    复用 test2p.py 的搜索与polish流程，求基准参数下的一套最优plan
    """

    np.random.seed(42)
    random.seed(42)

    seeds = m.seed_candidates(seed_n)
    scored = []
    for s in seeds:
        u, _, _ = m.evaluate_union(s,dt=0.04)
        scored.append((u, s))
    scored.sort(key=lambda x:x[0],reverse=True)
    pool = [x[1] for x in scored[:top_k]]

    best_plan, best_union = None, -1.0
    for p in pool:
        cand, uni, _, _ = m.polish(p,iters=iters,dt=0.02)
        if uni > best_union:
            best_plan, best_union = cand, uni


    final_u, _, _ = m.evaluate_union(best_plan,dt=0.01)
    if final_u > best_union:
        best_union = final_u
    return best_plan,best_union


def sensitivity_curve(best_plan,which_param,base_value,pct_span=0.05,n_pts=21):
    """
    在固定best_plan下，让 which_param 在 [1-5%, 1+5%] 连续扰动
    返回：x(百分比%), y(有效遮蔽时间s)
    which_param ∈ {'R_s','v_s','v_m'}
    """

    percents = np.linspace(-pct_span,+pct_span,n_pts)
    times = []


    orig_radius = m.radius
    orig_sink_v = m.sink_v
    orig_v_m = m.v_m

    for p in percents:

        if which_param == 'R_s':
            m.radius = base_value*(1.0+p)
        elif which_param == 'v_s':
            m.sink_v = base_value*(1.0+p)
        elif which_param == 'v_m':
            m.v_m = base_value*(1.0+p)
            m.t_hit_fake = np.linalg.norm(m.M0)/m.v_m


        union_time, _, _ = m.evaluate_union(best_plan,dt=0.01)
        times.append(union_time)


    m.radius = orig_radius
    m.sink_v = orig_sink_v
    m.v_m = orig_v_m
    m.t_hit_fake = np.linalg.norm(m.M0)/m.v_m

    return percents*100.0,np.array(times)


if __name__ == "__main__":
    R_s0 = 10.0     #烟幕半径
    v_s0 = 3.0      #下沉速度
    v_m0 = 300.0    #导弹速度

    m.radius = R_s0
    m.sink_v = v_s0
    m.v_m = v_m0
    m.t_hit_fake = np.linalg.norm(m.M0)/m.v_m


    best_plan, base_union = find_baseline_best()
    print("基准环境下的并集遮蔽时间（s）：", round(base_union,3))
    print("最优策略参数（theta, v_f,t1,f1,t2,f2,t3,f3）：")
    print([round(x, 4) for x in best_plan])


    x_Rs, y_Rs = sensitivity_curve(best_plan,'R_s', R_s0,pct_span=0.05,n_pts=21)
    x_vs, y_vs = sensitivity_curve(best_plan,'v_s', v_s0,pct_span=0.05,n_pts=21)
    x_vm, y_vm = sensitivity_curve(best_plan,'v_m', v_m0,pct_span=0.05,n_pts=21)


    plt.figure(figsize=(10, 6))
    plt.plot(x_Rs,y_Rs,marker='o',label='烟幕半径 $R_s$')
    plt.plot(x_vs,y_vs,marker='s',label='下沉速度 $v_s$')
    plt.plot(x_vm,y_vm,marker='^',label='导弹速度 $v_m$')

    plt.xlabel('参数变化百分比 (%)',fontsize=12)
    plt.ylabel('有效遮蔽时间 (s)',fontsize=12)
    plt.title('问题二非线性优化模型的灵敏度分析（策略固定）',fontsize=14)
    plt.grid(True,alpha=0.35)
    plt.legend()
    plt.tight_layout()
    plt.show()
