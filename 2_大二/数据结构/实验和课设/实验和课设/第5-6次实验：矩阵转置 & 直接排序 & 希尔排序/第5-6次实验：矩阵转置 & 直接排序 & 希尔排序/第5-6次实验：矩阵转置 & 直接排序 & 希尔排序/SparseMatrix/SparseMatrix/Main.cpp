#include <stdio.h>
#include "SparseMatrix.h"

/*
0  14   0   0  -5
0  -7   0   0   0
36   0   0  28   0

mu = 3; nu = 5; tu = 5
*/
Status CreateSMatrix(TSMatrix& M) { // ¥¥Ω®œ° Ëæÿ’ÛM
    M.tu = 5;

    M.data = (Triple*)malloc(sizeof(Triple) * (M.tu + 1));
    if (NULL == M.data)
        return OVERFLOW;
    M.data[1].i = 1;
    M.data[1].j = 2;
    M.data[1].e = 14;

    M.data[2].i = 1;
    M.data[2].j = 5;
    M.data[2].e = -5;

    M.data[3].i = 2;
    M.data[3].j = 2;
    M.data[3].e = -7;

    M.data[4].i = 3;
    M.data[4].j = 1;
    M.data[4].e = 36;

    M.data[5].i = 3;
    M.data[5].j = 4;
    M.data[5].e = 28;

    M.mu = 3;
    M.nu = 5;

    return OK;
}

int main() {     
   TSMatrix M;        
   TSMatrix T;
   CreateSMatrix(M);
   FastTransposeSMatrix(M, T);
   
   printf("\n");

   return 0;
}
