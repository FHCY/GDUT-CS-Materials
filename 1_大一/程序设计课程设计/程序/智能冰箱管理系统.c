#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<windows.h>
#define MAX_VOL 50.0
#define MAX_TEMPERLIMIT 10.0
#define MIN_TEMPERLIMIT -20.0
#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))
#define NOT_NUM(x) (strspn((x), "-.0123456789")!=strlen((x)))

//全局变量定义
typedef struct food
{
	char name[50];
	float size;
	float temper;
	unsigned int type;
	struct food* next;
	struct food* prev;
}food;
food *head=NULL,*tail=NULL;
float vol=MAX_VOL,nowtemper=MAX_TEMPERLIMIT;
const char foodtype[3][10]=
{
	"蔬菜",
	"肉类",
	"水果",
};

//功能函数声明
void init_con();
void show_menu();
void load();
void save();
void show_info();
void add_food();
void delete_food();
void find_foodtype();
void update_info();

//主函数
int main()
{
	load();
	init_con();

	char menu_select[5000]={0};
	while(menu_select[0]!='0')
	{
		show_menu();
		scanf("%s",menu_select);
		while(menu_select[0]>'5'||menu_select[0]<'0')
		{
			printf("输入有误，请重新输入:");
			scanf("%s",menu_select);
		}
		switch(menu_select[0])
		{
			case '0':							break;
			case '1':		show_info(); 		break;
			case '2':		add_food(); 		break;
			case '3':		delete_food(); 		break;
			case '4':		find_foodtype();	break;
			case '5':		update_info(); 		break;
		}
	}

	save();
	return 0;
}

//功能1：显示冰箱信息
void show_info()
{
	system("cls");
	printf("\n·冰箱当前信息：\n\n");
	printf("冰箱温度：%10.2f℃\n",nowtemper);
	printf("冰箱剩余容积：%6.2f单位\n\n",vol);
	printf("\n·当前贮存食物列表（已按体积升序排列）：\n\n");
	printf("食物名称    体积   保存温度  种类\n");
	printf("================================================\n");

	food *now=head;
	while(now!=NULL)
	{
		printf("%s：\n       %5.2f单位，%6.2f℃， %s\n",now->name,now->size,now->temper,foodtype[now->type]);
		printf("================================================\n");
		now=now->next;
	}

	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("\n\n显示完毕！按任意键回到主菜单...");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
	system("pause>nul");
}

//功能2：存入新的食物
void add_food()
{
	system("cls");
	printf("\n\n");
	char strtemp[50000]={0};
	food *pnew=malloc(sizeof(food));
//名称
	printf("①请输入新加入的食物名称（不超过20个汉字）：");
	scanf("%s",strtemp);
	while(strlen(strtemp)>40)
	{
		printf("名称过长，请换个名字：");
		scanf("%s",strtemp);
	}
	strcpy(pnew->name,strtemp);
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("食物名称输入成功！\n\n");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
//体积
	printf("②请输入新加入的食物体积：");
	scanf("%s",strtemp);
	while((pnew->size=strtod(strtemp,NULL))<=0)
	{
		printf("输入错误，请重新输入：");
		scanf("%s",strtemp);
	}
	if(pnew->size>vol)
	{
		system("color C0");
		MessageBox(NULL,"食物体积过大，超过冰箱剩余体积！拒绝放入。 \n添加失败，按确定键回到主菜单。              ","添加失败：体积过大",MB_OK|MB_ICONERROR|MB_RIGHT);
		system("color F0");
		free(pnew);
		return;
	}
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("食物体积输入成功！\n\n");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
//温度
	printf("③请输入新加入食物的保存温度：");
	scanf("%s",strtemp);
	while(NOT_NUM(strtemp))
	{
		printf("输入错误，请重新输入：");
		scanf("%s",strtemp);
	}
	pnew->temper=strtod(strtemp,NULL);
	if(pnew->temper<MIN_TEMPERLIMIT)
	{
		system("color C0");
		MessageBox(NULL,"食物所需保存温度过低，超过冰箱最低温度！拒绝放入。 \n添加失败，按确定键回到主菜单。               ","添加失败：保存温度过低",MB_OK|MB_ICONERROR|MB_RIGHT);
		system("color F0");
		free(pnew);
		return;
	}
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("食物保存温度输入成功！\n\n");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
//种类
	printf("④请输入新加入食物的种类：\n注：\n0：蔬菜\n1：肉类\n2：水果\n");
	scanf("%s",strtemp);
	while(strtemp[0]>'2'||strtemp[0]<'0')
	{
		printf("输入有误，请重新输入:");
		scanf("%s",strtemp);
	}
	pnew->type=strtemp[0]-'0';
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("食物种类输入成功！\n\n");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
//入链
	if(head==NULL)
	{
		head=pnew;
		pnew->prev=NULL;
		pnew->next=NULL;
		tail=pnew;
		vol-=pnew->size;
		nowtemper=MIN(nowtemper,pnew->temper);
	}
	else
	{
		food *now=head;
		while(now!=NULL)
		{
			if(strcmp(now->name,pnew->name)==0&&now->temper==pnew->temper&&now->type==pnew->type)
			{
				int flag=MessageBox(NULL,"冰箱中已存在同种食物，是否将两者合并？","提示",MB_YESNO|MB_ICONQUESTION|MB_RIGHT);
				if(flag==IDYES)	//合并体积，移除节点（冰箱容量回增），作为新节点重新入链（冰箱容量减少）
				{
					vol+=now->size;
					now->size+=pnew->size;
					free(pnew);
					pnew=now;
					if(head==pnew&&tail==pnew)
					{
						head=NULL;
						tail=NULL;
						pnew->next=NULL;
						pnew->prev=NULL;
					}
					else if(head==pnew)
					{
						head=pnew->next;
						pnew->next=NULL;
						head->prev=NULL;
					}
					else if(tail==pnew)
					{
						tail=pnew->prev;
						pnew->prev=NULL;
						tail->next=NULL;
					}
					else
					{
						pnew->prev->next=pnew->next;
						pnew->next->prev=pnew->prev;
						pnew->next=NULL;
						pnew->prev=NULL;
					}
				}
				break;
			}
			now=now->next;
		}
		now=head;
		while(now!=NULL)
		{
			if(pnew->size<now->size)
			{
				if(now==head)
				{
					head->prev=pnew;
					pnew->next=head;
					pnew->prev=NULL;
					head=pnew;
				}
				else
				{
					now->prev->next=pnew;
					pnew->prev=now->prev;
					now->prev=pnew;
					pnew->next=now;
				}
				vol-=pnew->size;
				nowtemper=MIN(nowtemper,pnew->temper);
				goto add_food_succeed;
			}
			now=now->next;
		}
		tail->next=pnew;
		pnew->prev=tail;
		pnew->next=NULL;
		tail=pnew;
		vol-=pnew->size;
		nowtemper=MIN(nowtemper,pnew->temper);
	}
	add_food_succeed:
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("\n\n添加成功！按任意键回到主菜单...");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
	system("pause>nul");
}

//功能3：删除现有食物
void delete_food()
{
	system("cls");
	food *now=head;

	printf("\n·现有食物列表（已按体积升序排列）：\n\n");
	printf("食物名称    体积   保存温度  种类\n");
	printf("================================================\n");
	while(now!=NULL)
	{
		printf("%s：\n       %5.2f单位，%6.2f℃， %s\n",now->name,now->size,now->temper,foodtype[now->type]);
		printf("================================================\n");
		now=now->next;
	}

	char delete_target[50000]={0};
	printf("请输入你要删除的食物名称（不超过20个汉字）：\n");
	scanf("%s",delete_target);
	while(strlen(delete_target)>40)
	{
		printf("名称过长，请换个名字：");
		scanf("%s",delete_target);
	}
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("食物名称输入成功！开始检索...\n\n");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);

	int cnt=0;
	float release_vol=0;
	now=head;
	while(now!=NULL)
	{
		if(strcmp(now->name,delete_target)==0)
		{
			cnt++;
			release_vol+=now->size;
			food *pnew=now;
			now=now->next;
			if(head==pnew&&tail==pnew)
			{
				head=NULL;
				tail=NULL;
				pnew->next=NULL;
				pnew->prev=NULL;
			}
			else if(head==pnew)
			{
				head=pnew->next;
				pnew->next=NULL;
				head->prev=NULL;
			}
			else if(tail==pnew)
			{
				tail=pnew->prev;
				pnew->prev=NULL;
				tail->next=NULL;
			}
			else
			{
				pnew->prev->next=pnew->next;
				pnew->next->prev=pnew->prev;
				pnew->next=NULL;
				pnew->prev=NULL;
			}
			free(pnew);
		}
		else
			now=now->next;
	}

	vol+=release_vol;
	nowtemper=MAX_TEMPERLIMIT;
	now=head;
	while(now!=NULL)
	{
		nowtemper=MIN(nowtemper,now->temper);
		now=now->next;
	}

	if(cnt==0)
		printf("检索失败！不存在名为“%s”的食物。\n",delete_target);
	else
		printf("检索成功！共删除%d个名为“%s”的食物，释放冰箱容积%.2f单位。\n",cnt,delete_target,release_vol);

	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("\n删除操作执行完毕！按任意键回到主菜单...");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
	system("pause>nul");
}

//功能4：查询食物信息
void find_foodtype()
{
	system("cls");
	char find_target[50000]={0};
	printf("\n请输入需要查询的食物种类：\n注：\n0：蔬菜\n1：肉类\n2：水果\n");
	scanf("%s",find_target);
	while(find_target[0]>'2'||find_target[0]<'0')
	{
		printf("输入有误，请重新输入:");
		scanf("%s",find_target);
	}
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("食物种类输入成功！开始检索...\n\n");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);

	int cnt=0;
	printf("\n·已找到的%s有：\n\n",foodtype[find_target[0]-'0']);
	printf("食物名称    体积   保存温度  种类\n");
	printf("================================================\n");
	food *now=head;
	while(now!=NULL)
	{
		if(find_target[0]-'0'==now->type)
		{
			cnt++;
			printf("%s：\n       %5.2f单位，%6.2f℃， %s\n",now->name,now->size,now->temper,foodtype[now->type]);
			printf("================================================\n");
		}
		now=now->next;
	}
	printf("共找到%d项。\n",cnt);

	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("\n\n查询完毕！按任意键回到主菜单...");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
	system("pause>nul");
}

//功能5：修改食物信息
void update_info()
{
	system("cls");
	printf("\n·现有食物列表（已按体积升序排列）：\n\n");
	printf("食物名称    体积   保存温度  种类\n");
	printf("================================================\n");
	food *now=head;
	int index=0;
	while(now!=NULL)
	{
		printf("%d、%s：\n       %5.2f单位，%6.2f℃， %s\n",++index,now->name,now->size,now->temper,foodtype[now->type]);
		printf("================================================\n");
		now=now->next;
	}
	char input_index[50000]={0};
	printf("请选择你要修改的食物项，输入它名称前的序号：\n");
	scanf("%s",input_index);
	while(strtod(input_index,NULL)>index||strtod(input_index,NULL)<=0)
	{
		printf("不存在序号“%s”，请重新输入：",input_index);
		scanf("%s",input_index);
	}
	int target_inedx=strtod(input_index,NULL);
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("序号%d输入成功！开始修改...",target_inedx);
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);

	char input_item[50000]={0};
	char infotype[4][10]=
	{
		"食物名称",
		"体积",
		"保存温度",
		"种类",
	};
	printf("\n请输入需要修改的信息项：\n注：\n0：食物名称\n1：体积\n2：保存温度\n3：种类\n");
	scanf("%s",input_item);
	while(input_item[0]>'3'||input_item[0]<'0')
	{
		printf("输入有误，请重新输入:");
		scanf("%s",input_item);
	}
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("序号%d输入成功！请输入新的%s:",input_item[0]-'0',infotype[input_item[0]-'0']);
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);

	food *pnew;
	now=head;
	index=0;
	while(now!=NULL)
	{
		if((++index)==target_inedx)
		{
			pnew=now;
			break;
		}
		now=now->next;
	}
	char strtemp[50000];
	switch(input_item[0]-'0')
	{
		case 0:
		{
			scanf("%s",strtemp);
			while(strlen(strtemp)>40)
			{
				printf("名称过长，请换个名字：");
				scanf("%s",strtemp);
			}
			strcpy(pnew->name,strtemp);
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
			printf("新的食物名称输入成功！\n\n");
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
			break;
		}
		case 1:
		{
			vol+=pnew->size;
			scanf("%s",strtemp);
			while(strtod(strtemp,NULL)<=0||strtod(strtemp,NULL)>vol)
			{
				if(strtod(strtemp,NULL)<=0)
					printf("输入错误，请重新输入：");
				else
					printf("体积过大，请重新输入：");
				scanf("%s",strtemp);
			}
			pnew->size=strtod(strtemp,NULL);

			if(head==pnew&&tail==pnew)
			{
				head=NULL;
				tail=NULL;
				pnew->next=NULL;
				pnew->prev=NULL;
			}
			else if(head==pnew)
			{
				head=pnew->next;
				pnew->next=NULL;
				head->prev=NULL;
			}
			else if(tail==pnew)
			{
				tail=pnew->prev;
				pnew->prev=NULL;
				tail->next=NULL;
			}
			else
			{
				pnew->prev->next=pnew->next;
				pnew->next->prev=pnew->prev;
				pnew->next=NULL;
				pnew->prev=NULL;
			}
			now=head;
			while(now!=NULL)
			{
				if(pnew->size<now->size)
				{
					if(now==head)
					{
						head->prev=pnew;
						pnew->next=head;
						pnew->prev=NULL;
						head=pnew;
					}
					else
					{
						now->prev->next=pnew;
						pnew->prev=now->prev;
						now->prev=pnew;
						pnew->next=now;
					}
					vol-=pnew->size;
					goto update_size_succeed;
				}
				now=now->next;
			}
			tail->next=pnew;
			pnew->prev=tail;
			pnew->next=NULL;
			tail=pnew;
			vol-=pnew->size;
			update_size_succeed:
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
			printf("新的食物体积输入成功！\n\n");
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
			break;
		}
		case 2:
		{
			scanf("%s",strtemp);
			while(NOT_NUM(strtemp)||strtod(strtemp,NULL)<MIN_TEMPERLIMIT)
			{
				if(NOT_NUM(strtemp))
					printf("输入错误，请重新输入：");
				else
					printf("温度过低，请重新输入：");
				scanf("%s",strtemp);
			}
			pnew->temper=strtod(strtemp,NULL);

			now=head;
			nowtemper=MAX_TEMPERLIMIT;
			while(now!=NULL)
			{
				nowtemper=MIN(nowtemper,now->temper);
				now=now->next;
			}

			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
			printf("新的食物保存温度输入成功！\n\n");
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
			break;
		}
		case 3:
		{
			printf("\n注：\n0：蔬菜\n1：肉类\n2：水果\n");
			scanf("%s",strtemp);
			while(strtemp[0]>'2'||strtemp[0]<'0')
			{
				printf("输入有误，请重新输入:");
				scanf("%s",strtemp);
			}
			pnew->type=strtemp[0]-'0';
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
			printf("新的食物种类输入成功！\n\n");
			SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
			break;
		}
	}
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF2);
	printf("修改完成！按任意键回到主菜单...");
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),0xF0);
	system("pause>nul");
}

//加载文件
void load()
{
	FILE* fl=fopen("Data.dat","r");
	if(fl!=NULL)
	{
		food *pnew;
		while(1)
		{
			pnew=malloc(sizeof(food));
			fscanf(fl,"%s %f %f %d",pnew->name,&pnew->size,&pnew->temper,&pnew->type);
			if(feof(fl))
				break;
			if(head==NULL)
			{
				head=pnew;
				pnew->prev=NULL;
				pnew->next=NULL;
				tail=pnew;
			}
			else
			{
				tail->next=pnew;
				pnew->prev=tail;
				pnew->next=NULL;
				tail=pnew;
			}
			vol-=pnew->size;
			nowtemper=MIN(pnew->temper,nowtemper);
		}
	}
	fclose(fl);
}

//保存文件
void save()
{
	FILE* fs=fopen("Data.tmp","w");
	food *now=head;
	while(now!=NULL)
	{
		fprintf(fs,"%s %f %f %d\n",now->name,now->size,now->temper,now->type);
		now=now->next;
	}
	fclose(fs);
	remove("Data.dat");
	rename("Data.tmp","Data.dat");
}

//初始化控制台
void init_con()
{
	system("color F0");
	system("title 智能冰箱管理系统");
	system("mode con cols=49 lines=47");
	EnableMenuItem(GetSystemMenu(GetConsoleWindow(), FALSE), SC_CLOSE, MF_GRAYED);
}

//展示菜单
void show_menu()
{
	system("cls");
	printf("\n");
	printf("================================================\n");
	printf("                                                \n");
	printf("             欢迎来到智能冰箱管理系统           \n");
	printf("                                                \n");
	printf("              ·输入0：退出管理系统              \n");
	printf("                                                \n");
	printf("              ·输入1：显示冰箱信息              \n");
	printf("                                                \n");
	printf("              ·输入2：存入新的食物              \n");
	printf("                                                \n");
	printf("              ·输入3：删除现有食物              \n");
	printf("                                                \n");
	printf("              ·输入4：查询食物信息              \n");
	printf("                                                \n");
	printf("              ·输入5：修改食物信息              \n");
	printf("                                                \n");
	printf("================================================\n");
	printf("\n请输入：");
}
