#include "CircularQueue.h"

//练习1：初始化一个空的循环队列
Status InitQueue_Sq(SqQueue& Q, int size)
{
    Q.elem = (ElemType*)malloc(size * sizeof SqQueue);
    Q.front = 0;
    Q.rear = 0;
    Q.maxSize = size;
    return OK;
}

//练习2（改错）：进队列操作
Status EnQueue_Sq(SqQueue& Q, ElemType e)
{
    Q.rear %= Q.maxSize;
    if(Q.rear == (Q.front-1) % Q.maxSize)       //注：采用牺牲一个元素空间的方法判断队满
        return ERROR;
    Q.elem[Q.rear] = e;
    Q.rear++;
    return OK;
}

//练习3（改错）：出队列操作
Status DeQueue_Sq(SqQueue& Q, ElemType& e)
{
    if (Q.front == Q.rear)
        return ERROR;
    e = Q.elem[Q.front];
    (Q.front += 1) %= Q.maxSize;
    return OK;
}

//练习4（改错）：判断队列是否为空
Status QueueEmpty_Sq(SqQueue Q)
{
    if (Q.front == Q.rear)
        return TRUE;
    else
        return FALSE;
}