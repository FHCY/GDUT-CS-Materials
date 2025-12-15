#include "RLSMatrix.h"

/** 
  *  给定一组下标（行, 列），求元素值
  */
ElemType getValue(RLSMatrix M, int r, int c)
{   // 练习1：实现本函数，返回第r行第c列元素的值
	int p;
	p = M.rpos[r];
	while (M.data[p].i == r && M.data[p].j < c)
		p++;
	if (M.data[p].i == r && M.data[p].j == c)
		return M.data[p].e;
	else
	return 0;  // This is temporary code. Modify it if necessary.
}

Status MultSMatrix(RLSMatrix M, RLSMatrix N, RLSMatrix& Q)
// 练习2：实现本函数，将矩阵M和N相乘，结果为矩阵Q
Status CreateSMatrix_M1(RLSMatrix& M) { // 创建稀疏矩阵M
    M.tu = 4;

    M.data = (Triple*)malloc(sizeof(Triple) * (M.tu + 1));
    if (NULL == M.data)
        return OVERFLOW;
    M.data[1].i = 1;
    M.data[1].j = 1;
    M.data[1].e = 3;

    M.data[2].i = 1;
    M.data[2].j = 4;
    M.data[2].e = 5;

    M.data[3].i = 2;
    M.data[3].j = 2;
    M.data[3].e = -1;

    M.data[4].i = 3;
    M.data[4].j = 1;
    M.data[4].e = 2;

    M.mu = 3;
    M.nu = 4;

    M.rpos = (int*)malloc((M.mu + 1) * sizeof(int));
    *(M.rpos + 1) = 1;
    *(M.rpos + 2) = 3;
    *(M.rpos + 3) = 4;

    return OK;
}
Status CreateSMatrix_N1(RLSMatrix& N) { // 创建稀疏矩阵N
    N.tu = 4;

    N.data = (Triple*)malloc(sizeof(Triple) * (N.tu + 1));
    if (NULL == N.data)
        return OVERFLOW;
    N.data[1].i = 1;
    N.data[1].j = 2;
    N.data[1].e = 2;

    N.data[2].i = 2;
    N.data[2].j = 1;
    N.data[2].e = 1;

    N.data[3].i = 3;
    N.data[3].j = 1;
    N.data[3].e = -2;

    N.data[4].i = 3;
    N.data[4].j = 2;
    N.data[4].e = 4;

    N.mu = 4;
    N.nu = 2;

    N.rpos = (int*)malloc((N.mu + 1) * sizeof(int));
    *(N.rpos + 1) = 1;
    *(N.rpos + 2) = 2;
    *(N.rpos + 3) = 3;
    *(N.rpos + 4) = 5;

    return OK;
}





