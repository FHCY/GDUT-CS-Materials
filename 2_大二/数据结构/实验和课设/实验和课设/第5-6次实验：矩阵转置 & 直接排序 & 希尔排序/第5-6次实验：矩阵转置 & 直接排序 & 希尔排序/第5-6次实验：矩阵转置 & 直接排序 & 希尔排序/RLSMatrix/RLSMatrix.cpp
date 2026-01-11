#include "RLSMatrix.h"

/** 
  *  给定一组下标（行, 列），求元素值；如果找不到该元素，则返回0
  */
ElemType getValue(RLSMatrix M, int r, int c)
{   // 练习1：实现本函数，返回第r行第c列元素的值
	int p = *(M.rpos + r);
	while (M.data[p].i == r && M.data[p].j < c)
		p++;
	if (M.data[p].i == r && M.data[p].j == c)
		return M.data[p].e;
	else
		return 0;

}

#define MAXSIZE 1000  // 定义矩阵中非零元素的最大数量

Status MultSMatrix(RLSMatrix M, RLSMatrix N, RLSMatrix& Q) {
    // 检查矩阵M的列数是否等于矩阵N的行数
    if (M.nu != N.mu) return ERROR;

    Q.mu = M.mu;  
    Q.nu = N.nu;  
    Q.tu = 0; 

    if (M.tu * N.tu != 0) {
        int ctemp[N.nu + 1] = {0}; 

        for (int arow = 1; arow <= M.mu; ++arow) {
            
            for (int i = 0; i <= N.nu; ++i) {
                ctemp[i] = 0;
            }
            
            
            Q.rpos[arow] = Q.tu + 1;      
            
            
            for (int p = M.rpos[arow]; p < M.rpos[arow + 1]; ++p) {
                int brow = M.data[p].j;  

                
                int t = (brow < N.nu) ? N.rpos[brow + 1] : N.tu + 1;
                
                
                for (int q = N.rpos[brow]; q < t; ++q) {
                    int ccol = N.data[q].j; 
                    
                    
                    ctemp[ccol] += M.data[p].e * N.data[q].e;
                }
            }

            
            for (int ccol = 1; ccol <= Q.nu; ++ccol) {
                if (ctemp[ccol]) {
                    if (++Q.tu > MAXSIZE) return ERROR;  
                    Q.data[Q.tu] = {arow, ccol, ctemp[ccol]};  
                }
            }
        }
    }
    return OK;
}

