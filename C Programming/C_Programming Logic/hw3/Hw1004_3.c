#include <stdio.h>
#include <stdlib.h>

int main()
{
	int value = 0, bool = 0;
	printf("�п�J�p�⪺�ƭȡG");
	scanf("%d",&value);
	printf("�п�J1(�p�⥭���)��2(�p��ߤ��):");
	scanf("%d",&bool);
	printf("==========================\n");
	
	if(bool == 1)
	{
		printf("����Ȭ��G%d", value*value);
	} 
	else if(bool == 2)
	{
		printf("�ߤ�Ȭ��G%d", value*value*value);
	} 
	else 
	{
		printf("Error!");
	}
	
	
	
	return 0;
}
