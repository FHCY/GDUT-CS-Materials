#include <stdio.h>
#include "LStack.h"

LStack creatLStack() 
{
    LStack S;
    InitStack_LS(S);
    Push_LS(S, 1);
    Push_LS(S, 3);
    return S;
}

int main() 
{
    LStack S;
    ElemType e;
    S = creatLStack();

    Pop_LS(S, e);
    printf("%d\n", e);

    Pop_LS(S, e);
    printf("%d\n", e);

    //练习4：请思考：第27行将会打印出什么值？为什么？
    Pop_LS(S, e);
    printf("%d\n", e);

    return 0;
}