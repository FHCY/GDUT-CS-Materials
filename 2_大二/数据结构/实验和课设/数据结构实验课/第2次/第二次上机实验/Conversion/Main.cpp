#include <stdio.h>
#include "SqStack.h"

void Conversion(int N) {
    SqStack S;
    ElemType e;
    InitStack_Sq(S, MAXSIZE, INCREMENT);

    while (N != 0)
    {
        Push_Sq(S, N % 8);
        N /= 8;
    }
    while (TRUE != StackEmpty_Sq(S))
    {
        Pop_Sq(S, e);
        printf("%d", e);
    }
}

void main() {
    Conversion(1348);
    return;
}
