#include <stdio.h>
#include<stdlib.h>
#include<time.h>
#include "BSTree.h"

void printfRcdKey(RcdType rcd) {   // 打印结点的值
    // 练习1.4.2：Add your code here
    printf("%d, ", rcd.key);

}
    
int main()
{
    BSTree T = NULL; 

    RcdType e;

    // 插入40，预期结果40(#,#)
    e.key = 40;
    InsertBST(T, e);

    // 插入15，预期结果40(15,#)
    e.key = 15;
    InsertBST(T, e);

    // 插入41，预期结果40(15,41)
    e.key = 41;
    InsertBST(T, e);

    // 插入33，预期结果40(15(#,33),41)
    e.key = 33;
    InsertBST(T, e);

    // 插入50，预期结果40(15(#,33),41(#,50))
    e.key = 50;
    InsertBST(T, e);

    // 插入27，预期结果40(15(#,33(27,#)),41(#,50))
    e.key = 27;
    InsertBST(T, e);

    // 插入36，预期结果40(15(#,33(27,36)),41(#,50))
    e.key = 36;
    InsertBST(T, e);

    // 插入45，预期结果40(15(#,33(27,36)),41(#,50(45,#)))
    e.key = 45;
    InsertBST(T, e);

    printf("先序遍历：\n");
    PreOrder(T);
    printf("\n");
    printf("中序遍历：\n");
    InOrder(T);
    printf("\n");
    printf("后序遍历：\n");
    PostOrder(T);
    printf("\n");
    printf("后序遍历(使用指针函数）：\n");
    PostOrder(T, printfRcdKey);
    printf("\n");

    // 查找二叉查找树中的最小结点
    KeyType result = SearchBSTMin(T);
    printf("%d", result);

    //查找以二叉查找树中最大结点为根的子树
    BSTree maxSubTree = SearchBSTMax(T);
    if (maxSubTree != NULL)
        printf(" %d", maxSubTree->data.key);

    //删除结点41
    DeleteBST(T,41);
    //删除结点33
    DeleteBST(T, 33);    

    return 0;
}