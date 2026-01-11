// ConsoleApplication1.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <stdio.h>
#include <stdbool.h>
#include <string.h>

void bank(int id);
bool isSafe();

#define m 3
#define n 5

int Available[m] = { 3, 3, 2 };
int Max[n][m] = { {7, 5, 3}, {3, 2, 2}, {9, 0, 2}, {2, 2, 2}, {4, 3, 3} };
int Allocation[n][m] = { {0, 1, 0}, {2, 0, 0}, {3, 0, 2}, {2, 1, 1}, {0, 0, 2} };
int Need[n][m];
int Request[n][m] = { 0 }; 

int main() {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            Need[i][j] = Max[i][j] - Allocation[i][j];
        }
    }

    if (isSafe()) {
        printf("T0时刻安全\n");
    }
    else {
        printf("T0时刻不安全\n");
    }
    // T1时刻：P1请求(1,0,2)
    printf("----- T1时刻P1请求资源(1,0,2) -----\n");
    memset(Request, 0, sizeof(Request));  // 清空请求数组
    Request[1][0] = 1;
    Request[1][1] = 0;
    Request[1][2] = 2;
    bank(1);

    // T2时刻：P4请求(3,3,0)
    printf("\n----- T2时刻P4请求资源(3,3,0) -----\n");
    memset(Request, 0, sizeof(Request));
    Request[4][0] = 3;
    Request[4][1] = 3;
    Request[4][2] = 0;
    bank(4);

    // T3时刻：P0请求(0,2,0)
    printf("\n----- T3时刻P0请求资源(0,2,0) -----\n");
    memset(Request, 0, sizeof(Request));
    Request[0][0] = 0;
    Request[0][1] = 2;
    Request[0][2] = 0;
    bank(0);

 

    return 0;
}

void bank(int id) {
   
    for (int j = 0; j < m; j++) {
        if (Request[id][j] > Need[id][j]) {
            printf("出错：请求超过需求\n");
            return;
        }
    }

   
    for (int j = 0; j < m; j++) {
        if (Request[id][j] > Available[j]) {
            printf("进程%d需要等待\n", id);
            return;
        }
    }

    
    for (int j = 0; j < m; j++) {
        Available[j] -= Request[id][j];
        Allocation[id][j] += Request[id][j];
        Need[id][j] -= Request[id][j];
    }

    if (isSafe()) {
        printf("资源已分配\n");
    }
    else {
        for (int j = 0; j < m; j++) {
            Available[j] += Request[id][j];
            Allocation[id][j] -= Request[id][j];
            Need[id][j] += Request[id][j];
        }
        printf("进程%d需要等待（分配会导致不安全状态）\n", id);
    }
}

bool isSafe() {
    int work[m];
    bool finish[n] = { false };
    int safeSeq[n];
    int count = 0;

    for (int i = 0; i < m; i++) {
        work[i] = Available[i];
    }

    while (count < n) {
        bool found = false;

        for (int i = 0; i < n; i++) {
            if (!finish[i]) {
                bool canAllocate = true;
                for (int j = 0; j < m; j++) {
                    if (Need[i][j] > work[j]) {
                        canAllocate = false;
                        break;
                    }
                }

                if (canAllocate) {
                    for (int j = 0; j < m; j++) {
                        work[j] += Allocation[i][j];
                    }
                    safeSeq[count] = i;
                    finish[i] = true;
                    count++;
                    found = true;
                }
            }
        }

        if (!found) {
            break;
        }
    }

    return (count == n);
}

// 运行程序: Ctrl + F5 或调试 >“开始执行(不调试)”菜单
// 调试程序: F5 或调试 >“开始调试”菜单

// 入门使用技巧: 
//   1. 使用解决方案资源管理器窗口添加/管理文件
//   2. 使用团队资源管理器窗口连接到源代码管理
//   3. 使用输出窗口查看生成输出和其他消息
//   4. 使用错误列表窗口查看错误
//   5. 转到“项目”>“添加新项”以创建新的代码文件，或转到“项目”>“添加现有项”以将现有代码文件添加到项目
//   6. 将来，若要再次打开此项目，请转到“文件”>“打开”>“项目”并选择 .sln 文件
