#include "stdio.h"
#include "math.h"
float Sqrt(float A, float p, float e)
{
    
    if(fabs(p*p-A>=e)) Sqrt(A,(p+A/p)/2,e); 
    else return p;
}

void changeTest(int test) {
	test = 1;
}
int main()
{
	int test = 0;
	changeTest(test);
	printf("%d", &test);
}

