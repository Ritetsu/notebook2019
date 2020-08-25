#include<stdio.h>
main()
{
	double a[3][4]={{83.00,90.00,86.00,93.00},{95.00,78.00,80.00,90.00},{64.00,82.00,74.00,88.00}};
	double b[4][5],sum;
	int i,j;
	for(i=0;i<=2;i++)
	{
		for(j=0;j<=3;j++)
		{
			b[i][j]=a[i][j];
		}
	}
	
	for(i=0;i<=2;i++)
	{
		b[i][4]=(b[i][0]+b[i][1]+b[i][2]+b[i][3])/4.0;
		sum=sum+b[i][0]+b[i][1]+b[i][2]+b[i][3];
	}
	for(j=0;j<=3;j++)
	{
		b[3][j]=(b[0][j]+b[1][j]+b[2][j])/3.0;
	}
	
	b[3][4]=sum/12.0;
	
	printf("原始成绩:");
	for(i=0;i<=2;i++)
	{	
		printf("\n");
		for(j=0;j<=3;j++)
		{
			printf("%.2f ",a[i][j]);
		}
		
	}
	
	printf("\n");
	
	printf("平均成绩:");
	for(i=0;i<=3;i++)
	{
		printf("\n");
		for(j=0;j<=4;j++)
		{
			printf("%.2f ",b[i][j]);
		}
	}

}
