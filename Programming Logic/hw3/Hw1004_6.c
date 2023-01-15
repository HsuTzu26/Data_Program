#include <stdio.h>
#include <stdlib.h>

int main()
{
	float area = 0;
	float top, bottom, h;
	printf("請輸入梯形的上底: ");
	scanf("%f", &top);
	printf("請輸入梯形的下底: ");
	scanf("%f", &bottom);
	printf("請輸入梯形的高: ");
	scanf("%f", &h);
	
	area  = (top+bottom) * h / 2;
	printf("==========================\n");
	printf("梯形面積=%.2f",area);
	
	return 0;
}
