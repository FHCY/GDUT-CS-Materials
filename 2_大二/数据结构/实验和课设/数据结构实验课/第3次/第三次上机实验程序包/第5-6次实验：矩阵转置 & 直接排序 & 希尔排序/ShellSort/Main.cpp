#include <stdio.h>
#include <stdlib.h>
#include "RcdSqList.h"

void ShellInsert(RcdSqList L, int dk) {
   // 对顺序表L作一趟希尔排序，增量为dk
   int i, j;
   for(i = 1; i<=L.length-dk; ++i)
   {       
       if(L.rcd[i+dk].key < L.rcd[i].key) //将L.rcd[i+dk]插入有序序列
       {             
           //练习1：先将记录L.rcd[i+dk]保存在空闲的0号单元
           L.rcd[0] = L.rcd[i+dk];
           
           //练习2：j指向即将插入至有序序列区的记录
           j = i+dk;
           do{ 
               //练习3：j从后往前跳动，依次指向即将被移动的记录
               j -=dk;
               L.rcd[j+dk] = L.rcd[j]; // 记录后移
           } 
           while (j-dk>0 && L.rcd[0].key < L.rcd[j - dk].key); //练习4：判断是否需要继续移动
           L.rcd[j] = L.rcd[0];
      }    
   }
   
}

void ShellSort(RcdSqList L, int d[], int t) {
    // 按增量序列d[0..t-1]对顺序表L作希尔排序。
    int i, k;
    for (k = 0; k < t; ++k)
    {
        ShellInsert(L, d[k]); //一趟增量为d[k]的插入排序 

        //----------debug code begin--------------------------------
        for (i = 1; i <= L.length; i++)
            printf("%d  ", L.rcd[i].key);
        printf("\n");
        //----------debug code end----------------------------------
    }
}

int main() {     
    int i; RcdSqList L; int d1[3] = { 5,3,1 };
    L.length = 10;
    L.rcd = (RcdType*)malloc((L.length + 1) * sizeof(RcdType));
    //L.rcd[0].key = 0;
    L.rcd[1].key = 49;    L.rcd[2].key = 38;
    L.rcd[3].key = 65;    L.rcd[4].key = 97;
    L.rcd[5].key = 76;    L.rcd[6].key = 13;
    L.rcd[7].key = 27;    L.rcd[8].key = 49;
    L.rcd[9].key = 55;    L.rcd[10].key = 11;

    for (i = 1; i <= L.length; i++) 
        printf("%d  ", L.rcd[i].key);
    printf("\n");

    ShellSort(L, d1, 3);

    for (i = 1; i <= L.length; i++) 
        printf("%d  ", L.rcd[i].key);
    printf("\n");

    return 0;
}
