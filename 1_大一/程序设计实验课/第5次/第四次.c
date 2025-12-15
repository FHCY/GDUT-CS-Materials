#include<stdio.h>
#include<string.h>

char err[20]="Not found.";

void mysort(char name[][20],int num[])
{
    const int n=10;
    for(int i=0;i<=n-2;i++)
    {
        int k=i;
        for(int j=i;j<=n-1;j++)
        {
            if(num[j]<num[k])
                k=j;
        }
        int temp=num[k];
        num[k]=num[i];
        num[i]=temp;

        char tmp[20];
        strcpy(tmp,name[k]);
        strcpy(name[k],name[i]);
        strcpy(name[i],tmp);
    }
}

char* myfind(int x,char name[][20],int num[],int l,int r)
{
    if(l>r||r==0)
        return err;
    int mid=(l+r)/2;
    if(num[mid]==x)
        return name[mid];
    if(x<num[mid])
        return myfind(x,name,num,l,mid);
    else
        return myfind(x,name,num,mid+1,r);
}

int main()
{
    char name[10][20] = {"John", "Mike", "Peter", "Judy","Anny",
                            "Lucy", "Ketty", "Davi", "Cook", "Diana"};
    int num[10] = {3008, 3004, 3010, 3007, 3006,
                    3005, 3002, 3001, 3009, 3003};

    mysort(name,num);

    int x;
    scanf("%d",&x);
    printf("%s",myfind(x,name,num,0,9));

    return 0;
}
