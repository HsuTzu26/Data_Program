#include <stdio.h>
#include <stdlib.h>

int main()
{
	int num = 0;
	printf("�п�J�@����ơG");
	scanf("%d", &num);
	printf("==========================\n");
	
	if( (num%2)==0 || (num%3)==0)
	{
		printf("���Ƭ�2��3������");
	} 
	else
	{
		printf("���ƫD��2��3������");
	}
	
	return 0;
}
