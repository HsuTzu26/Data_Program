#include <stdio.h>

int main()
{
	int num;
	int i,j;

	printf("請輸入一整數：");
	scanf("%d", &num);
	printf("===============\n");
	
	if(num==2)
	{
		printf("%d為質數", num);
	}
	else
	{
		printf("小於%d的質數有 ", num);
	
		for(i=2; i<num; i++)
		{
			for(j=2; j<i; j++)
			{
				if(i%j==0)
				{
					break;
				}
			}
		if(j==i)
		{
			printf("%d ", i);
		}
		}	
	}
	
	printf("\n");
	
	
	return 0;
}
