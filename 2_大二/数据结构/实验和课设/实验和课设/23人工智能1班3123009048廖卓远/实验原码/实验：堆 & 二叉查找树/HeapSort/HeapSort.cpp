#include <stdlib.h>
#include "Heap.h"


Status InitHeap(Heap* H, int size, int tag, int (*prior)(KeyType, KeyType))
{  // 初始化一个容量为size的堆H，当tag为0或1时分别表示小顶堆和大顶堆,prior为相应的优先函数
	H->rcd = (RcdType*)malloc(sizeof(RcdType) * size);
	if (NULL == H->rcd)
		return OVERFLOW;

	H->n = 0; 
	H->size = size; 
	H->tag = tag; 
	H->prior = prior;

	return OK;
}


void MakeHeap(Heap* H, RcdType* E, int n, int size, int tag, int (*prior)(KeyType, KeyType)) {
	// 用E建立长度为n的堆H，容量为size。当tag为0或1时分别表示小顶堆和大顶堆，prior为相应的优先函数
	H->rcd = E; // E[1..n]是堆的n个结点，0号单元空闲
	H->n = n;
	H->size = size;
	H->tag = tag;
	H->prior = prior;


	for (int i = n / 2; i > 0; i--)
		shiftDown(H, i);
}

Status swapHeapElem(Heap* H, int i, int j);

void shiftDown(Heap* H, int pos) {
	// 对堆H中位置为pos的结点作筛选，将以pos为根的子树调整为子堆
	while (pos <= H->n / 2) { // 若pos结点为叶子结点，循环结束
		int c = pos * 2;         // pos结点的左孩子位置
		int rc = pos * 2 + 1;     // pos结点的右孩子位置

		if (rc <= H->n && H->prior(H->rcd[rc].key, H->rcd[c].key))
			c = rc;

		if (H->prior(H->rcd[pos].key, H->rcd[c].key))
	     	return;
		else
		{
			swapHeapElem(H, pos, c);
			pos = c;
		}

	}
}


Status swapHeapElem(Heap* H, int i, int j) {
	//交换堆H中的第i结点和第j结点
	if (i<0 || i>H->n || j<0 || j>H->n) 
		return ERROR;

	RcdType t = H->rcd[i];
	H->rcd[i] = H->rcd[j];  
	H->rcd[j] = t;

	return OK;
}


Status RemoveFirstHeap(Heap* H, RcdType* e) {
	// 删除堆H的堆顶结点，用e返回其值 
	if (H->n <= 0)
		return 0;

	// 练习3：删除堆H的堆顶结点，用e记录被删除的结点的值
	e = H.rcd[1];
	swapHeapElem(H, 1, H.n); H.n--;
	if(H.n > 1) ShiftDown(H, 1);
	return OK;
}


Status InsertHeap(Heap* H, RcdType e) {  //将e插入至堆H中
	if (H->n >= H->size - 1) 
		return 0; // 堆已满，插入失败

	// 练习4：将e插入至H的堆尾，然后将整个H重新调整为堆
	int curr;
	curr = ++h.N;
	H.rcd[curr] = e;
	while(1! = curr && H.prior(H.rcd[curr.key], H.rcd[curr/2].key)){
		swapHeapElem(H, curr, curr/2);
		curr /= 2;
	}

	return OK;
}


int greatPrior(int x, int y) { // 大顶堆优先函数
	return x >= y;
}

int lessPrior(int x, int y) { // 小顶堆优先函数
	return x <= y;
}

void HeapSort(RcdSqList* L) { // 堆排序
	Heap H;
	int i;
	RcdType e;
	MakeHeap(&H, L->rcd, L->length, L->size, 1, greatPrior);

	// 练习5：将待排序列L建成大顶堆H
	for(i = H.n; i > 0; i--) RemoveFirstHeap(H, e);


}
