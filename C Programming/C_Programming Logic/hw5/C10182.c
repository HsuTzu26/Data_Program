# include <stdio.h> 
# include <stdlib.h>

int main()
{
	int i, num = 0, p = 1;
	
	printf("請輸入一整數：");
	scanf("%d", &num);
	printf("===============\n");
	
	if(num > 0)
	{
		for(i=1; i <= num; i++)
		{
			p = p * i;	
		}
	
		printf("%d! = %d", num, p);
	}
	else
	{
		printf("Error");
	}
	
	return 0;
}
