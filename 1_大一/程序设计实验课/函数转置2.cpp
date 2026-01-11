#include<stdio.h>  //DO NOT edit this line
void change(int *p){
    int temp;
    for(int i=0;i<3;i++)
      for(int j=i+1;j<3;j++){
        temp=*(p+i*3+j);
        *(p+i*3+j)=*(p+j*3+i);
        *(p+j*3+i)=temp;
      }
}
int main()
{  int a[3][3];
   int *p=&a[0][0];
   for (int i = 0; i < 3; i++)
     for (int j = 0; j < 3; j++) 
        scanf("%d",p+i*3+j);
    change(p);
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 3; j++) {
        printf("%d ",*(p+i*3+j));
      }
      printf("\n");
     }
}
