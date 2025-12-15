#include <stdio.h>
#include <stdlib.h>

#define Free 0 //空闲状态
#define Busy 1 //已用状态
#define OK 1    //完成
#define ERROR 0 //出错
#define MAX_length 640 //最大内存空间为640KB

typedef int Status;
int flag;

typedef struct freearea //定义一个空闲区说明表结构
{
    long size;   //分区大小
    long address; //分区地址
    int state;    //状态
} ElemType;

// 线性表的双向链表存储结构
typedef struct DuLNode
{
    ElemType data;
    struct DuLNode *prior; //前趋指针
    struct DuLNode *next;  //后继指针
} DuLNode, *DuLinkList;

DuLinkList block_first; //头结点
DuLinkList block_last;  //尾结点

Status alloc(int);   //内存分配
Status free_mem(int); //内存回收
Status First_fit(int); //首次适应算法
Status Best_fit(int);  //最佳适应算法
Status Worst_fit(int); //最差适应算法
void show();          //查看分配
Status Initblock();    //开创空间表

Status Initblock() //开创带头结点的内存空间链表
{
    block_first = (DuLinkList)malloc(sizeof(DuLNode));
    block_last = (DuLinkList)malloc(sizeof(DuLNode));
    block_first->prior = NULL;
    block_first->next = block_last;
    block_last->prior = block_first;
    block_last->next = NULL;
    block_last->data.address = 0;
    block_last->data.size = MAX_length;
    block_last->data.state = Free;
    return OK;
}

//分配主存
Status alloc(int ch)
{
    int request = 0;
    printf("请输入需要分配的主存大小(单位:KB)：");
    scanf("%d", &request);
    if (request < 0 || request == 0)
    {
        printf("分配大小不合适，请重试！\n");
        return ERROR;
    }

    if (ch == 2) //选择最佳适应算法
    {
        if (Best_fit(request) == OK)
            printf("分配成功！\n");
        else
            printf("内存不足，分配失败！\n");
        return OK;
    }
    if (ch == 3) //选择最差适应算法
    {
        if (Worst_fit(request) == OK)
            printf("分配成功！\n");
        else
            printf("内存不足，分配失败！\n");
        return OK;
    }
    else //默认首次适应算法
    {
        if (First_fit(request) == OK)
            printf("分配成功！\n");
        else
            printf("内存不足，分配失败！\n");
        return OK;
    }
}

//首次适应算法
Status First_fit(int request)
{
    //为申请作业开辟新空间且初始化
    DuLinkList temp = (DuLinkList)malloc(sizeof(DuLNode));
    temp->data.size = request;
    temp->data.state = Busy;

    DuLNode *p = block_first->next;
    while (p)
    {
        if (p->data.state == Free && p->data.size == request)
        { //有大小恰好合适的空闲块
            p->data.state=Busy;
            return OK;
        }
        if (p->data.state == Free && p->data.size > request)
        { //有空闲块能满足需求且有剩余
            p->data.size-=request;
            temp->data.address=p->data.address;
            p->data.address+=request;

            temp->prior=p->prior;
            temp->next=p;
            p->prior->next=temp;
            p->prior=temp;
            return OK;
        }
        p = p->next;
    }
    return ERROR;
}

//最佳适应算法
Status Best_fit(int request)
{
    int ch; //记录最小剩余空间
    DuLinkList temp = (DuLinkList)malloc(sizeof(DuLNode));
    temp->data.size = request;
    temp->data.state = Busy;
    DuLNode *p = block_first->next;
    DuLNode *q = NULL; //记录最佳插入位置

    while (p) //初始化最小空间和最佳位置
    {
        if (p->data.state == Free && (p->data.size >= request))
        {
            if (q == NULL)
            {
               q=p;
            }
            else if (q->data.size > p->data.size)
            {
               q=p;
            }
        }
        p = p->next;
    }

    if (q == NULL)
        return ERROR; //没有找到空闲块
    else if (q->data.size == request)
    {
       q->data.state=Busy;
    }
    else
    {
        q->data.size-=request;
        temp->data.address=q->data.address;
        q->data.address+=request;

        temp->prior=q->prior;
        temp->next=q;
        q->prior->next=temp;
        q->prior=temp;
    }
    return OK;
}

//最差适应算法
Status Worst_fit(int request)
{
    int ch; //记录最大剩余空间
    DuLinkList temp = (DuLinkList)malloc(sizeof(DuLNode));
    temp->data.size = request;
    temp->data.state = Busy;
    DuLNode *p = block_first->next;
    DuLNode *q = NULL; //记录最佳插入位置

    while (p) //初始化最大空间和最佳位置
    {
        if (p->data.state == Free && (p->data.size >= request))
        {
            if (q == NULL)
            {
                q=p;
            }
            else if (q->data.size < p->data.size)
            {
                q=p;
            }
        }
        p = p->next;
    }

    if (q == NULL)
        return ERROR; //没有找到空闲块
    else if (q->data.size == request)
    {
       q->data.state=Busy;
    }
    else
    {
        q->data.size-=request;
        temp->data.address=q->data.address;
        q->data.address+=request;

        temp->prior=q->prior;
        temp->next=q;
        q->prior->next=temp;
        q->prior=temp;
    }
    return OK;
}

//主存回收
Status free_mem(int flag)
{
    DuLNode *p = block_first;
    for (int i = 0; i <= flag; i++)
        if (p != NULL)
            p = p->next;
        else
            return ERROR;

    if (p->data.state == Free)
    {
        printf("该块本为空闲\n");
        return ERROR;
    }
    p->data.state = Free;

    if (p == block_last) //为最后一块
    {
        if (p->prior == block_first)
        {
            p->data.state = Free;
        }
        else
        {
            if (p->prior->data.state == Busy)
            {
                p->data.state = Free;
            }
            else
            {
                p->prior->data.size += p->data.size;
                p->prior->next = p->next;
                p->next->prior = p->prior;
                p = p->prior;
            }
        }
        return OK;
    }

    int success=0;
    if (p->prior != block_first && p->prior->data.state == Free) //与前面的空闲块相连
    {
        p->prior->data.size += p->data.size;
        p->prior->next = p->next;
        p->next->prior = p->prior;
        p = p->prior;
        success=1;
    }
    if (p->next != block_last && p->next->data.state == Free) //与后面的空闲块相连
    {
        p->data.size += p->next->data.size;
        p->next->next->prior = p;
        p->next = p->next->next;
        return OK;
    }
    if (p->next == block_last && p->next->data.state == Free) //与最后的空闲块相连
    {
        p->data.size += p->next->data.size;
        p->next = NULL;
        block_last = p;
        return OK;
    }

    if(success==1)
        return OK;

    printf("\n未知错误！");
    return ERROR;
}

//显示主存分配情况
void show()
{
    int flag = 0;
    printf("\n主存分配情况:\n");
    printf("++++++++++++++++++++++++++++++++++++++++++++++\n\n");
    DuLNode *p = block_first->next;
    printf("分区号\t起始地址\t分区大小\t状态\n\n");
    while (p)
    {
        printf("  %d\t", flag++);
        printf("  %ld\t\t", p->data.address);
        printf(" %ldKB\t\t", p->data.size);
        if (p->data.state == Free)
            printf("空闲\n\n");
        else
            printf("已分配\n\n");
        p = p->next;
    }
    printf("++++++++++++++++++++++++++++++++++++++++++++++\n\n");
}

//主函数
int main()
{
    int ch; //算法选择标记
    printf("请输入所使用的内存分配算法：\n");
    printf("(1)首次适应算法\n(2)最佳适应算法\n(3)最差适应算法\n");

    scanf("%d", &ch);
    while (ch < 1 || ch > 3)
    {
        printf("输入错误，请重新输入所使用的内存分配算法：\n");
        scanf("%d", &ch);
    }

    Initblock(); //开创空间表
    int choice;   //操作选择标记

    while (1)
    {
        show();
        printf("请输入您的操作：");
        printf("\n1: 分配内存\n2: 回收内存\n0: 退出\n");

        scanf("%d", &choice);
        if (choice == 1)
            alloc(ch); // 分配内存
        else if (choice == 2) // 内存回收
        {
            int flag;
            printf("请输入您要释放的分区号：");
            scanf("%d", &flag);
            free_mem(flag);
        }
        else if (choice == 0)
            break; //退出
        else //输入操作有误
        {
            printf("输入有误，请重试！\n");
            continue;
        }
    }
    return 0;
}
