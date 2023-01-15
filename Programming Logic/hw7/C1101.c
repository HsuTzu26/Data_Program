#include <stdio.h>

int main()
{
	int num, i;

	printf("請輸入一整數：");
	scanf("%d", &num);
	printf("===============\n");
	
	printf("%d的所有正因數: ",num);
	for(i=1;i<=num;i++)
	{
		if(num%i==0)
		{
			printf("%d ",i);
		}	
	}
	
	
	return 0;
}
