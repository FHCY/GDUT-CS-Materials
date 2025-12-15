#include<stdio.h>

int x,y;

void swap(int* x, int* y)
{
    int t=y;
    y=x;
    x=t;
}

int gcd(int x,int y)
{
    if(y==0)
        return x;
    return gcd(y,x%y);
}

int lcm(int x,int y)
{
    return (x*y/gcd(x,y));
}

int main()
{
    /*
    input:scanf("%d %d",&x,&y);

    if(x<=0||y<=0)
    {
        printf("输入错误，请重新输入。\n");
        goto input;
    }
    */

    while(printf("请输入两个正整数：")&&scanf("%d %d",&x,&y)&&(x<=0||y<=0))
    {
        printf("输入错误，请重新输入。\n");
    }

    printf("%d,%d的最大公约数为：%d\n",x,y,gcd(x,y));
    printf("%d,%d的最小公倍数为：%d",x,y,lcm(x,y));

    return 0;
}
