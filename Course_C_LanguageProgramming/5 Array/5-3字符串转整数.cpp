#include<stdio.h>
#include<math.h>
#include<string.h>
main()
{
	char str1[99];
	int a[99],n=0,i=0,j,k=0,num=0,m,p=0;
	scanf("%s",str1);
	
	while(str1[i]!='\0')
	{
		a[i]=str1[i]-'0';
		i++;
	}
	
	while(a[n]==0)
	{
		n++;
	}

	p=strlen(str1)-n;

	for(j=p-1;j>=0;j--)
	{
		num=num+pow(10,k)*a[j+n];
		k++;
	}
	printf("%d",num*2);
}
