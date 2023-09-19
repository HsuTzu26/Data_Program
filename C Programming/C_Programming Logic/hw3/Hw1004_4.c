#include <stdio.h>
#include <stdlib.h>

int main()
{
	int num = 0;
	printf("叫块タ俱计");
	scanf("%d", &num);
	printf("==========================\n");
	
	if( (num%2)==0 || (num%3)==0)
	{
		printf("计2┪3计");
	} 
	else
	{
		printf("计獶2┪3计");
	}
	
	return 0;
}
