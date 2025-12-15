#include "RLSMatrix.h"
#include<stdio.h>

ElemType getValue(RLSMatrix M, int r, int c) // 练习1：实现本函数，返回第r行第c列元素的值
{	
	int pos = M.rpos[r];
	while (M.data[pos].i == r && M.data[pos].j != c)
		pos++;
	
	if (M.data[pos].i == r && M.data[pos].j == c)
		return M.data[pos].e;
	return 0;
}


Status MultSMatrix(RLSMatrix M, RLSMatrix N, RLSMatrix& Q)    // 练习2：实现本函数，将矩阵M和N相乘，结果为矩阵Q
{
	if (M.nu != N.mu || M.tu == 0 || N.tu == 0)
		return ERROR;

	Q.mu = M.mu;
	Q.nu = N.nu;
	Q.tu = 1;
	Q.data = NULL;
	Q.rpos = (int*)malloc((Q.mu+1) * sizeof(int));
	if (Q.rpos == NULL)
		return OVERFLOW;
	for (int i = 0; i <= Q.mu; i++)
		Q.rpos[i] = -1;

	int* ctemp = (int*)malloc((Q.nu+1) * sizeof(int));
	for (int j = 1; j <= Q.nu; j++)
		ctemp[j] = 0;
		
	for (int p = 1; p <= M.tu; p++)
	{
		//当遍历到M的新一行时，将上一行结果保存，并将ctemp清零
		if (p!=1 && M.data[p].i != M.data[p - 1].i)
		{
			Q.rpos[M.data[p - 1].i] = Q.tu;
			for (int j = 1; j <= Q.nu; j++)
			{
				if (ctemp[j] == 0)
					continue;
				Triple* temp = (Triple*)realloc(Q.data, (Q.tu + 1) * sizeof(Triple));
				if (temp == NULL)
					return OVERFLOW;
				Q.data = temp;
				Q.data[Q.tu++] = { M.data[p - 1].i, j, ctemp[j] };
				ctemp[j] = 0;
			}
		}

		//遍历N的第M.data[p].j行
		for (int q = N.rpos[M.data[p].j]; N.data[q].i == M.data[p].j; q++)
		{
			ctemp[N.data[q].j] += M.data[p].e * N.data[q].e;
		}
	}
	//额外处理M的最后一行
	int p = M.tu + 1;
	Q.rpos[M.data[p - 1].i] = Q.tu;
	for (int j = 1; j <= Q.nu; j++)
	{
		if (ctemp[j] == 0)
			continue;
		Triple* temp = (Triple*)realloc(Q.data, (Q.tu + 1) * sizeof(Triple));
		if (temp == NULL)
			return OVERFLOW;
		Q.data = temp;
		Q.data[Q.tu++] = { M.data[p - 1].i, j, ctemp[j] };
		ctemp[j] = 0;
	}
	Q.tu--;

	/*
	for (int i = 1; i <= M.mu; i++)
	{
		for (int j = 1; j <= N.nu; j++)
		{
			ElemType sum = 0;
			for (int k = 1; k <= M.nu; k++)
				sum += getValue(M, i, k) * getValue(N, k, j);
			if (sum != 0)
			{
				Triple node;
				node.i = i;
				node.j = j;
				node.e = sum;
				Q.tu++;
				Triple* temp = (Triple*)realloc(Q.data,(Q.tu+1)*sizeof(Triple));
				if (temp == NULL)
					return OVERFLOW;
				Q.data = temp;
				Q.data[Q.tu] = node;
				if (Q.rpos[i] == -1)
					Q.rpos[i] = Q.tu;
			}
		}
		if (Q.rpos[i] == -1)
			Q.rpos[i] = Q.tu;
	}
	*/

	return OK;
}
