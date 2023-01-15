#include <stdio.h>
#include <stdlib.h>

int main()
{
	printf("停車超過一小時, 每小時收費40元 \n");
	
	int hour = 0;
	int fee = 40;
	
	printf("請輸入停車幾小時: ");
	scanf("%d", &hour);
	
	if(hour<=1)
	{
		printf("停車未超過1小時, 總費用為:0元");
	} 
	else 
	{
		printf("停車%d小時, 總費用為:%d", hour, hour*fee);
	}
	

	return 0;	
} 
