#include<iostream>
int main()
{
	int x,sum=0;
	printf("请输入一个7位数：");
	scanf("%d",&x);
	while(x>0){
		sum=x%10+sum;
		x=x/10;
	}
	printf("%d",sum);
}
