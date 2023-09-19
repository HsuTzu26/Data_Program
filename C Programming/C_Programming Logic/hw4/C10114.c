# include <stdio.h>
# include <stdlib.h>

int main()
{
	int credit, judge, money = 0;
	float years = 0;
	
	printf("請入信用額度:");
	scanf("%d", &credit);
	printf("繳款是否正常(1:正常,0:不正常):");
	scanf("%d", &judge);
	
	if (judge == 0)
	{
		money = 0;
	}
	else if (judge == 1)
	{
		printf("請輸入持卡年份:");
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
	
	printf("預借現金金額為%d元", money);
	
	
	
	return 0;
}
