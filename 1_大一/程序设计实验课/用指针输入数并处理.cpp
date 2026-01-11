#include<stdio.h>
void inputnumber(int *x,int n){
	printf("请输入%d个整数：",n);
	for(int i=0;i<n;i++){
		scanf("%d",x+i);
	}
}
void exchange(int *x,int n){
	 int min,max,*t1,*t2,*t;
	 min=*x,max=*x,t1=x,t2=x,t=x;
     for(int i=0;i<n;i++,x++){
	 	if(min>*x) min=*x,t1=x;
	 	if(max<*x) max=*x,t2=x;
	 }
     int temp;
     if(max==*t && min==*(x-1)) {temp=*(x-1);*(x-1)=*t;*t=temp;}
     else { temp=*t1,*t1=*t,*t=temp;
	 temp=*t2,*t2=*(x-1),*(x-1)=temp;}

} 
int main()
{
	int a[10];
	int *p=a;
	inputnumber(p,10);
	exchange(p,10);
	p=a;
	void print(int *x,int n);
	print(p,10);
}
void print(int *x,int n){
	printf("结果是：");
	for(int i=0;i<n;i++,x++){
		printf("%d ",*x);
	}
} 
