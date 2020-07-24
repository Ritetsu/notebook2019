#include<stdio.h>
#include<math.h>
int main()
{	int n,k,i,q;
	scanf("%d",&n);
	k=sqrt(n);
	if(n==2)
	{	
		q=1;
		printf("y");
	}
	for(i=2;i<n;i++)
	{
		if(n%i==0)
		{
			printf("n");
			q=1;
			break;
		}
	}
	if(q!=1)
	{
		printf("y");
	}
	
}
	


