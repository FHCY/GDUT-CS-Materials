#include <stdlib.h>
#include "SqStack.h"

Status InitStack_Sq(SqStack& S, int size, int inc)
{
    S.elem = (ElemType*)malloc(size * sizeof(ElemType));
    if (NULL == S.elem)
        return OVERFLOW;
    S.top = 0;
    S.size = size;
    S.increment = inc;
    return OK;
}

//练习1：进栈
Status Push_Sq(SqStack& S, ElemType e)
{
    if (S.top >= S.size)
    {
        ElemType* newbase;
        newbase = (ElemType*)realloc(S.elem, (S.size + S.increment) * sizeof(ElemType));
        if(NULL == newbase)
            return OVERFLOW;
        S.elem = newbase;
        S.size += S.increment;
    }
    S.elem[S.top] = e;
    S.top++;
    return OK;
}

//练习2：出栈
Status Pop_Sq(SqStack& S, ElemType& e)
{
    if (0 == S.top)
        return ERROR;
    e = S.elem[--S.top];
    return OK;
}

//练习3：改正本函数中的错误
Status StackEmpty_Sq(SqStack S)
{
    if (0 == S.top)
        return TRUE;
    else
        return FALSE;
}