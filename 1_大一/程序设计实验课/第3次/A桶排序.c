#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

int n,temp,tong[1000005];

int main()
{
    int t;
    while(scanf("%d",&n)&&n)
    {
        memset(tong,0,sizeof(tong));
        for(int i=1;i<=n;i++)
        {
            scanf("%d",&temp);
            tong[abs(temp)]=temp/abs(temp);
        }
        for(int i=1000000;i>=0;i--)
        {
            if(tong[i])
                printf("%d ",tong[i]*i);
        }
        printf("\n");
    }

    return 0;
}
