#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#define int long long

//50050510550150150101555051015501505555500055
//105501105

int n,temp,a[1005];
char s[1005];

signed main()
{
    while(gets(s))
    {
        n=0;
        memset(a,0,sizeof(a));
        for(int i=0;s[i]!='\0';i++)
        {
            while(s[i]=='5')
            {
                i++;
            }
            if(s[i]=='\0')
                break;

            int j=i;
            while(s[j]!='5'&&s[j]!='\0')
            {
                j++;
            }
            j--;

            n++;
            for(int k=j;k>=i;k--)
            {
                a[n]+=(s[k]-'0')*pow(10,j-k);
            }
            i=j;
        }

        for(int i=1;i<=n-1;i++)
        {
            for(int j=1;j<=n-i;j++)
            {
                if(a[j]>a[j+1])
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
        printf("%d\n",a[n]);
    }
    return 0;
}
