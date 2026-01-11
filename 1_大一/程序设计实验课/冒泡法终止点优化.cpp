#include <stdio.h>
int main()
{
	int a[10];
	int i,j,t,tmp=9,b;
	printf("ÊäÈë10¸öÊı×Ö£º");
	for(i=0;i<10;i++)
	{
		scanf("%d",&a[i]);
	}
	for(i=0;i<9;i++)
	{
	 	
	  for(j=0;j<tmp;j++)
	  {
	  	if(a[j]>a[j+1])
	  	{
	  		t=a[j];
	  		a[j]=a[j+1];
	  		a[j+1]=t;
	  		b=j;
	  		
		}
	  }
	  if(tmp==b) break;
	  tmp=b;
   }
	for(i=0;i<10;i++)
	  printf("%d ",a[i]);
}
