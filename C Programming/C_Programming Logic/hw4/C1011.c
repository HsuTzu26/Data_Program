# include <stdio.h>
# include <stdlib.h>

int main()
{
	int price = 0;
	printf("�Ȥ��ʪ����B(��): ");
	scanf("%d", &price);
	
	printf("========================\n");
	
	if (price >= 100000)
	{
		printf("�馩��20%%\n");
		price = price*(1-0.2);
		printf("��I��%d��", price);
	}
	else if (price >= 30000)
	{
		printf("�馩��15%%\n");
		price = price*(1-0.15);
		printf("��I��%d��", price);
	}
	else if (price >= 5000)
	{
		printf("�馩��10%%\n");
		price = price*(1-0.1);
		printf("��I��%d��", price);
	}
	else if (price >= 1000)
	{
		printf("�馩��5%%\n");
		price = price*(1-0.05);
		printf("��I��%d��", price);
	} 
	else 
	{
		printf("�馩��0%%\n");
		printf("��I��%d��", price);
	}
	
	return 0;
}
