#include<stdio.h>
int maxY(int a,int b)
{	
	int m,n,r;
	if(a>b) m=a,n=b;
	else m=b,n=a;
	r=m%n;
	while(r!=0)
	{
		m=n;
		n=r;
		r=m%n;
	}
	return n;
}


int minB(int a,int b)
{
	return (a*b)/maxY(a,b);
}

int main()
{
	int a,b;
	scanf("%d%d",&a,&b);
	printf("%d %d",maxY(a,b),minB(a,b));
	return 0;
}