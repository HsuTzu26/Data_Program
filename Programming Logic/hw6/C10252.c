#include <stdio.h> 

int main()
{
	int i, j;
	
	for(i=0;i<=5;i++)
	{
		for(j=0;j<=i;j++)
		{
			printf("*");
		}
		printf("\n");
	}
	
	printf("\n");
	
	for(i=5;i>=0;i--)
	{
		for(j=0;j<=i;j++)
		{
			printf("*");
		}
		printf("\n");
	}
	
	printf("\n");
	
	int n = 0;
	
	for(i=0;i<=4;i++)
	{
		for(j=0;j<=4-i;j++)
		{
			printf(" ");
		}
		for(n=0;n<=i*2;n++)
		{
			printf("*");
		}
		printf("\n");
	}
	
	
	return 0;
}
