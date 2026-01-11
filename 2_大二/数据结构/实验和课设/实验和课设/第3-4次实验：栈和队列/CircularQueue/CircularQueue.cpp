#include "CircularQueue.h"

//练习1：初始化一个空的循环队列
Status InitQueue_Sq(SqQueue& Q, int size) { // 构造一个空队列
    Q.elem=(ElemType*)malloc(size*sizeof(ElemType));
    if(Q.front==Q.rear) return ERROR;
    Q.maxSize=size;
    Q.front=Q.rear=0;
    return OK;
}

//练习2（改错）：进队列操作
Status EnQueue_Sq(SqQueue& Q, ElemType e) {
    

    if((Q.rear+1)%Q.maxSize==Q.front) return ERROR;

    Q.elem[Q.rear] = e;

    Q.rear = (Q.rear+1)%Q.maxSize/*Correct the code here*/;

    return OK;
}

//练习3（改错）：出队列操作
Status DeQueue_Sq(SqQueue& Q, ElemType& e) {
    // 若队列不空，则删除队列Q中的头元素，用 e 返回其值
    if (Q.front==Q.rear)
        return ERROR; // 队空报错
    e = Q.elem[Q.front];
    Q.front = (Q.front + 1) % Q.maxSize; // Q.front循环加1
    return OK;
}

//练习4（改错）：判断队列是否为空
Status QueueEmpty_Sq(SqQueue Q) { // 判断队列Q是否空，若空则返回TRUE，否则FALSE
    if (Q.front==Q.rear)
        return TRUE;
    else
        return FALSE;
}
