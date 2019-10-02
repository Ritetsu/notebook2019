#include<stdio.h>
int main()
{
	int i;
	char word[6]="";
	scanf("%s",&word);
	for(i=0;i<5;i++)
	{
		word[i]=word[i]+4;
	}
	printf("%s",word);
	
}
