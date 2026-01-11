#include <stdio.h>
int main()
{
	int a[10];
	int i,j,t,flag;
	printf("ÊäÈë10¸öÊı×Ö:");
	for(i=0;i<10;i++)
      scanf("%d",&a[i]);
    for(i=0;i<9;i++)
    {
	  flag=0;
	
      for(j=0;j<9-i;j++)
      {
      	
      	if(a[j]>a[j+1]){
      		t=a[j];a[j]=a[j+1];a[j+1]=t;flag++;
		}
		 
	  }
	  if(flag==0) break;
    }
    for(i=0;i<10;i++)
      printf("%d ",a[i]);
} 
