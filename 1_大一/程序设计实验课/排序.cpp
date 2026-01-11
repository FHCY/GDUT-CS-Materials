#include<stdio.h>
int main()
{
	int a[11]={1,4,6,9,13,16,19,28,40,100};
	int temp1,temp2,number,end,i,j;
	for(i=1;i<10;i++){
		printf("%d",a[i]);
	}
	printf("输入要读入的数:");
	scanf("%d",&number);
	for(i=0;i<10;i++){
		if(number<a[i]){
			temp1=i;
			break;
		}
	}
}
