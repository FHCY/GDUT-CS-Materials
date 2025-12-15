#include "DuCirLinkList.h"

Status InitDuCirLinkList(DuCirLinkList &L)
{
    L = (DuCirLinkList)malloc(sizeof(DuLNode));
    L->prior = L;
    L->next = L;
    return OK;
}

DuLNode* MakeNode_DuCirL(ElemType e)
{
    DuLNode* result = (DuLNode*)malloc(sizeof(DuLNode));
    if (result != NULL)
    {
        result->data = e;
    }
    return result;
}

//练习1：在结点p之后插入结点q
Status InsertAfter_DuLCirL(DuLNode* p, DuLNode* q)
{
    if (NULL == p || NULL == q)
    {
        return ERROR;
    }
    p->next->prior = q;
    q->next = p->next;
    q->prior = p;
    p->next = q;
    return OK;
}

//练习2：在结点p之前插入结点q
Status InsertBefore_DuLCirL(DuLNode* p, DuLNode* q)
{
    if (NULL == p || NULL == q)
    {
        return ERROR;
    }
    p->prior->next = q;
    q->prior = p->prior;
    q->next = p;
    p->prior = q;
    return OK;
}

//练习3：删除结点p
Status Delete_DuLCirL(DuLNode* p, ElemType& e)
{
    if (NULL == p || NULL == p->prior)
    {
        return ERROR;
    }
    e = p->data;
    p->prior->next = p->next;
    p->next->prior = p->prior;
    free(p);
    return OK;
}

//练习4：清空双向循环链表L
Status Clear_DuLCirL(DuCirLinkList L)
{
    if (NULL == L)                      // 链表不存在
    {
        return ERROR;
    }
    if (L->next == L && L->prior == L)  // 链表为空
    {
        return OK;
    }

    //练习4：修改以下程序段，改为从最后一个结点开始清空
    DuLNode* p = L->prior;
    do
    {
        p = p->prior;
        free(p->next);
    } while (p != L);

    L->prior = L;
    L->next = L;

    return OK;
}
