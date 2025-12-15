#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int n,temp,a[105];

int main()
{
    while(scanf("%d",&n)&&n)
    {
        for(int i=1;i<=n;i++)
        {
            scanf("%d",&a[i]);
        }
        for(int i=1;i<=n-1;i++)
        {
            for(int j=1;j<=n-i;j++)
            {
                if(abs(a[j])<abs(a[j+1]))
                {
                    temp=a[j];
                    a[j]=a[j+1];
                    a[j+1]=temp;
                }
            }
        }
        for(int i=1;i<=n-1;i++)
        {
            printf("%d ",a[i]);
        }
        printf("%d",a[n]);
        printf("\n");
    }

    return 0;
}
