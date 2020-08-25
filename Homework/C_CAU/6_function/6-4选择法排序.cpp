#include<stdio.h>
void sort(int num[])
{
	int m,n,t;
	for(m=0;m<10;m++)
	{
		for(n=0;n<10;n++)
		{
			if(num[m]<num[n])
			{
				t=num[m];
				num[m]=num[n];
				num[n]=t;
			}
		}
	}
}

int main()
{
	int num[10],i,j=0;
	for(i=0;i<10;i++)
	{
		scanf("%d",&num[i]);
	}

	sort(num);

	while(j<10)
	{
		printf("%d ",num[j]);
		j++;
	}
	
}