/*

图论模块编程题 第5题

作者：22级计科8班 陈煜祺
学号：3122008883 
思路：选用Kruskal算法求解最小生成树，用并查集判断是否存在环。 

注：
为便于测试程序正确性，采用洛谷网站评测系统。
文件夹中也附上了其中一个测试样例和运行截图。
题目描述可见附图。

题目链接如下：
https://www.luogu.com.cn/problem/P3366
本代码评测记录： 
https://www.luogu.com.cn/record/112141790

*/

#include<stdio.h>
#include<stdlib.h> 

int cnt,n,m,uf[5005];
struct e{
	int from,to,val;
}edge[200005];
long int ans;

//qsort库函数调用的cmp比较函数 
int cmp(const void *a, const void *b)
{
	return ((struct e*)a)->val - ((struct e*)b)->val;
}

//查 
int find(int x)
{
	if(uf[x]==x)
		return x;
	return uf[x]=find(uf[x]);
}

//并 
void unionn(int x,int y)
{
	uf[find(x)]=find(y);
}

int main()
{
	scanf("%d%d",&n,&m);
	for(int i=1;i<=n;++i)
		uf[i]=i;
	for(int i=1;i<=m;++i)
		scanf("%d%d%d",&edge[i].from,&edge[i].to,&edge[i].val);
	qsort(edge,m,sizeof(struct e),cmp);

	for(int i=1;i<=m&&cnt<=n-1;++i)
	{
		if(find(edge[i].from)==find(edge[i].to))	//忽略自环 
			continue;
		unionn(edge[i].from,edge[i].to);
		cnt++;
		ans+=edge[i].val;
	}
	
	if(cnt==n-1)
		printf("%ld",ans);
	else
		printf("orz");		//根据题目要求，若该图不连通则输出orz 
	
	return 0;
}
