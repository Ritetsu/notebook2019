#include<stdio.h>
int main()
{
	int a,g,s,b,revnum;
	scanf("%d",&a);
	b=a/100;
	s=(a%100)/10;
	g=a%10;
	revnum=g*100+s*10+b;
	printf("%d",revnum);
}