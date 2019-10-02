#include<stdio.h>
#include<math.h>
int main()
{	
	int m,n,t,r;
	scanf("%d%d",&m,&n);
	if(n>m)
	{
		t=m;
		m=n;
		n=t;
	}
	
	r=m%n;
	while(r!=0)
	{
		m=n;
		n=r;
		r=m%n;
	}
	printf("%d",n);
}

