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
		printf("��l�I�Ƭ��G%d %d %d %d\n", num[0], num[1], num[2], num[3]);
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
		printf("���G���G");
		
		if(num[0] == num[1] && num[1] == num[2] && num[2] == num[3])
		{
			printf("�@��(%d-%d-%d-%d)", num[0], num[1], num[2], num[3]);
		}
		else
		{
			printf("����");
		}

		
		printf(" ����r���Ρ�R���i���Y�A����q���Ρ�Q������");
        printf("\n");
        c = getch();
	}	
}

