#include<stdio.h>

float avg1(int (*a)[5])
{
    float avg=0;
    for(int i=0;i<=3;i++)
        avg+=a[i][0];
    return avg/4;
}

void findfail(int *a,int index)
{
    int cnt=0;
    for(int i=0;i<=4;i++)
        if(a[i]<60)
            cnt++;
    if(cnt>2)
    {
        float sum=0;
        printf("第%d号学生，五门课程成绩分别为：",index);
        for(int i=0;i<=3;i++)
        {
            sum+=a[i];
            printf("%3d，",a[i]);
        }
        sum+=a[4];
        printf("%3d。",a[4]);
        printf("平均成绩为：%-5.2f\n",sum/5);
    }
}

void findgood(int *a,int index)
{
    int cnt=0,flag=1;
    for(int i=0;i<=4;i++)
    {
        if(a[i]>90)
            cnt++;
        if(a[i]<=85)
            flag=0;
    }
    if(cnt>2||flag==1)
    {
        float sum=0;
        printf("第%d号学生，五门课程成绩分别为：",index);
        for(int i=0;i<=3;i++)
        {
            sum+=a[i];
            printf("%3d，",a[i]);
        }
        sum+=a[4];
        printf("%3d。",a[4]);
        printf("平均成绩为：%-5.2f\n",sum/5);
    }
}

int main()
{
    int a[4][5]=
    {
        {0,59,58,90,100},
        {86,87,88,89,90},
        {23,35,47,100,100},
        {99,82,91,100,88}
    };

    printf("第一门成绩的平均分是：%5.2f分\n\n",avg1(a));

    printf("有两门以上课程成绩不及格的学生有：\n");
    for(int i=0;i<=3;i++)
        findfail(a[i],i+1);

    printf("\n平均成绩在90分以上或全部课程在85分以上的学生有：\n");
    for(int i=0;i<=3;i++)
        findgood(a[i],i+1);

    return 0;
}
