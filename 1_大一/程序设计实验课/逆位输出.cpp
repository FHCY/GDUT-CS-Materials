#include <iostream> 
int main()
{   int a,j=0,i,t;
    printf("请输入一个不多于5位的数：");
    while(1){
    scanf("%d",&a); 
    if(a>=100000) printf("请输入一个不多于5位的数："); 
	else break; 
	}
	t=a;
	printf("该数的逆位各位数字为："); 
    while(a!=0)
    {
     i=a%10;
     printf("%d  ",i);
     a=a/10;
     j++;
	}
	printf("该数有%d位数",j);
}
