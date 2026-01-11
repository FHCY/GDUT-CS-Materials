#include <stdio.h>
#include "SqList.h"

SqList creatSqListLa() {
    SqList La;
    InitList_Sq(La, 4, 10);
    Append_Sq(La, 1);
    Append_Sq(La, 3);
    Append_Sq(La, 4);
    Append_Sq(La, 8);
    return La;
}

SqList creatSqListLb() {
    SqList Lb;
    InitList_Sq(Lb, 4, 10);
    Append_Sq(Lb, 2);
    Append_Sq(Lb, 5);
    Append_Sq(Lb, 7);
    Append_Sq(Lb, 9);
    Append_Sq(Lb, 10);
    Append_Sq(Lb, 12);
    return Lb;
}

void printSqList(SqList L) {
    int i = 0;
    for (i = 0; i < L.length - 1; i++) 
    {
        printf("%d, ", L.elem[i]);
    }
    printf("%d}", L.elem[i]);
    printf("\n");
}

void MergeList_Sq(SqList La, SqList Lb, SqList& Lc);

int main() 
{
    SqList La;
    SqList Lb;
    SqList Lc;
    La = creatSqListLa();
    printf("La = {");
    printSqList(La);
    Lb = creatSqListLb();
    printf("Lb = {");
    printSqList(Lb);

    MergeList_Sq(La, Lb, Lc);
    printf("Lc = {");
    printSqList(Lc);

    return 0;
}

//练习4：将顺序表La和Lb合并为Lc
void MergeList_Sq(SqList La, SqList Lb, SqList& Lc) 
{
    int i = 0, j = 0;   
    ElemType ai, bj;
    
    InitList_Sq(Lc,La.size+Lb.size,La.increment);

    while (i < La.length && j < Lb.length)  // 表La和Lb均非空
    {      
      GetElem_Sq(La,i,ai);
      GetElem_Sq(Lb,j,bj);
	  Append_Sq(Lc,ai);
	  Append_Sq(Lc,bj);
	  i++;
	  j++;


    }

    //练习4.3：处理“La未空，但Lb已空”的情况
    while (i < La.length) { 
       GetElem_Sq(La,i,ai);
       Append_Sq(Lc,ai);
    }

    //练习4.4：处理“La已空，但Lb未空”的情况
    while (j < Lb.length) { 
       GetElem_Sq(Lb,j,bj);
       Append_Sq(Lc,bj);
    }  

}
