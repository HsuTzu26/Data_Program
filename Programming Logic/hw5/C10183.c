# include <stdio.h> 
# include <stdlib.h>

int main()
{
	int M = 1234, N, count = 0, correct = 0;
	
	while(count <= 5 && correct == 0)
	{
//		printf("�п�J�@�K�X�G");
//		scanf("%d", &M);
		
		printf("�п�J�@��ơG");
		scanf("%d", &N);
		printf("===============\n");
		
		if(M == N)
		{
			printf("�K�X���T");
			correct = 1;
		}
		else if (count <= 3)
		{
			count = count + 1;
			printf("�K�X���~\n");
			printf("===============\n");
		}
		else if (count > 3 && count < 5)
		{
			count = count + 1;
			printf("�K�X���~\n");
			sleep(5);
			printf("===============\n"); 
		}
		else
		{
			count = count + 1;
			printf("���~���ƹL�h");
		}
	}
	
	
	
	return 0;
}
