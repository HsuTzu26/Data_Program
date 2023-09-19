# include <stdio.h> 
# include <stdlib.h>

int main()
{
	int num, sum = 0;
	
	while(num > 0)
	{
		printf("請輸入一整數：");
		scanf("%d", &num);
		printf("===============\n");
		
		if(num > 0)
		{
			sum = sum + num;
			printf("總和為%d\n", sum);
		}
	}
	
	printf("程式結束");
	
}
