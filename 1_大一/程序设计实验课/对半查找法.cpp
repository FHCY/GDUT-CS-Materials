#include<stdio.h>
#define N 15
int main()
{
	int i,number,low=0,high=N-1,mid,a[N]={1,3,4,5,6,8,12,23,34,44,45,56,57,58,68};
	printf("请输入需要查找的数：");
	scanf("%d",&number);
	
	while(low<=high){
		mid=(low+high)/2;
	    if(number>a[mid]) low=mid+1;
	    else if(number<a[mid]) high=mid-1;
	    else {printf("该数是数组中的第%d个数",mid+1);break;}
	}
	if(low>high) printf("数组中无此数");
} 
