# include <stdio.h>
# include <stdlib.h>

int main()
{
	int years = 0;
	
	printf("請輸入西元年份: ");
	scanf("%d", &years);
	
	printf("===============================\n");
	
	if ((years%4==0)&&(years%100!=0))
	{
		printf("%d是閏年", years);		
	}
	else if (years%400 == 0)
	{
		printf("%d是閏年", years);
	}
	else
	{
		printf("%d不是閏年", years);
	}
	
	return 0;
}
