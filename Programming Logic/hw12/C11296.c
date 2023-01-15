//Poker
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
void Count(num)
{
	char c;
	if(num==1)
	{
		c='A';
		printf("%c	",c);
	}else if(num==11)
	{
		c='J';
		printf("%c	",c);
	}else if(num==12)
	{
		c='Q';
		printf("%c	",c);
	}else if(num==13)
	{
		c='K';
		printf("%c	",c);
	}else
	{
		printf("%d	", num);
	}
	
}

int main() 
{
	int poker[52],i,j,temp,card,num;
	system("chcp 437");
	//char flower[4] = { '\5','\4','\3','\6' };
	srand(time(NULL));
	for (i = 0; i < 52; i++)
	{
		poker[i] = i + 1;
	}
	for (i = 0; i < 52; i++)
	{
		card = rand() % 52;
		temp = poker[card];
		poker[card] = poker[i];
		poker[i] = temp;
	}
	for (j = 0; j < 4; j++)
	{
		for (i = j*13; i < j*13+13; i++)
		{
			if (poker[i] > 0 && poker[i] <= 13)
			{
				printf("%c ", 6);
				//printf("A");
				num=poker[i];
				Count(num);
				//printf("%d	", poker[i]);
			}
			else if (poker[i] > 13 && poker[i] <= 26)
			{
				printf("%c ", 3);
				//printf("B");
				//printf("%d	", poker[i]-13);
				num=poker[i]-13;
				Count(num);
			}
			else if (poker[i] > 26 && poker[i] <= 39)
			{
				printf("%c ", 4);
				//printf("C");
				//printf("%d	", poker[i] - 26);
				num=poker[i] - 26;
				Count(num);
			}
			else
			{
				printf("%c ", 5);
				//printf("D");
				//printf("%d	", poker[i] - 39);
				num=poker[i] - 39;
				Count(num);
			}
		}
		printf("\n");
	}
}
