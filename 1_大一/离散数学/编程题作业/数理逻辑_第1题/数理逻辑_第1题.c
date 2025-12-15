/*

数理逻辑模块编程题 第1题 

作者：22级计科8班 陈煜祺
学号：3122008883 

注： 
因先前已在Anyview-DM03EX1题目中实现，沿用代码如下。
因缺乏Anyview系统内部定义的数据类型，在本地编译无法通过，请到Anyview系统中查看。

*/

#include "allinclude.h"

const int N=5e4;
int len,topoper,topvar;
StatementFormulaSymbles a[N],oper[N],var[N];

void cal()
{
    if(oper[topoper]==Negation)
        topoper--;
    else
    {
        topoper--;
        topvar--;
    }
}

Boolean isStatementFormula(pStatementFormula pFormula)
{   
    len=topoper=topvar=0;

    while(getCurrentSymbleType(pFormula)!=EndOfFormula)
    {
        a[++len]=getCurrentSymbleType(pFormula);
        nextPos(pFormula);
    }

    for(int i=1;i<=len;i++)
    {
        if(a[i]==Exception)
            return false;

        if(a[i]==Negation||a[i]==Conjunction||a[i]==Disjunction||a[i]==Implication||a[i]==Equivalence)
        {
            //否定号特判 
            if(a[i]==Negation)
                if(a[i-1]==RightParenthesis||a[i-1]==PropositionalVariable||(a[i+1]!=Negation&&a[i+1]!=LeftParenthesis&&a[i+1]!=PropositionalVariable))
                    return false;
    
            oper[++topoper]=a[i];
            if(topoper>=2&&oper[topoper-1]!=LeftParenthesis)
                cal();
        }

        else if(a[i]==PropositionalVariable)
        {
            var[++topvar]=a[i];
        }

        else if(a[i]==LeftParenthesis)
        {
            oper[++topoper]=a[i];
        }

        else if(a[i]==RightParenthesis)
        {
            while(oper[topoper]!=LeftParenthesis)
            {
                cal();
                if(topoper<=0)
                    return false;
            }
            topoper--;
        }
    }

    while(topoper)
        cal();

    if(topvar!=1&&len!=0)
        return false;
    else
        return true;
}

