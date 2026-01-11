#define OK 1
#define ERROR 0

typedef  int  KeyType;     // 关键字类型为整数类型
typedef  int  Status;

typedef  struct {
   // int info;
    KeyType  key;              // 关键字项   
} RecordType, RcdType;    // 记录类型，RcdType为RecordType的简写

typedef struct BSTNode {                     // 结点结构
    RcdType data;//数据元素
    struct BSTNode* lchild, * rchild;// 左右孩子指针
} BSTNode, * BSTree;


Status InsertBST(BSTree& T, RcdType e);
KeyType SearchBSTMin(BSTree T);
BSTree SearchBSTMax(BSTree T);
Status DeleteBST(BSTree& T, KeyType key);
void PreOrder(BSTree T);
void InOrder(BSTree T);
void PostOrder(BSTree T, void(*visit)(RcdType rcd));
void PostOrder(BSTree T);
