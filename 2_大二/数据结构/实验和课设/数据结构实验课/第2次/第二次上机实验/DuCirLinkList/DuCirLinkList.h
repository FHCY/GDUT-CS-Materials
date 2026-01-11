#include "stdlib.h"

#define OVERFLOW -1
#define OK 1
#define ERROR 0    
#define TRUE 2
#define FALSE -2

typedef char ElemType;

typedef struct DuLNode{
   ElemType data;  
   DuLNode* prior;  // 指向直接前驱
   DuLNode* next;   // 指向直接后继
} *DuLinkList;

typedef DuLinkList DuCirLinkList;

typedef int Status;

Status InitDuCirLinkList(DuCirLinkList &L);
DuLNode* MakeNode_DuCirL(ElemType e);
Status InsertAfter_DuLCirL(DuLNode* p, DuLNode* q);
Status InsertBefore_DuLCirL(DuLNode* p, DuLNode* q);
Status Delete_DuLCirL(DuLNode* p, ElemType &e);
Status Clear_DuLCirL(DuCirLinkList L);




