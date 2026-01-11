#define ERROR 0
#define OK 1
#define OVERFLOW -1

typedef  int  KeyType;  // 关键字类型为整数类型

typedef int KeyType;
typedef int Status;

typedef  struct {
    KeyType  key;       // 关键字项
} RecordType, RcdType;  // 记录类型，RcdType为RecordType的简写

typedef struct {
    RcdType* rcd;  // 存储空间基址
    int length;    // 当前长度
    int size;      // 存储容量 
} RcdSqList;  // 记录的顺序表

typedef struct {
    RcdType* rcd; // 堆基址，0号单元不用
    int    n;          // 堆长度
    int    size;       // 堆容量
    int    tag;   // 大根堆与小根堆的标志：tag = 0为小顶堆，tag = 1为大顶堆
    int    (*prior)(KeyType, KeyType); // 函数变量，用于关键字优先级比较
} Heap; // 堆类型

Status InitHeap(Heap* H, int size, int tag, int (*prior)(KeyType, KeyType));// 初建最大容量为size的空堆H，当tag为0或1时分别表示小顶堆和大顶堆,prior为相应的优先函数
void MakeHeap(Heap* H, RcdType* E, int n, int size, int tag, int (*prior)(KeyType, KeyType)); // 用E建长度为n的堆H，容量为size，当tag为0或1时分别表示小顶堆和大顶堆,prior为相应的优先函数
Status DestroyHeap(Heap* H); // 销毁堆H 
void shiftDown(Heap* H, int pos); // 对位置为pos的结点作筛选
Status InsertHeap(Heap* H, RcdType e); // 将e插入堆
Status RemoveFirstHeap(Heap* H, RcdType* e); // 删除堆顶结点，用e返回其值
Status RemoveHeap(Heap* H, int pos, RcdType* e); // 删除位置pos的结点，用e返回其值
int greatPrior(int x, int y);
int lessPrior(int x, int y);
void HeapSort(RcdSqList* L);