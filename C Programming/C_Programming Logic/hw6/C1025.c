#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	int num, iSecret;
	
	srand(time(NULL));
	iSecret = rand()%10 + 1;
	
	while(num != iSecret)
	{
		printf("請輸入一整數(1~10)：");
		scanf("%d", &num);
		printf("===============\n");
	
		if(num < iSecret)
		{
			printf("太小了喔\n");
		}
		else if(num > iSecret)
		{
			printf("太大了喔\n");
		}
	}
	
	printf("Bingo\n");
	
	
	int n = 0;
	int i,j =0;
	
	for(i=0;i<=5;i++)
	{
		for(j=1;j<=i;j++)
		{
			printf(" ");
		}	
		
		for(n=0;n<=5-i;n++)
		{
			printf("*");
		}
		printf("\n");
	}
	
	
	
	return 0;
}
