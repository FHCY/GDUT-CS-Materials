/*

图论模块编程题 第7题 

作者：22级计科8班 陈煜祺
学号：3122008883 

注：
为节省时间，本题采用C++语言编写。 
实现内容：给定n个权值，用霍夫曼算法求解带这n个权值的最优树。 
输入共两行，第一行一个整数n，第二行n个用空格分隔的整数表示给定的权值。 
输出共一行，一个整数，代表最优树的权。

*/

#include<iostream>
#include<queue>
using namespace std;

int n,ans;
priority_queue< int,vector<int>,greater<int> > q;

int main()
{
	cin>>n;
	int temp;
	for(int i=1;i<=n;i++)
	{
		cin>>temp;
		q.push(temp);
	}

	while(q.size()>1)
	{
		temp=q.top();
		q.pop();
		temp+=q.top();
		q.pop();
		ans+=temp;
		q.push(temp);
	}

	cout<<ans;
	
	return 0;
}

