#include <stdio.h>
#include "RLSMatrix.h"
    
/*
    3   0   0   5
    0  -1   0   0
    2   0   0   0

   mu = 3; nu = 4; tu = 4
*/
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

/*
    0   2
    1   1
   -2   4
    0   0

   mu = 4; nu = 2; tu = 4
*/
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

/*
    3   0   1   5
    0  -1   0   0
    2   0   0   0

   mu = 3; nu = 4; tu = 5
*/
Status CreateSMatrix_M2(RLSMatrix& M) { // 创建稀疏矩阵M
    M.tu = 5;

    M.data = (Triple*)malloc(sizeof(Triple) * (M.tu + 1));
    if (NULL == M.data)
        return OVERFLOW;
    M.data[1].i = 1;
    M.data[1].j = 1;
    M.data[1].e = 3;

    M.data[2].i = 1;
    M.data[2].j = 3;
    M.data[2].e = 1;

    M.data[3].i = 1;
    M.data[3].j = 4;
    M.data[3].e = 5;

    M.data[4].i = 2;
    M.data[4].j = 2;
    M.data[4].e = -1;

    M.data[5].i = 3;
    M.data[5].j = 1;
    M.data[5].e = 2;

    M.mu = 3;
    M.nu = 4;

    M.rpos = (int*)malloc((M.mu + 1) * sizeof(int));
    *(M.rpos + 1) = 1;
    *(M.rpos + 2) = 4;
    *(M.rpos + 3) = 5;

    return OK;
}

/*
    0   2   6
    1   0   0
   -2   4   0
    0   0   0

   mu = 4; nu = 3; tu = 5
*/
Status CreateSMatrix_N2(RLSMatrix& N) { // 创建稀疏矩阵N
    N.tu = 5;

    N.data = (Triple*)malloc(sizeof(Triple) * (N.tu + 1));
    if (NULL == N.data)
        return OVERFLOW;
    N.data[1].i = 1;
    N.data[1].j = 2;
    N.data[1].e = 2;

    N.data[2].i = 1;
    N.data[2].j = 3;
    N.data[2].e = 6;

    N.data[3].i = 2;
    N.data[3].j = 1;
    N.data[3].e = 1;

    N.data[4].i = 3;
    N.data[4].j = 1;
    N.data[4].e = -2;

    N.data[5].i = 3;
    N.data[5].j = 2;
    N.data[5].e = 4;

    N.mu = 4;
    N.nu = 3;

    N.rpos = (int*)malloc((N.mu + 1) * sizeof(int));
    *(N.rpos + 1) = 1;
    *(N.rpos + 2) = 3;
    *(N.rpos + 3) = 4;
    *(N.rpos + 4) = 6;

    return OK;
}

int main() {     
    RLSMatrix M1;
    RLSMatrix N1;
    RLSMatrix Q1;
    CreateSMatrix_M1(M1);
    CreateSMatrix_N1(N1);
   
    ////1. 获取某个元素的值，
      //1.1 预期结果：-1
    ElemType value_M = getValue(M1, 2, 2);
    printf("%d\n", value_M);
    
     //1.2  预期结果：0
    ElemType value_N = getValue(N1, 2, 2);
    printf("%d\n", value_N);

    ////2. 矩阵相乘
      //2.1 预期结果： 3*2矩阵，(1, 2, 6), (2, 1, -1), (3, 2, 4)
    MultSMatrix(M1, N1, Q1);


      //2.2 预期结果： 3*3矩阵，(1, 1, -2), (1, 2, 10), (1, 3, 18), (2, 1, -1), (3, 2, 4), (3, 3, 12)
    RLSMatrix M2;
    RLSMatrix N2;
    RLSMatrix Q2;
    CreateSMatrix_M2(M2);
    CreateSMatrix_N2(N2);
    
    MultSMatrix(M2, N2, Q2);

    return 0;
}
