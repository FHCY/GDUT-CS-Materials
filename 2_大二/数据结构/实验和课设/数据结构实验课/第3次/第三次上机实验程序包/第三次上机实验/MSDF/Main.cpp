#include<iostream>
#include<vector>
#include<array>
using namespace std;

const int NUM = 10, RADIX = 4;
int A[NUM][RADIX] = { {4,8,7,3},{4,8,7,1},{6,2,4,8},{2,3,7,5},{3,3,2,0},{5,5,2,3},{3,2,4,6},{8,7,8,8},{0,3,8,9},{4,5,7,3} };	//对4873、4871、6248等整数进行排序
int B[NUM][RADIX] = { {0,0,0,1},{0,0,0,1},{1,0,0,1},{1,0,1,1},{2,0,0,2},{2,0,2,0},{2,0,2,2},{2,0,2,3},{2,2,0,2},{2,2,2,2} };

void print(vector<array<int, RADIX>> x)
{
	static int cnt = 0;
	cout << cnt << ": ";
	cnt++;

	for (auto& seq : x)
	{
		for (auto& digit : seq)
			cout << digit;
		cout << ' ';
	}
	cout << endl;
}

vector<array<int,RADIX>> MSDF(vector<array<int, RADIX>> res, int depth)
{
	if (depth == RADIX)
		return res;
	vector<array<int, RADIX>> sub_array[10];

	print(res);

	//分配
	for (auto& x : res)
		sub_array[x[depth]].push_back(x);
	res.clear();

	for (int j = 0; j <= 9; j++)
	{
		//递归处理分配后的子序列
		if (sub_array[j].size() > 1)
			sub_array[j]=MSDF(sub_array[j],depth+1);

		//收集
		for (auto& x : sub_array[j])
			res.push_back(x);
	}
	return res;
}

int main()
{
	vector<array<int, RADIX>> res;

	for (int i = 0; i < NUM; i++)
	{
		array<int, RADIX> temp;
		for (int j = 0; j < RADIX; j++)
			temp[j] = A[i][j];
		res.push_back(temp);
	}

	res=MSDF(res, 0);
	printf("\n排序完成！结果：\n");
	print(res);

	return 0;
}