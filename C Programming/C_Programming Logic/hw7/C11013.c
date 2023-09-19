#include <stdio.h>

int main()
{
	int num, i;

	printf("請輸入一整數：");
	scanf("%d", &num);
	printf("===============\n");
	
	printf("反向前: %d\n",num);
	
	printf("反向後: ");
	
	while(num!=0)
	{
		i=i*10+num%10;
		num=num/10;
	}
	printf("%d",i);
	
	return 0;
}
