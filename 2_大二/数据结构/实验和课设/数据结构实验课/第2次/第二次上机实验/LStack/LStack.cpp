#include <stdlib.h>
#include "LStack.h"

//Á·Ï°1£º³õÊ¼»¯Ò»¸ö¿ÕÁ´Õ»S
Status InitStack_LS(LStack& S)
{
    S = NULL;
    return OK;
}

//Á·Ï°2£ºÈëÕ»
Status Push_LS(LStack& S, ElemType e)
{
    LSNode* t = (LSNode*)malloc(sizeof(LSNode));
    if (NULL == t)
        return OVERFLOW;
    t->data = e;
    t->next = S;
    S = t;
    return OK;
}

//Á·Ï°3£º³öÕ»
Status Pop_LS(LStack& S, ElemType& e)
{
    if (NULL == S)
        return ERROR;
    LSNode* t = S;
    S = S->next;
    e = t->data;
    free(t);
    return OK;
}