#include <stdio.h>
#include <string.h>
struct Student {
    int num;
    char name[20];
    float score[3];
};void print(struct Student *student, int n);
void input(struct Student *student,int n);
int main() {
    struct Student student[5];
    printf("请输入学生信息：");
    int number=5;
    input(student,number);
    int n;
    printf("请输入需要查询第几位学生：");
    scanf("%d", &n);
    print(student, n-1);
    return 0;
}
void print(struct Student *student, int n) {
    printf("%d %s ", student[n].num, student[n].name);
    for (int i = 0; i < 3; i++) {
        printf("%f ", student[n].score[i]);
    }
}
void input(struct Student *student,int n){
	for (int i = 0; i < n; i++) {
        scanf("%d %s", &student[i].num, student[i].name);
        for (int j = 0; j < 3; j++)
            scanf("%f", &student[i].score[j]);
    }
}
