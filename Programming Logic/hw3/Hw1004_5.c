#include <stdio.h>
#include <stdlib.h>
#include <time.h> 

int main()
{
	srand(time(NULL));
	
	int randnum = rand()%100 + 1; //��1~100 �������üƭ� 
	int lotterynum;
	printf("�вq�@�ֳz���X: ");
	scanf("%d", &lotterynum);
	printf("==========================\n");
	
	if(lotterynum == randnum)
	{
		printf("���ߡI�A�q��F�C");
	}
	else
	{
		printf("�^�t�I�ֳz���X��%d",randnum);
	}
	
}
