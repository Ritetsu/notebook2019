#include<stdio.h>
int main()
{
	char momstr[99],sonstr[99];
	int i,j,m=0,n=0,k=0,sum=0,a=0;
	gets(momstr);
	gets(sonstr);
	for(i=0;i<99;i++)
	{
		if(momstr[i]!='\0')
		{
			m++;
		}
		else
		{
			break;
		}
	}
	for(i=0;i<99;i++)
	{
		if(sonstr[i]!='\0')
		{
			n++;
		}
		else
		{
			break;
		}
	}

	for(i=0;i<m;i++)
	{
		a=i;
		for(j=0;j<n;j++)
		{	
			if(momstr[a]==sonstr[j])
			{	
				a++;
				k++;
			}
		}
		if(k==n)
		{
			sum++;
			k=0;
		}
		else
		{
			k=0;
		}
	}

	printf("%d",sum);
}