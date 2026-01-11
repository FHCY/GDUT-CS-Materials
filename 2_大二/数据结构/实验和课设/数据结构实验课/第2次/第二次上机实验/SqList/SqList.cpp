#include <stdlib.h>
#include "SqList.h"

//练习1：初始化一个空的循线性表L
Status InitList_Sq(SqList& L, int size, int inc) 
{ 
    L.elem = (ElemType*)malloc(size * sizeof ElemType);
    L.length = 0;
    L.size = size;
    L.increment = inc;
    return OK;
}

//练习2：获取第i个元素的值，用参数e返回该值
Status GetElem_Sq(SqList L, int i, ElemType& e) 
{
    if (i >= L.length)
        return ERROR;
    e = L.elem[i];
    return OK;
}

//练习3：在顺序表L表尾添加元素e
Status  Append_Sq(SqList& L, ElemType e) 
{         
    if (L.length >= L.size)
    {
        ElemType* newbase = (ElemType*)realloc(L.elem, (L.size + L.increment) * sizeof ElemType);
        if (newbase == NULL)
            return OVERFLOW;
        L.elem = newbase;
        L.size += L.increment;
    }
    L.elem[L.length++] = e;
    return OK;
}