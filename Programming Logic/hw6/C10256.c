#include <stdio.h>

int main()
{
	int num;
	int i,j;

	printf("�п�J�@��ơG");
	scanf("%d", &num);
	printf("===============\n");
	
	if(num==2)
	{
		printf("%d�����", num);
	}
	else
	{
		printf("�p��%d����Ʀ� ", num);
	
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
