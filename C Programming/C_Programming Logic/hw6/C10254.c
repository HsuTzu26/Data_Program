# include <stdio.h> 
# include <stdlib.h>

int main()
{
	int i, num = 0, p = 1;
	
	while(num != -1)
	{
		i, num = 0, p = 1;
		printf("請輸入一整數：");
		scanf("%d", &num);
		printf("===============\n");	
		
		if(num > 0)
		{
			for(i=1; i <= num; i++)
			{
				p = p * i;	
				printf("%d! = %d \n", i, p);
			}
		}
		else if(num ==0)
		{
			printf("%d!=1 \n", num);
		}
	}
	
	
	return 0;
}
