#include<stdio.h>
#include<math.h>
int main()
{	
	int g,m,x;
	for(g=0;g<=100;g++)
	{
		for(m=0;m<=100;m++)
		{
			for(x=0;x<=100;x++)
			{
				if(g+m+x*3==100&&g*5+m*3+x==100)
				{
					printf("%d %d %d\n",g,m,x*3);
				}
			}
		}
	}
}
	


