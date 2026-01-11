#include <stdio.h>
#include "SqStack.h"

void Conversion(int N) {
    SqStack S;
    ElemType e;
    InitStack_Sq(S, MAXSIZE, INCREMENT); // 栈S的初始容量为MAXSIZE

    while (N != 0)
    {
        Push_Sq(S, N % 8);  // 将N除以8的余数入栈
        N /= 8;             // N取值为其除以8的商
    }
    while (TRUE != StackEmpty_Sq(S))
    { // 依次输出栈中的余数
        Pop_Sq(S, e);
        printf("%d", e);
    }
}

void main() {
    Conversion(1348);
    return;
}
