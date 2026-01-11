#include <stdio.h>
#include <stdlib.h>
#include "RcdSqList.h"

void InsertSort(RcdSqList* L) {  // 对顺序表L作直接插入排序。
    int i, j;
    for(i = 1; i<L->length; ++i)
    {
      if(L->rcd[i+1].key<L->rcd[i].key) 
      { // 需将L.rcd[i+1]插入有序序列
          
        //练习1：先将记录L.rcd[i+1]保存在空闲的0号单元
          L->rcd[0] = L->rcd[i+1];
        j = i+1;
        do{ 
            j--; 
			//练习2：记录后移  
            L->rcd[j+1] = L->rcd
        }
            while( L->rcd[0].key<L->rcd[j-1].key); //练习3：判断是否需要继续移动
        
		//练习4：插入记录
       
      }
    }
}

int main() {     
    int i; RcdSqList L; 
    /* L.length = 5+rand(3);
     L.rcd = (RcdType*)malloc((L.length+1)*sizeof(RcdType));
     for(i = 1; i<=L.length; i++) L.rcd[i].key = 10+rand(2);
     */
    L.length = 9;
    L.rcd = (RcdType*)malloc((L.length + 1) * sizeof(RcdType));
    //L.rcd[0].key = 0;
    L.rcd[1].key = 49;
    L.rcd[2].key = 38;
    L.rcd[3].key = 65;
    L.rcd[4].key = 97;
    L.rcd[5].key = 76;
    L.rcd[6].key = 13;
    L.rcd[7].key = 27;
    L.rcd[8].key = 49;
    L.rcd[9].key = 34;

    for (i = 1; i <= L.length; i++) 
        printf("%d  ", L.rcd[i].key);
    printf("\n");

    InsertSort(&L);

    for (i = 1; i <= L.length; i++) 
        printf("%d  ", L.rcd[i].key);
    printf("\n");

    return 0;
}
