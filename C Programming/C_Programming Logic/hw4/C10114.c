# include <stdio.h>
# include <stdlib.h>

int main()
{
	int credit, judge, money = 0;
	float years = 0;
	
	printf("�ФJ�H���B��:");
	scanf("%d", &credit);
	printf("ú�ڬO�_���`(1:���`,0:�����`):");
	scanf("%d", &judge);
	
	if (judge == 0)
	{
		money = 0;
	}
	else if (judge == 1)
	{
		printf("�п�J���d�~��:");
		scanf("%f", &years);
		
		if (years < 0.5)
		{
			money = 0;
		}
		else if (years < 1)
		{
			money = credit * 0.05;
		}
		else if (years >= 1)
		{
			money = credit * 0.1;
		}
	}
	else
	{
		printf("Error");
	} 
	
	
	printf("===============================\n");
	
	printf("�w�ɲ{�����B��%d��", money);
	
	
	
	return 0;
}
