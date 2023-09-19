#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() 
{
	int num[4], i, j, temp;
	char c = 'r';
	srand(time(NULL));
	while(c == 'r' || c == 'R')
	{
		for(i = 0; i < 4; i++)
		{
			num[i] = rand() % 6 + 1;
		}
		printf("骰子點數為：%d %d %d %d\n", num[0], num[1], num[2], num[3]);
		printf("===========================\n");
		
		for(i = 0; i < 4; i++)
		{
			for(j = 0; j < i-1; i++)
			{
				if(num[j] > num[j+1])
				{
					temp = num[j+1];
					num[j+1] = num[j];
					num[j] = temp;
				}
			}
		}
		printf("結果為：");
		
		if(num[0] == num[1] && num[1] == num[2] && num[2] == num[3])
		{
			printf("一色(%d-%d-%d-%d)", num[0], num[1], num[2], num[3]);
		}
		else
		{
			printf("不算");
		}

		
		printf(" 按’r’或’R’可重擲，按’q’或’Q’結束");
        printf("\n");
        c = getch();
	}	
}

