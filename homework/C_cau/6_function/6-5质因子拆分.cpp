#include<stdio.h>
#include<math.h>
int isprime(int num)
{
	int a,b=0;
	for(a=2;a<sqrt(num)+1;a++)
	{
		if(num%a==0)
		{
			b=1;
			break;
		}	
	}
	if(b==0||num==2)
	{
		return 1;
		}
	else
	{
		return 0;
		}	
}

int main()
{
	int n,i,j=0,k,l=0,m,prime[99],factor[99];
	scanf("%d",&n);
	
	for(i=2;i<n;i++)
	{
		if(isprime(i))
		{
			prime[j]=i;
			j++;
		}
	}
	
	for(k=j-1;k>=0;k--)
	{
		while(n%prime[k]==0)
		{
			n=n/prime[k];
			factor[l]=prime[k];
			l++;
		}
	}
	
	if(factor[0]>0)
	{
		for(i=0;i<l;i++)
		{
			printf("%d ",factor[i]);
		}
	}
	else
	{
		printf("%d 1 ",n);
	}
}
