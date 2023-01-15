# include <stdio.h>
# include <stdlib.h>

int main()
{
	int price = 0;
	printf("客戶購物金額(元): ");
	scanf("%d", &price);
	
	printf("========================\n");
	
	if (price >= 100000)
	{
		printf("折扣為20%%\n");
		price = price*(1-0.2);
		printf("實付為%d元", price);
	}
	else if (price >= 30000)
	{
		printf("折扣為15%%\n");
		price = price*(1-0.15);
		printf("實付為%d元", price);
	}
	else if (price >= 5000)
	{
		printf("折扣為10%%\n");
		price = price*(1-0.1);
		printf("實付為%d元", price);
	}
	else if (price >= 1000)
	{
		printf("折扣為5%%\n");
		price = price*(1-0.05);
		printf("實付為%d元", price);
	} 
	else 
	{
		printf("折扣為0%%\n");
		printf("實付為%d元", price);
	}
	
	return 0;
}
