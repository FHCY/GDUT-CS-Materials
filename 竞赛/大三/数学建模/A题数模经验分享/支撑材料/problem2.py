import numpy as np
import random
import matplotlib.pyplot as plt


plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False


g = 9.8
sink_v = 3.
radius = 10.0
effective_time = 20.0

M0 = np.array([20000.0,0.0,2000.0])
F0 = np.array([17800.0,0.0,1800.0])
TARGET = np.array([0.0,200.0,0.0])

v_m = 300.0
u_m = -M0 / np.linalg.norm(M0)

def M(t):
    return M0+v_m*t*u_m

def dist_to_segment(P,A,B):
    AB = B - A
    AP = P - A
    denom = np.dot(AB,AB)
    if denom == 0.0:
        return np.linalg.norm(P-A)
    tau = np.dot(AP,AB) / denom
    tau = 0.0 if tau < 0.0 else (1.0 if tau > 1.0 else tau)
    Q = A+tau*AB
    return np.linalg.norm(P-Q)

def compute_cover(v_f, theta, t_drop,fuse, dt=0.05):
    u_f = np.array([np.cos(theta), np.sin(theta), 0.0])
    P_drop = F0+v_f*t_drop*u_f
    C_exp  = P_drop+v_f*fuse*u_f+np.array([0.0,0.0,-0.5*g*fuse**2])
    t_exp = t_drop+fuse
    times = np.arange(t_exp,t_exp+effective_time+1e-9, dt)
    inside = []
    for t in times:
        C_t = C_exp + np.array([0.0, 0.0, -sink_v*(t - t_exp)])
        inside.append(1 if dist_to_segment(C_t, M(t), TARGET) <= radius else 0)

    cover, run = 0.0,0
    for f in inside:
        if f: run += 1
        elif run: cover, run = max(cover,run*dt), 0
    if run: cover = max(cover,run*dt)
    return cover


POP_SIZE, GENS, MUT = 40, 100, 0.2
V_RANGE     = (70.0,140.0)
THETA_RANGE = (0.0,2*np.pi)
DROP_RANGE  = (0.0,20.0)
FUSE_RANGE  = (2.0,6.0)

def rnd_ind():
    return [random.uniform(*V_RANGE),
            random.uniform(*THETA_RANGE),
            random.uniform(*DROP_RANGE),
            random.uniform(*FUSE_RANGE)]

def mutate(ind):
    j = random.randint(0,3)
    if j==0: ind[0]=random.uniform(*V_RANGE)
    elif j==1: ind[1]=random.uniform(*THETA_RANGE)
    elif j==2: ind[2]=random.uniform(*DROP_RANGE)
    else: ind[3]=random.uniform(*FUSE_RANGE)
    return ind

def crossover(p1,p2):
    k = random.randint(1,3)
    return p1[:k]+p2[k:], p2[:k]+p1[k:]


population = [rnd_ind() for _ in range(POP_SIZE)]
best_scores, avg_scores = [], []
best_score, best_sol = -1.0,None

for gen in range(GENS):
    fitness = [compute_cover(*ind) for ind in population]
    max_f, avg_f = max(fitness), sum(fitness)/len(fitness)
    best_scores.append(max_f); avg_scores.append(avg_f)
    if max_f > best_score:
        best_score = max_f
        best_sol = population[fitness.index(max_f)]

    sel = []
    for _ in range(POP_SIZE):
        i,j = random.sample(range(POP_SIZE),2)
        sel.append(population[i] if fitness[i]>=fitness[j] else population[j])

    nxt=[]
    for i in range(0,POP_SIZE, 2):
        c1,c2 = crossover(sel[i], sel[(i+1)%POP_SIZE])
        if random.random()<MUT: c1 = mutate(c1)
        if random.random()<MUT: c2 = mutate(c2)
        nxt.extend([c1,c2])
    population = nxt[:POP_SIZE]

print(f"最大遮蔽时间 = {best_score:.2f}s, 最优解 = {best_sol}")


x = np.arange(1, GENS+1)
min_len = min(len(x), len(best_scores), len(avg_scores))
x, best_scores, avg_scores = x[:min_len], best_scores[:min_len], avg_scores[:min_len]
title = f"遗传算法收敛曲线\n最大: {max(best_scores):.3f}  平均: {np.mean(best_scores):.5f}"

plt.figure(figsize=(10,6))
plt.plot(x, best_scores, linewidth=2, color='blue', label="最佳遮蔽时间")
plt.plot(x, avg_scores,  linewidth=2, linestyle="--", color='orange', label="平均遮蔽时间")
plt.scatter(x, best_scores, s=18, color='blue',   alpha=0.5)
plt.scatter(x, avg_scores,  s=18, color='orange', alpha=0.5)
plt.xlabel("迭代次数"); plt.ylabel("遮蔽时间 (秒)")
plt.title(title);plt.grid(True);plt.legend();plt.tight_layout();plt.show()
