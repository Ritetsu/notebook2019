#include<stdio.h>
#include<math.h>
#include<string.h>
main()
{
	char str1[99],str2[20],strx[99],stry[20];
	int i=0,j=0,n,r,q=0;
	scanf("%d%s%s",&n,str1,str2);
	
	while(str1[i]!='\0')
	{
		i++;
	}
	
	for(j=0;j<n-1;j++)
	{
		strx[j]=str1[j];
	}
	strx[j]='\0';
	
	for(r=n-1;r<i;r++)
	{
		stry[q]=str1[r];
		q++;
	}
	stry[q]='\0';
		
	strcat(strx,str2);
	printf("%s",strcat(strx,stry));
}
