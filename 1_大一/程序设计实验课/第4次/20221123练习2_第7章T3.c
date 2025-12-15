#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int x;

void isprime(int x)
{
    for(int i=2;i<=sqrt(x);i++)
    {
        if(x%i==0)
        {
            printf("%d不是素数。",x);
            return;
        }
    }
    printf("%d是素数。",x);
}

int main()
{
    while(printf("请输入一个正整数：")&&scanf("%d",&x)&&(x<=0))
    {
        printf("输入错误，请重新输入。\n");
    }

    isprime(x);

    return 0;
}
