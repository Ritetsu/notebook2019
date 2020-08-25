#include<stdio.h>
int main()
{
	int a,b,c,d,m;
	scanf("%d",&m);
	a=m/1000;
	b=(m-(a*1000))/100;
	c=(m-b*100-a*1000)/10;
	d=(m-b*100-a*1000)%10;
	a+2>9?a=(a+2)%10:a=a+2;
	b+2>9?b=(b+2)%10:b=b+2;
	c+2>9?c=(c+2)%10:c=c+2;
	d+2>9?d=(d+2)%10:d=d+2;
	printf("%d",a*1000+b*100+c*10+d);
}