typedef  int  KeysType;  // 关键字类型为整数类型

typedef struct {
    KeysType* keys; // 关键字
    // 其它数据项
} KeysRcdType;

typedef struct {
    KeysRcdType* rcd; // 0号位置做哨兵
    int length; // 顺序表长度
    int size;          //顺序表容量
    int digitNum;// 关键字位数
    int radix;        //关键字基数，此时是十进制整数的基数
}KeysSqList; // 顺序表类型

#define  OK 1