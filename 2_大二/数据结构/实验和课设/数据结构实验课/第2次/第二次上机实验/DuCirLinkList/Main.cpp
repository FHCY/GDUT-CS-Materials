#include <stdio.h>
#include "DuCirLinkList.h"

void Split(DuCirLinkList L0, DuCirLinkList& LC, DuCirLinkList& LL);
void print_DuCirLinkList(DuCirLinkList L);

int main() {    
    DuCirLinkList L;
    
    //1. 初始化一个双向循环链表Q
    InitDuCirLinkList(L);

    //2. 在头结点之后插入结点
    DuLNode* node;
    ////2.1 在某结点之后插入
    node = MakeNode_DuCirL('A');
    InsertAfter_DuLCirL(L, node); // 在头结点之后插入'A'

    ////2.2 在某结点之前插入
    node = MakeNode_DuCirL('B');
    InsertBefore_DuLCirL(L->next, node); // 在结点'A'之前插入'B'
    node = MakeNode_DuCirL('C');
    InsertBefore_DuLCirL(L->next, node); // 在结点'B'之前插入'C'

    //3. 删除一个结点
    ElemType e;
    Delete_DuLCirL(L->next->next->next, e);
    printf("%c\n", e);

    //4. 清空双向循环链表
    Clear_DuLCirL(L);

    //5. 链表拆分
    DuCirLinkList LO;
    InitDuCirLinkList(LO);

    //构造测试数据：双向循环链表L0: (D, c, b, A)
    node = MakeNode_DuCirL('A');
    InsertAfter_DuLCirL(LO, node); // 在头结点之后插入'A'
    node = MakeNode_DuCirL('b');
    InsertBefore_DuLCirL(LO->next, node); // 在结点'A'之前插入'b'
    node = MakeNode_DuCirL('c');
    InsertBefore_DuLCirL(LO->next, node); // 在结点'b'之前插入'c'
    node = MakeNode_DuCirL('D');
    InsertBefore_DuLCirL(LO->next, node); // 在结点'c'之前插入'D'
    
    DuCirLinkList LC, LL;
    InitDuCirLinkList(LC);  // LC：只包含大写字母的双向循环链表
    InitDuCirLinkList(LL);  // LL：只包含小写字母的双向循环链表
    Split(LO, LC, LL);      // 将LO拆分成LC和LL
	print_DuCirLinkList(LO);
	print_DuCirLinkList(LC);
	print_DuCirLinkList(LL);
    return 0;
}

//练习5：实现一个双向链表拆分应用
// 将一个包含大小写字母的双向循环链表LO，拆分成只包含只包含大写字母的双向循环链表LC和只包含小写字母的双向循环链表LL
void Split(DuCirLinkList L0, DuCirLinkList& LC, DuCirLinkList& LL)
{
    DuCirLinkList cur_LC = LC, cur_LL = LL;
    for (DuLNode* cur = L0->next; cur != L0; cur = cur->next)
    {
        auto node = MakeNode_DuCirL(cur->data);
        if ('A' <= cur->data && cur->data <= 'Z')
            InsertAfter_DuLCirL(cur_LC, node), cur_LC = node;
        else
            InsertAfter_DuLCirL(cur_LL, node), cur_LL = node;
    }
}

//写一个输出函数，将双向循环链表里的内容输出
void print_DuCirLinkList(DuCirLinkList L)
{
    for (DuLNode* cur = L->next; cur != L; cur = cur->next)
    {
        printf("当前地址：%p   数据域：%c\n", cur, cur->data);
    }
    puts("");
}
