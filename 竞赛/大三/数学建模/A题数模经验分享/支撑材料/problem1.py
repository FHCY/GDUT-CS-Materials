import numpy as np


g = 9.8                     #重力加速度
sink_v = 3.0                 #烟幕下沉速度
radius = 10.0                #有效遮蔽半径
effective_time = 20.0         #有效遮蔽时长


M0 = np.array([20000.0, 0.0, 2000.0])   #导弹 M1 初始位置
F0 = np.array([17800.0, 0.0, 1800.0])   #无人机 FY1 初始位置
T  = np.array([0.0, 200.0, 0.0])        #真实目标位置

u_m = -M0/np.linalg.norm(M0)   #单位方向向量
v_m = 300.0                      #导弹速

def M(t):
    """导弹在时间t的位置"""
    return M0+v_m*t*u_m


u_f = np.array([-1.0,0.0,0.0])  #无人机朝向
v_f = 120.0              #无人机速度
t_drop = 1.5              #投放时间
fuse = 3.6              #起爆延时

P_drop = F0+v_f*t_drop*u_f
C_exp = P_drop+v_f*fuse*u_f+np.array([0.0,0.0,-0.5*g*fuse**2])

def C(t):
    """烟幕中心随时间下沉"""
    return C_exp + np.array([0.0,0.0,-sink_v*(t-(t_drop+fuse))])

def dist_to_segment(P,A,B):
    AB = B- A
    AP = P- A
    t = np.dot(AP,AB)/np.dot(AB,AB)
    t = max(0,min(1, t))
    Q = A+t*AB
    return np.linalg.norm(P-Q)


t_exp = t_drop + fuse
dt = 0.01
times = np.arange(t_exp,t_exp+effective_time,dt)
inside = []

for t in times:
    if dist_to_segment(C(t),M(t),T)<=radius:
        inside.append(t)
cover_time = inside[-1]-inside[0] if inside else 0
print("有效遮蔽时间: ",cover_time,"秒")
