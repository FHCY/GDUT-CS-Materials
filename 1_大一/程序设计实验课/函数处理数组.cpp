#include "stdio.h"
int main()
{
	int A[8],B[3];
	void SaveA2B(int *a,int asize,int *b,int bsize);
	void SortAnB(int *a,int asize,int *b,int bsize);
	printf("请输入A数组：");
	for(int i=0;i<8;i++){
		scanf("%d",&A[i]);
	}
	SaveA2B(A,8,B,3); 
	SortAnB(A,8,B,3);
	
}
void SaveA2B(int *a,int asize,int *b,int bsize){
	int max=*a,min=*a,i,j=0,t=0;
	printf("输入数组为:");
	for(i=0;i<asize;i++){
		if(max<*(a+i)) {max=*(a+i);j=i;}
		if(min>*(a+i)) {min=*(a+i);t=i;}
		printf("%d ",a[i]);
	}
	while(i=max%min){
		max=min;
		min=i;
	}
	b[0]=*(a+j),b[1]=*(a+t),b[2]=*(a+j)**(a+t)/min;
	printf("\nb数组为：");
	for(i=0;i<bsize;i++){
		printf("%d ",b[i]);
	}
}
void SortAnB(int *a,int asize,int *b,int bsize){
	int i,j;
	for(i=asize;i<asize+bsize;i++)
	*(a+i)=*(b+i-asize);
	for(i=0;i<asize+bsize-1;i++)
	{
		for(j=0;j<asize+bsize-i-1;j++){
			if(*(a+j)<*(a+j+1)) {int temp=*(a+j);*(a+j)=*(a+j+1);*(a+j+1)=temp;}
		}
	 }
	 printf("\n排序后的A数组：");
	 for(i=0;i<asize;i++){
	 	printf("%d ",*(a+i));
	 }
	 printf("\n排序后的B数组：");
	 for(i=asize;i<asize+bsize;i++)
	 printf("%d ",*(a+i)) ;
}

