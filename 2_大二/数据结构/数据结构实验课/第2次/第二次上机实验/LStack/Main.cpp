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
    //答：会打印和23行同样的e值。因为第27行的函数在给e赋值前就已返回ERROR（此时栈空），所以e的值实际并未被更改。
    Pop_LS(S, e);
    printf("%d\n", e);

    return 0;
}