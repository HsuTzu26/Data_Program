#include <stdio.h>
#include <stdlib.h>
#include <time.h> 

int main()
{
	srand(time(NULL));
	
	int randnum = rand()%100 + 1; //取1~100 之間的亂數值 
	int lotterynum;
	printf("請猜一樂透號碼: ");
	scanf("%d", &lotterynum);
	printf("==========================\n");
	
	if(lotterynum == randnum)
	{
		printf("恭喜！你猜對了。");
	}
	else
	{
		printf("貢龜！樂透號碼為%d",randnum);
	}
	
}
