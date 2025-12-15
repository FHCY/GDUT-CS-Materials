#include <stdlib.h>

typedef int ElemType;
typedef struct {
  int i, j ; // 非零元的行和列
  ElemType e; // 非零元的值
} Triple;

typedef struct {
  Triple *data;  // 非零元三元组表，0号单元未用
  int mu, nu, tu; // 矩阵的行数、列数和非零元个数
} TSMatrix;

#define OVERFLOW -1
#define OK 1
#define ERROR 0
#define TRUE 2
#define FALSE -2

typedef int Status;


Status FastTransposeSMatrix(TSMatrix M, TSMatrix& T);


