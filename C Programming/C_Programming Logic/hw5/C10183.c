# include <stdio.h> 
# include <stdlib.h>

int main()
{
	int M = 1234, N, count = 0, correct = 0;
	
	while(count <= 5 && correct == 0)
	{
//		printf("請輸入一密碼：");
//		scanf("%d", &M);
		
		printf("請輸入一整數：");
		scanf("%d", &N);
		printf("===============\n");
		
		if(M == N)
		{
			printf("密碼正確");
			correct = 1;
		}
		else if (count <= 3)
		{
			count = count + 1;
			printf("密碼錯誤\n");
			printf("===============\n");
		}
		else if (count > 3 && count < 5)
		{
			count = count + 1;
			printf("密碼錯誤\n");
			sleep(5);
			printf("===============\n"); 
		}
		else
		{
			count = count + 1;
			printf("錯誤次數過多");
		}
	}
	
	
	
	return 0;
}
