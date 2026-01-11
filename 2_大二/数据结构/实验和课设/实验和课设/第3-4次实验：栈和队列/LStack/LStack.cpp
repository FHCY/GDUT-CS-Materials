#include <stdlib.h>
#include "LStack.h"

//练习1：初始化一个空链栈S
Status InitStack_LS(LStack& S)
{   // 初始化空链栈S
    S=(LSNode*)malloc(sizeof(LSNode*));
    S->next=NULL;
    S->data=NULL;
    return OK;
}

//练习2：入栈
Status Push_LS(LStack& S, ElemType e)
{
    LSNode* t;
    t = (LSNode*)malloc(sizeof(LSNode)); // 为元素e生成一个新结点
    if (NULL == t)
    {
        return OVERFLOW; // 生成失败，返回
    }

    t->data = e;
    S->next=t;
    t->next=NULL;


    return OK;
}

//练习3：出栈
Status Pop_LS(LStack& S, ElemType& e)
{
    LSNode* t;
    if (NULL == S)
    {
        return ERROR; // 判断是否为空栈
    }

    t=S;

    e = S->data;      // 用e返回栈顶元素值

    S=S->next;
    free(t);

    
    return OK;
}
