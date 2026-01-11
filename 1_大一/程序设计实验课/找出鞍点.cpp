#include<stdio.h>
#define N 4
#define M 5
int main()
{
	int i,j,k1=0,k2=0,a[N][M],mini,maxj,flag;
	for(i=0;i<N;i++){
		printf("请输入第%d行：",i+1);
		for(j=0;j<M;j++){
			scanf("%d",&a[i][j]);
		}
		printf("\n"); 
	}
	for(i=0;i<N;i++){
	    maxj=a[i][0];
	    for(j=1;j<M;j++){
	    	if(maxj<a[i][j]) {k1=j;maxj=a[i][j];} 
		}
		mini=a[0][k1];
		for(j=1;j<N;j++){
			if(mini>a[j][k1]) {mini=a[j][k1];k2=j;}
		}
		if(mini==maxj) {printf("存在鞍点为行%d列%d",k2,k1);flag=1;}
		
    }
    if(flag==0) printf("不存在鞍点");
}
