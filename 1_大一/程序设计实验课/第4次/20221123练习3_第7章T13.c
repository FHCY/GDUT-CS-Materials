#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int n;
double x;

double p(int n, double x)
{
    if(n==0)
        return 1;
    if(n==1)
        return x;
    return ((2*n-1)*x-p(n-1,x)-(n-1)*p(n-2,x))/n;
}

int main()
{
    while(printf("请输入n和x：")&&scanf("%d %lf",&n,&x)&&n<0)
    {
        printf("输入错误，请重新输入。\n");
    }

    printf("P(%d,%.20g)=%.20g",n,x,p(n,x));

    return 0;
}
