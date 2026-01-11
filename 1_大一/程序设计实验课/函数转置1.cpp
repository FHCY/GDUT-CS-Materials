#include<stdio.h>  //DO NOT edit this line
void change(int (*p)[3]){
    int temp;
    for(int i=0;i<3;i++)
      for(int j=i+1;j<3;j++){
        temp=*(*(p+i)+j);
        *(*(p+i)+j)=*(*(p+j)+i);
        *(*(p+j)+i)=temp;
      }
}
int main()
{  int a[3][3],(*p)[3];
   p=a;
   for (int i = 0; i < 3; i++)
     for (int j = 0; j < 3; j++) 
        scanf("%d",*(a+i)+j);
    change(p);
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 3; j++) {
        printf("%d ",*(*(a+i)+j));
      }
      printf("\n");
     }
}
