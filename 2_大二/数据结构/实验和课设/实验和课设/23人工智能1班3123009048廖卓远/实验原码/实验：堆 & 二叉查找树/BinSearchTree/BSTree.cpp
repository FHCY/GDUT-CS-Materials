#include <stdlib.h>
#include <stdio.h>
#include "BSTree.h"


Status InsertBST(BSTree& T, RcdType e) 
{   //初始条件：二叉查找树T存在且非空，且T中不存在值为e.key的结点。
    //操作结果：将e插入到T，并返回TRUE。
    if (NULL == T) { // 若二叉查找树是空树，则创建新插入的结点并作为根结点  
        BSTNode* s = (BSTNode*)malloc(sizeof(BSTNode));
        if (NULL == s) 
            return ERROR;
        s->data = e;  
        s->lchild = NULL; 
        s->rchild = NULL;
        T = s;

        return OK;
    }

    // 插入结点的值小于根结点值，在左子树递归插入
    if (e.key < T->data.key) 
        return InsertBST(T->lchild, e);

    // 插入结点的值大于根结点值，在右子树递归插入
    if (e.key > T->data.key) 
        return InsertBST(T->rchild, e);

    return 0; // e.key==T->data.key，结点已存在
}

void PreOrder(BSTree T) {  // 对树T进行先序遍历
    if (T != NULL) {
        printf("%d  ", T->data.key);  // 打印结点的值
        // 练习1.1：完成先序遍 
        PreOrder(T->lchild);
        PreOrder(T->rchild);
    }
}

void InOrder(BSTree T) {  // 对树T进行中序遍历
    if (NULL == T)
        return;
    else
    {
        InOrder(T->lchild);
        printf("%d  ", T->data.key);  // 打印结点的值
        InOrder(T->rchild);
    }
}

void PostOrder(BSTree T) {  // 对树T进行后序遍历
    if (NULL == T)
        return;
    else
    {
        PostOrder(T->lchild);
        PostOrder(T->rchild);
        printf("%d  ", T->data.key);  // 打印结点的值
    }
}

// 对树T进行后序遍历（使用函数指针）
void PostOrder(BSTree T, void (* visit)(RcdType rcd)) {
    
    if (NULL == T)
        return;
    else
    {
        PostOrder(T->lchild, visit);
        PostOrder(T->rchild, visit);
        visit(T->data);
    }
}

KeyType SearchBSTMin(BSTree T) 
{ // 在二叉查找树T中查找最小结点
 
    if (NULL == T)
        return ERROR;
    else if (NULL == T->lchild)
        return T->data.key;
    else
    {
        SearchBSTMin(T->lchild);
    }

    
}

BSTree SearchBSTMax(BSTree T) 
{ // 在二叉查找树T中查找以最大结点为根的子树（递归？迭代？）
    if (T != NULL)
    {
        while (T->rchild != NULL)
            T = T->rchild;

    }

    return T;
}

void DeleteNode(BSTree& p) { // 二叉查找树中删除结点 p，并重接它的左或右子树
    BSTNode* q;
    // BSTNode* s;
    if (NULL == p->rchild) {//右子树空，只需重接它的左子树
        q = p; 
        p = p->lchild; 
        free(q);
    }
    else if (NULL == p->lchild) { // 只需重接它的右子树 
        q = p;
        p = p->rchild;
		free(q); 


    }
    else {// 左右子树均不空
        BSTree s = p->lchild;
        q = p;
        while(s->rchild != NULL){
        	q = s;
        	s = s->rchild;
		}
		p->data = s->data;
		if(q == p) q->lchild = s->lchild;
		else q->rchild = s->lchild;
		free(s);
    }
}

Status DeleteBST(BSTree& T, KeyType key) {
    // 若二叉查找树T中存在值为key的结点，则删除该结点，并返回 TRUE；否则FALSE
    //初始条件：二叉查找树T存在且非空，且T中存在值为key的结点。
    //操作结果：删除key对应结点的指针，并返回True。

    if (NULL == T)
        return False;// 不存在值为key的结点

    if (key == T->data.key) { // 找到值为key的结点
        DeleteNode(T);
        return OK;
    }
    if (key < T->data.key) 
        return DeleteBST(T->lchild, key); // 返回在左子树上删除的结果

    return DeleteBST(T->rchild, key); // 返回在右子树上删除的结果　　　　　　　　　
}
