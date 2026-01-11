#include "stdio.h"
int main()
{
	int a[10],i,m;
	printf("输入10个数：");
	for(i=0;i<10;i++){
		scanf("%d",a+i);
	}
	printf("\n输出需要移动几位：");
	scanf("%d",&m);
	void move(int *x,int n,int m);
	move(a,10,m);
	for(i=0;i<10;i++){
		printf("%d ",*(a+i));
	}
}
void move(int *x,int n,int m){
     int temp=0;
     for(int i=0;i<m;i++){
     	temp=*(x+n-1);
     	for(int *p=x+n-2;p>=x;p--){
     		*(p+1)=*p;
		 }
		 *x=temp;
	 }
}
