#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FILENAME_LENGTH 10  // 文件名称长度
#define COMMAND_LENGTH 10   // 命令行长度
#define PATH_LENGTH 30      // 参数长度

struct filenode
{
    char filename[FILENAME_LENGTH];
    int isdir;
    char content[255];
    struct filenode *parent;
    struct filenode *child;
    struct filenode *prev;
    struct filenode *next;
};

struct filenode *initnode(char filename[], int isdir);
void createroot();
int run();
int findpath(char *topath);
void help();
int mkdir();
int create();
int read();
int write();
int del();
int rm();
int cd();
int dir();

struct filenode *root, *recent, *temp, *ttemp, *temp_child;
char path[PATH_LENGTH], command[COMMAND_LENGTH], temppath[PATH_LENGTH], recentpath[PATH_LENGTH];

// 创建文件或目录的存储节点
struct filenode *initnode(char filename[], int isdir)
{
    struct filenode *node = (struct filenode *)malloc(sizeof(struct filenode));
    strcpy(node->filename, filename);
    node->isdir = isdir;
    node->parent = NULL;
    node->child = NULL;
    node->prev = NULL;
    node->next = NULL;
    return node;
}

// 初始化文件系统根结点
void createroot()
{
    recent = root = initnode("/", 1);
    root->parent = NULL;
    root->child = NULL;
    root->prev = root->next = NULL;
    strcpy(path, "/");
}

void help()
{
    printf("\n");
    printf("create:             建立文件。\n");
    printf("read:               读取文件。\n");
    printf("write:              写入文件。\n");
    printf("delete:             删除文件。\n");
    printf("rm:                 删除目录。\n");
    printf("mkdir:              建立目录。\n");
    printf("cd:                 切换目录。\n");
    printf("dir:                显示目录。\n");
    printf("logout:             退出登录。\n");
}

int dir()
{
    int i = 0, j = 0;
    temp = recent;
    if (temp == root)
    {
        printf("      <DIR>                         %s\n", ".");
    }
    if (temp != root)
    {
        printf("      <DIR>                         %s\n", "..");
        i++;
    }
    if (temp->child == NULL)
    {
        printf("Total: %d directors      %d files\n", i, j);
        return 1;
    }
    temp = temp->child;
    while (temp)
    {
        if (temp->isdir)
        {
            printf("      <DIR>                        %s\n", temp->filename);
            i++;
        }
        else
        {
            printf("      <FILE>                       %s\n", temp->filename);
            j++;
        }
        temp = temp->next;
    }
    printf("Total: %d directors      %d files\n", i, j);
    return 0;
}

int read()
{
    char filename[FILENAME_LENGTH];
    scanf("%s", filename);
    if (recent->child == NULL)
    {
        printf("文件不存在!\n");
        return 1;
    }
    if (strcmp(recent->child->filename, filename) == 0)
    {
        //待补全
        printf("%s\n", recent->child->content);
        return 0;
    }
    else
    {
        temp = recent->child;
        while (temp->next)
        {
            if (strcmp(temp->next->filename, filename) == 0)
            {
                //待补全
                printf("%s\n", temp->next->content);
                return 0;
            }
            temp = temp->next;
        }
        printf("文件不存在!\n");
        return 1;
    }
}

int write()
{
    char filename[FILENAME_LENGTH];
    scanf("%s", filename);
    if (recent->child == NULL)
    {
        printf("文件不存在!\n");
        return 1;
    }
    if (strcmp(recent->child->filename, filename) == 0)
    {
        //待补全
        scanf("%s", recent->child->content);

        printf("文件写入成功!\n");
        return 0;
    }
    else
    {
        temp = recent->child;
        while (temp->next)
        {
            if (strcmp(temp->next->filename, filename) == 0)
            {
                //待补全
                scanf("%s", temp->next->content);
                printf("文件写入成功!\n");
                return 0;
            }
            temp = temp->next;
        }
        printf("文件不存在!\n");
        return 1;
    }
}

int del()
{
    char filename[FILENAME_LENGTH];
    scanf("%s", filename);
    temp = (struct filenode *)malloc(sizeof(struct filenode));

    if (recent->child)
    {
        temp = recent->child;
        while (temp->next && (strcmp(temp->filename, filename) != 0 || temp->isdir != 0))
            temp = temp->next;
        if (strcmp(temp->filename, filename) != 0 || temp->isdir != 0)
        {
            printf("不存在该文件！\n");
            return 0;
        }
    }
    else
    {
        printf("不存在该文件！\n");
        return 0;
    }

    if (temp->parent == NULL)
    {
        //待补全
        temp->prev->next = temp->next;
        if(temp->next != NULL)
            temp->next->prev = temp->prev;

    }
    else
    {
        //待补全
        if(temp->next != NULL)
            temp->next->prev = temp->prev;
        temp->parent->child = temp->next;


    }
    free(temp);
    printf("文件已删除!\n");
    return 0;
}

void recycle_memory(struct filenode *now)
{
    struct filenode *p, *q;
    p=now->child;
    while(p!=NULL)
    {
        q=p->next;
        recycle_memory(p);
        p=q;
    }
    // printf("Deleting %s ...\n", now->filename);
    free(now);
}

// void recycle_memory(struct filenode *now)
// {
//     struct filenode *p, *q;
//     p=q=now->child;
//     while(p!=NULL)
//     {
//         if(p->child!=NULL)
//             recycle_memory(p->child);
//         q=p->next;
//         printf("Deleted %s\n", p->filename);
//         free(p);
//         p=q;
//     }
//     printf("Deleted %s\n", now->filename);
//     free(now);
// }

// ===TEST CODE===
// mkdir dir1
// create file1
// cd dir1
// mkdir dir2
// create file2
// cd dir2
// mkdir dir3
// cd ..
// cd ..
// rm dir1

int rm()
{
    char filename[FILENAME_LENGTH];
    scanf("%s", filename);
    temp = (struct filenode *)malloc(sizeof(struct filenode));

    if (recent->child)
    {
        temp = recent->child;
        while (temp->next && (strcmp(temp->filename, filename) != 0 || temp->isdir != 1))
            temp = temp->next;
        if (strcmp(temp->filename, filename) != 0 || temp->isdir != 1)
        {
            printf("不存在该目录！\n");
            return 0;
        }
    }
    else
    {
        printf("不存在该目录！\n");
        return 0;
    }

    if (temp->parent == NULL)
    {
        //待补全
        temp->prev->next = temp->next;
        if(temp->next != NULL)
            temp->next->prev = temp->prev;

    }
    else
    {
        //待补全
        if(temp->next != NULL)
            temp->next->prev = temp->prev;
        temp->parent->child = temp->next;

    }
    recycle_memory(temp);
    printf("目录已删除!\n");
    return 0;
}

int cd()
{
    char topath[PATH_LENGTH];
    scanf("%s", topath);
    if (strcmp(topath, ".") == 0)
        return 0;
    if (strcmp(topath, "..") == 0)
    {
        int i;
        while (recent->prev)
            recent = recent->prev;
        if (recent->parent)
        {
            recent = recent->parent;
        }

        i = strlen(path);
        while (path[i] != '/' && i > 0)
            i--;

        if (i != 0)
        {
            path[i] = '\0';
        }
        else
        {
            path[i + 1] = '\0';
        }
    }
    else
    {
        findpath(topath);
    }
    return 0;
}

int findpath(char *topath)
{
    unsigned int i = 0;
    int sign = 1;
    if (strcmp(topath, "/") == 0)
    {
        recent = root;
        strcpy(path, "/");
        return 0;
    }
    temp = recent;
    strcpy(temppath, path);
    if (topath[0] == '/')
    {
        recent = root->child;
        i++;
        strcpy(path, "/");
    }
    else
    {
        if (recent != NULL && recent != root)
        {
            strcat(path, "/");
        }

        if (recent && recent->child)
        {
            if (recent->isdir)
                recent = recent->child;
            else
            {
                printf("路径错误！\n");
                return 1;
            }
        }
    }
    while (i <= strlen(topath) && recent)
    {
        int j = 0;
        if (topath[i] == '/' && recent->child)
        {
            i++;
            if (recent->isdir)
                recent = recent->child;
            else
            {
                printf("路径错误\n");
                return 1;
            }
            strcat(path, "/");
        }
        while (topath[i] != '/' && i <= strlen(topath))
        {
            recentpath[j] = topath[i];
            i++;
            j++;
        }
        recentpath[j] = '\0';
        while ((strcmp(recent->filename, recentpath) != 0 || (recent->isdir != 1)) && recent->next != NULL)
        {
            recent = recent->next;
        }
        if (strcmp(recent->filename, recentpath) == 0)
        {
            if (recent->isdir == 0)
            {
                strcpy(path, temppath);
                recent = temp;
                printf("是文件不是目录。\n");
                return 1;
            }
            strcat(path, recent->filename);
        }
        if (strcmp(recent->filename, recentpath) != 0 || recent == NULL)
        {
            strcpy(path, temppath);
            recent = temp;
            printf("输入路径错误\n");
            return 1;
        }
    }
    return 0;
}

int mkdir()
{
    temp = initnode(" ", 1);
    scanf("%s", temp->filename);
    if (recent->child == NULL)
    {
        temp->parent = recent;
        temp->child = NULL;
        recent->child = temp;
        temp->prev = temp->next = NULL;
        printf("目录建立成功!\n");
    }
    else
    {
        ttemp = recent->child;
        if (strcmp(ttemp->filename, temp->filename) == 0 && ttemp->isdir == 1)
        {
            printf("目录已存在!\n");
            return 1;
        }
        while (ttemp->next)
        {
            ttemp = ttemp->next;
            if (strcmp(ttemp->filename, temp->filename) == 0 && ttemp->isdir == 1)
            {
                printf("目录已存在!\n");
                return 1;
            }
        }
        ttemp->next = temp;
        temp->parent = NULL;
        temp->child = NULL;
        temp->prev = ttemp;
        temp->next = NULL;
        printf("目录建立成功!\n");
    }
    return 0;
}

int create()
{
    temp = initnode(" ", 0);
    scanf("%s", temp->filename);
    if (recent->child == NULL)
    {
        temp->parent = recent;
        temp->child = NULL;
        recent->child = temp;
        temp->prev = temp->next = NULL;
        printf("文件创建成功!\n");
    }
    else
    {
        ttemp = recent->child;
        if (strcmp(ttemp->filename, temp->filename) == 0 && ttemp->isdir == 0)
        {
            printf("文件已存在!\n");
            return 1;
        }
        while (ttemp->next)
        {
            ttemp = ttemp->next;
            if (strcmp(ttemp->filename, temp->filename) == 0 && ttemp->isdir == 0)
            {
                printf("文件已存在!\n");
                return 1;
            }
        }
        ttemp->next = temp;
        temp->parent = NULL;
        temp->child = NULL;
        temp->prev = ttemp;
        temp->next = NULL;
        printf("文件建立成功!\n");
    }
    return 0;
}

int run()
{
    printf("filesystem:%s>", path);
    scanf("%s", command);
    if (strcmp(command, "mkdir") == 0)
        mkdir();
    else if (strcmp(command, "dir") == 0)
        dir();
    else if (strcmp(command, "cd") == 0)
        cd();
    else if (strcmp(command, "create") == 0)
        create();
    else if (strcmp(command, "read") == 0)
        read();
    else if (strcmp(command, "rm") == 0)
        rm();
    else if (strcmp(command, "write") == 0)
        write();
    else if (strcmp(command, "delete") == 0)
        del();
    else if (strcmp(command, "help") == 0)
        help();
    else if (strcmp(command, "logout") == 0)
        return 0;
    else
        printf("请参考help提供的命令列表!\n");
    return 1;
}

int main()
{
    printf("***************************************************************\n");
    printf("********************操作系统课程设计项目***********************\n");
    printf("*                     简单文件系统模拟                        *\n");
    printf("*                   键入help可以获取帮助                      *\n");
    printf("***************************************************************\n");
    printf("***************************************************************\n");
    printf("\n");
    createroot();
    while (1)
    {
        if (!run())
          break;
    }
    return 0;
}
