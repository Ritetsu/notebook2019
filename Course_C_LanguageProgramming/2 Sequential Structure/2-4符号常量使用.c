#include<stdio.h>
#define PI 3.14 
int main()
{	
	double r,c,s;
	scanf("%lf",&r);
	c=2*PI*r;
	s=PI*r*r;
	printf("%.2f %.2f",c,s);	
}
