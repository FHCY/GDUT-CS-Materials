#include <stdio.h>
#include <stdlib.h>
#include "KeysSqList.h"

void RadixPass(KeysRcdType rcd[], KeysRcdType rcd1[], 
               int n, int i,
               int count[], int pos[], 
               int radix) {
// 一趟计数基数排序。对数组rcd中记录关键字的第i位计数，计算得到起始位置数组pos[]
// 并按照pos数组将数组rcd 中记录复制到数组rcd1中
    int k,j;
    for (k = 1; k <= n; k++)//练习1：初始化count数组，对单个关键字的各种取值计数
        count[rcd[k].keys[i]]++;
        /*Add your code here*/ 
    pos[0] = 1;
    for (j = 1; j < radix; ++j)//练习2：初始化pos数组，求相同关键字（指单个）的起始位置
        pos[j] = count[j - 1] + pos[j - 1];
        /*Add your code here*/ 
    
    for(k = 1; k <= n; ++k) 
	{  //练习3：收集：即根据pos数组，将关键字放置在“合适的”位置
        j = rcd[k].keys[i];    // Add your notes here
        rcd1[pos[j]++] = rcd[k];
        // Add your code here   
    }
}

int RadixSort(KeysSqList* L) { // 对顺序表 L 进行计数基数排序   
    KeysRcdType* rcd1;
    int i = 0, j, k;
    int* count, * pos;
    count = (int*)malloc(L->radix * sizeof(int));
    pos = (int*)malloc(L->radix * sizeof(int));
    rcd1 = (KeysRcdType*)malloc((L->length + 1) * sizeof(KeysRcdType));
    if (NULL == count || NULL == pos || NULL == rcd1)
        return 0;

    while (i < L->digitNum) {
        for (j = 0; j < L->radix; ++j)count[j] = 0;
        if (0 == i % 2)  //对L.rcd进行一趟基数排序，结果存入rcd1
            RadixPass(L->rcd, rcd1, L->length, i++, count, pos, L->radix);
        else //练习4：对rcd1进行一趟基数排序，结果存入L.rcd
            RadixPass(rcd1, L->rcd, L->length, i++, count, pos, L->radix);
        /*Add your code here*/



        //-----------------test code begin---------------------------------------  
        printf("第%d趟排序：\n", i);
        if (1 == i % 2)
        {
            for (k = 1; k <= L->length; k++)
                printf("%d  %d  %d\n", rcd1[k].keys[2], rcd1[k].keys[1], rcd1[k].keys[0]);
            printf("\n");
        }
        else
        {
            for (k = 1; k <= L->length; k++)
                printf("%d  %d  %d\n", L->rcd[k].keys[2], L->rcd[k].keys[1], L->rcd[k].keys[0]);
            printf("\n");
        }
        //-----------------test code end-----------------------------------------            
    }
    
    if(1 == L->digitNum % 2) //练习5：排序后的结果在rcd1中，将其复制至L.rcd 
        for(j = 1; j <= L->length; ++j)
            L->rcd[j] = rcd1[j];  

    free(count); free(pos); free(rcd1);
    return OK;
} 

int main() {     
    int i;
    KeysSqList L;
    L.radix = 10;
    L.digitNum = 3;
    L.size = 10;
    L.length = 9;

    L.rcd = (KeysRcdType*)malloc((L.length + 1) * sizeof(KeysRcdType));
    for (i = 0; i <= L.length; i++) L.rcd[i].keys = (KeysType*)malloc(L.digitNum * sizeof(KeysType));
    //L.rcd[0].key = 0;
    L.rcd[1].keys[0] = 6; L.rcd[1].keys[1] = 4; L.rcd[1].keys[2] = 9;
    L.rcd[2].keys[0] = 3; L.rcd[2].keys[1] = 3; L.rcd[2].keys[2] = 8;
    L.rcd[3].keys[0] = 4; L.rcd[3].keys[1] = 6; L.rcd[3].keys[2] = 5;
    L.rcd[4].keys[0] = 5; L.rcd[4].keys[1] = 9; L.rcd[4].keys[2] = 7;
    L.rcd[5].keys[0] = 8; L.rcd[5].keys[1] = 7; L.rcd[5].keys[2] = 6;
    L.rcd[6].keys[0] = 9; L.rcd[6].keys[1] = 1; L.rcd[6].keys[2] = 3;
    L.rcd[7].keys[0] = 2; L.rcd[7].keys[1] = 2; L.rcd[7].keys[2] = 7;
    L.rcd[8].keys[0] = 4; L.rcd[8].keys[1] = 4; L.rcd[8].keys[2] = 9;
    L.rcd[9].keys[0] = 1; L.rcd[9].keys[1] = 3; L.rcd[9].keys[2] = 4;

    printf("输入数据：\n");
    for (i = 1; i <= L.length; i++) 
        printf("%d  %d  %d\n", L.rcd[i].keys[2], L.rcd[i].keys[1], L.rcd[i].keys[0]);
    printf("\n"); printf("\n");

    printf("排序过程：\n");
    RadixSort(&L);

    printf("最终排序结果：\n");
    for (i = 1; i <= L.length; i++) 
        printf("%d  %d  %d\n", L.rcd[i].keys[2], L.rcd[i].keys[1], L.rcd[i].keys[0]);
    printf("\n");

    return 0;
}
