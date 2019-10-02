#include<stdio.h>
void capital(char str[])
{
	int i=0;
	while(str[i]!='\0')
	{
		if(str[i]>'a' && str[i]<'z')
		{
			str[i]=str[i]-32;
			i++;
		}
		else
		{
			str[i]=str[i];
			i++;
		}
	}
}

int main()
{
	char str[99];
	gets(str);
	capital(str);
	printf("%s",str);
}