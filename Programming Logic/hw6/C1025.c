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
		printf("�п�J�@���(1~10)�G");
		scanf("%d", &num);
		printf("===============\n");
	
		if(num < iSecret)
		{
			printf("�Ӥp�F��\n");
		}
		else if(num > iSecret)
		{
			printf("�Ӥj�F��\n");
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
