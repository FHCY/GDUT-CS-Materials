#include<stdio.h>

int n,cnt=0,a[6]={0};

int main()
{
    scanf("%d",&n);
    while(n>0)
    {
        cnt++;
        a[cnt]=n%10;
        n/=10;
    }

    printf("位数：%d\n",cnt);

    printf("每位数字为：");
    for(int i=cnt;i>1;i--)
    {
        printf("%d,",a[i]);
    }
    printf("%d\n",a[1]);

    printf("反序数字为：");
    for(int i=1;i<=cnt;i++)
    {
        if(a[i])
            printf("%d",a[i]);
    }

    return 0;
}
