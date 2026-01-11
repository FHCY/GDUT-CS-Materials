#include <stdlib.h>

typedef int ElemType;
typedef struct {
  int i, j ; // 非零元的行和列
  ElemType e; // 非零元的值
} Triple;

typedef struct {
  Triple *data;  // 非零元三元组表，0号单元未用
  int* rpos; // 指示各行的起始位置
  int mu, nu, tu; // 矩阵的行数、列数和非零元个数
} RLSMatrix;

#define OVERFLOW -1
#define OK 1
#define ERROR 0
#define TRUE 2
#define FALSE -2

typedef int Status;

ElemType getValue(RLSMatrix M, int r, int c);
Status MultSMatrix(RLSMatrix M, RLSMatrix N, RLSMatrix& Q);

