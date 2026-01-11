#include<stdio.h>
#define N 50
int main()
{
	int a[N],n=0,lastn=0,count=0;
	printf("一共有几个参与选手：") ;
    scanf("%d", &n);
	for (int i=0;i<n;i++) *(a+i)=i+1;
    lastn=n;
	while(lastn>1)
	{
		int* p=a;
		while(p<a+n)
		{
			if(*p!=0)
			{
				count++;
				if (count==3)
				{*p=0;count=1;lastn--;}
			}
			p++;
		}
	}

	for (int i = 0; i < n; i++)
	{ if(a[i]!=0){
		printf("笑到最后的人是第%d位",*(a+i));
		break;
	}
}
}

