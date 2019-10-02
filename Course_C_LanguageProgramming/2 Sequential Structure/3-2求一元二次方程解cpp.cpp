#include<stdio.h>
#include<math.h>
int main()
{
	double a,b,c,delta,m,n;
	scanf("%lf %lf %lf",&a,&b,&c);
	delta=pow(b,2)-4*a*c;
	if(a==0&&b==0)
	{
		printf("Not an equation");
	}
	else if(a==0)
	{
		printf("%.2f",-c/b);
	}
	else if(delta==0)
	{
		{
			printf("%.2f",-0.5*(b/a));	
		}	
	}
		
	else if(delta>0)
	{
		if(a>0)
			printf("%.2f %.2f",(-b+sqrt(delta))/(2*a),(-b-sqrt(delta))/(2*a));
		else
			printf("%.2f %.2f",(-b-sqrt(delta))/(2*a),(-b+sqrt(delta))/(2*a));
	}
	else
		{
			m=-b/(2*a);
			n=sqrt(-delta)/(2*a);
			if(n>0)
				printf("%.2f+%.2fi %.2f-%.2fi",m,n,m,n);
			else
				printf("%.2f+%.2fi %.2f-%.2fi",m,-n,m,-n);
		}
}

