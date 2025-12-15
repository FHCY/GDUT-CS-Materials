#include<stdio.h>

int n;

int main()
{
    while(scanf("%d",&n)!=EOF)
    {
        for(int i=1;i<=n;i++)
        {
            for(int j=1;j<=n-i;j++)
                putchar(' ');

            for(int j=1;j<=(i<<1)-1;j++)
                putchar('*');

            for(int j=1;j<=n-i;j++)
                putchar(' ');

            putchar('\n');
        }
        for(int i=n-1;i>=1;i--)
        {
            for(int j=1;j<=n-i;j++)
                putchar(' ');

            for(int j=1;j<=(i<<1)-1;j++)
                putchar('*');

            for(int j=1;j<=n-i;j++)
                putchar(' ');

            putchar('\n');
        }
    }

	return 0;
}
