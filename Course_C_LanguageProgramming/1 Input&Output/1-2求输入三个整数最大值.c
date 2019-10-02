#include<stdio.h>
main()
{
	int max(int x,int y, int z);
	int a,b,c,d;
	scanf("%d,%d,%d,%d",&a,&b,&c,&d);
	d=max(a,b,c);
	printf("max=%d\n",d);
	return 0;
}

int max(int x,int y,int z)
{
	int r;
	if(x>y)
	{
		r=x;
	
		if(x>z)
		{
			return(r);
		}
		else
		r=z;
		return(r);
	}
	else
		r=y;
		if(y>z)
		{
			return(r);
		}
		else
		r=z;
		return(r);
}

