#include <stdio.h>
int main()
{
	int a[10];
	int i,j,t,flag=1,begin=0,end=9;
	printf("ÊäÈë10¸öÊı×Ö:");
	for(i=0;i<10;i++)
	{
		scanf("%d",&a[i]);
	}
	while(flag){
	flag=0;
	for(i=begin;i<end;i++){
		if(a[i]>a[i+1]){
			t=a[i];a[i]=a[i+1];a[i+1]=t;flag++;
		}
	  }
	  end--;
	  if(flag==0) break;
	  flag=0;
	  for(i=end;i>begin;i--){
	  	if(a[i]<a[i-1]){
	  		t=a[i];a[i]=a[i-1];a[i-1]=t;flag++;
		  }
		
	  }
	  begin++;
    }
    for(i=0;i<10;i++)
      printf("%d ",a[i]);
} 
	

