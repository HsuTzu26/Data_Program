#include <stdio.h>
#include <stdlib.h>

int main()
{
	printf("�����W�L�@�p��, �C�p�ɦ��O40�� \n");
	
	int hour = 0;
	int fee = 40;
	
	printf("�п�J�����X�p��: ");
	scanf("%d", &hour);
	
	if(hour<=1)
	{
		printf("�������W�L1�p��, �`�O�ά�:0��");
	} 
	else 
	{
		printf("����%d�p��, �`�O�ά�:%d", hour, hour*fee);
	}
	

	return 0;	
} 
