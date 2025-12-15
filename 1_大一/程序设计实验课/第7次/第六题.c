#include<stdio.h>
#include<stdlib.h>

struct Student{
	long num;
	float score;
	struct Student* next;
};

int n;

struct Student* create()
{
	struct Student *head=NULL,*p1,*p2;
	n=0;

	p1=p2=malloc(sizeof(struct Student));
	scanf("%ld,%f",&p1->num,&p1->score);

	while(p1->num!=0)
	{
		n++;
		if(n==1)
			head=p1;
		else
			p2->next=p1;
		p2=p1;
		p1=malloc(sizeof(struct Student));
		scanf("%ld,%f",&p1->num,&p1->score);
	}
	free(p1);
	p2->next=NULL;
	return head;
}

int main()
{
	struct Student* now=create();
	while(now!=NULL)
	{
		printf("num:%5ld,score:%5.1f\n",now->num,now->score);
		now=now->next;
	}
	return 0;
}

