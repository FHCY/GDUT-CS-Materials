#include <stdio.h>
#include<stdlib.h>
#include<time.h>
#include "Heap.h"
    
int main()
{
	srand((unsigned)time(NULL));

	RcdSqList L;
	RcdType E[10]; int i; Heap H; RcdType e;
	for (i = 0; i < 10; i++) 
		E[i].key = rand() % 90 + 10; 
	
	printf("建堆前：\n");
	for (i = 1; i < 10; i++) 
		printf(" %d ", E[i].key);

	InitHeap(&H, 10, 1, greatPrior);
	MakeHeap(&H, E, 9, 10, 1, greatPrior);
	printf("\n"); 

	printf("建堆后：\n");
	for (i = 1; i <= H.n; i++) 
		printf(" %d ", H.rcd[i].key);

	RemoveFirstHeap(&H, &e);
	printf("\n"); 
	
	printf("删除 %d 后：\n", e.key);
	for (i = 1; i <= H.n; i++) 
		printf(" %d ", H.rcd[i].key);


	InsertHeap(&H, e);
	printf("\n"); 

	printf("插入 %d 后：\n", e.key);
	for (i = 1; i <= H.n; i++) 
		printf(" %d ", H.rcd[i].key);


	L.rcd = (RcdType*)malloc(10 * sizeof(RcdType));
	L.length = 9;
	L.size = 10;
	L.rcd = E;
	HeapSort(&L);

	printf("\n"); 
	
	printf("排序后：\n");
	for (i = 1; i <= H.n; i++) 
		printf(" %d ", H.rcd[i].key);

    return 0;
}