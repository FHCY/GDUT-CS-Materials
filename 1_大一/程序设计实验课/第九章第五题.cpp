#include <stdio.h>
#include <string.h>
struct Student {
    int num;
    char name[20];
    float score[3];
};
void input(struct Student *student,int n);
int main() {
    struct Student student[10];
    printf("请输入学生信息：");
    int number=10,j;
    float sum[10];
    input(student,number);
    for(int i=0;i<number;i++){
    	sum[i]=student[i].score[0]+student[i].score[1]+student[i].score[2];
	}
	float max=sum[0],allsum=max;
	for(int i=1;i<number;i++){
		if(max<sum[i]) {max=sum[i];j=i;}
		allsum=sum[i]+allsum;
	}
	printf("总平均成绩为%f ",allsum/number/3);
    printf("最高分学生学号为%d，名字为%s，\n其3门平均成绩为%f，3门成绩分别为", student[j].num, student[j].name,sum[j]/3);
    for (int i = 0; i < 3; i++) {
        printf("%f ", student[j].score[i]);
    }
    return 0;
}
void input(struct Student *student,int n){
	for (int i = 0; i < n; i++) {
        scanf("%d %s", &student[i].num, student[i].name);
        for (int j = 0; j < 3; j++)
            scanf("%f", &student[i].score[j]);
    }
}
