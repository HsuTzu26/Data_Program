#include <stdio.h>
#include <stdlib.h>

int main()
{
	int value = 0, bool = 0;
	printf("請輸入計算的數值：");
	scanf("%d",&value);
	printf("請輸入1(計算平方值)或2(計算立方值):");
	scanf("%d",&bool);
	printf("==========================\n");
	
	if(bool == 1)
	{
		printf("平方值為：%d", value*value);
	} 
	else if(bool == 2)
	{
		printf("立方值為：%d", value*value*value);
	} 
	else 
	{
		printf("Error!");
	}
	
	
	
	return 0;
}
