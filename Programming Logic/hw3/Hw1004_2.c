#include <stdio.h>
#include <stdlib.h>

int main()
{
	int price = 0, tickets = 0;
	int total = 0;
	
	printf("�C�i�J����������(��): ");
	scanf("%d", &price);
	printf("�п�J�U�ȱ��ʶR���i��:");
	scanf("%d", &tickets);
	printf("==========================\n");
	total = price * tickets * 0.9;
	
	if(tickets >= 10)
	{
		printf("�ʶR10�i�H�W���E��\n");
		printf("�`����%d��", total);

	} 
	else 
	{
		printf("�`����%d��", price*tickets);
	}
	
	
	return 0;
}
