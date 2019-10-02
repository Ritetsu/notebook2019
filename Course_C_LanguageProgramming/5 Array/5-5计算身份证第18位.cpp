#include<stdio.h>
#include<math.h>
#include<string.h>
main()
{
	char str1[20];
	int str2[]={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
	int i=0,j=0,sum=0,num,k=99;
	
	gets(str1);
	while(str1[i]!='\0')
	{
		sum=sum+((int)str1[i]-'0')*(str2[i]);
		i++;
	}
	num=sum%11;

	if(num==2) 
	{
		printf("X");	
	}
	else if(num==0) k=1;
	else if(num==1) k=0;
	else if(num==3) k=9;
	else if(num==4) k=8;
	else if(num==5) k=7;
	else if(num==6) k=6;
	else if(num==7) k=5;
	else if(num==8) k=4;
	else if(num==9) k=3;
	else if(num==10) k=2;
	
	if(k!=99)
	{
		printf("%d",k);	
	}
	
}
