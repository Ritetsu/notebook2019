#include<stdio.h>
int main()
{	
	int a,b,c,x,i;
	x=0;
	scanf("%d,%d,%d",&a,&b,&c);
	if (b>12||c>31)
	{
		printf("data error.\n");
	}
	else if((a%4==0&&a%100!=0)||(a%100==0&&a%400==0))
	{
		if(b<2)
			x=0;
		if(b==2)
			x=x+31;
		if(b>2)
			for(i=1;i<=b-1;i++)
				if(i==2)
					x=x+29;
				else if(i==7||i==8)
					x=x+31;
				else if(i%2==0)
					x=x+30;
				else
					x=x+31;
		x=x+c;
		printf("It is the %dth day.",x);
	}
	else
	{	if(b>=2&&c>27)
		{
			printf("data error.\n");
			return 0;
		}
		else if(b<2)
			x=31;
		else if(b==2)
			x=x+28;
		else if(b>2)
			for(i=1;i<=b-1;i++)
				if(i==2)
					x=x+28;
				else if(i==7||i==8)
					x=x+31;
				else if(i%2==0)
					x=x+30;
				else
					x=x+31;	
		x=x+c;
		printf("It is the %dth day.",x);
	}
	
}
