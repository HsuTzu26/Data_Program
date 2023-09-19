#include <stdio.h>
#include <stdlib.h>

int main()
{
	int price = 0, tickets = 0;
	int total = 0;
	
	printf("每張入場卷的價格(元): ");
	scanf("%d", &price);
	printf("請輸入顧客欲購買的張數:");
	scanf("%d", &tickets);
	printf("==========================\n");
	total = price * tickets * 0.9;
	
	if(tickets >= 10)
	{
		printf("購買10張以上打九折\n");
		printf("總價為%d元", total);

	} 
	else 
	{
		printf("總價為%d元", price*tickets);
	}
	
	
	return 0;
}
