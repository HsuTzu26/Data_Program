# include <stdio.h>
# include <stdlib.h>

int main()
{
	char cc;
	
	printf("�п�J���Ƹs��: ");
	scanf("%c", &cc);
	
	printf("========================\n");
	
	if (cc == 'A')
	{
		printf("���Ʀb90���H�W");
	}
	else if (cc == 'B')
	{
		printf("���Ʀb80~89������");
	}
	else if (cc == 'C')
	{
		printf("���Ʀb70~79������");
	}
	else if (cc == 'D')
	{
		printf("���Ʀb60~69������");
	}
	else if (cc == 'E')
	{
		printf("�A�Q���F");
	}
	else
	{
		printf("�S�������Ƹs��");
	}
	
	return 0;
}
