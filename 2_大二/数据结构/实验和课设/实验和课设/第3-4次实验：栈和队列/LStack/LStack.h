#define OVERFLOW -1
#define OK 1
#define ERROR 0    
#define TRUE 2
#define FALSE -2

typedef int ElemType;
typedef struct LSNode {
    ElemType data;    // 数据域
    struct LSNode* next;    // 指针域
} LSNode, * LStack;    // 结点和链栈类型



typedef int Status;

Status InitStack_LS(LStack& S);
Status Push_LS(LStack& S, ElemType e);
Status Pop_LS(LStack& S, ElemType& e);




