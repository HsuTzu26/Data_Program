#include <stdio.h>

int main()
{
	int num, i;

	printf("�п�J�@��ơG");
	scanf("%d", &num);
	printf("===============\n");
	
	printf("�ϦV�e: %d\n",num);
	
	printf("�ϦV��: ");
	
	while(num!=0)
	{
		i=i*10+num%10;
		num=num/10;
	}
	printf("%d",i);
	
	return 0;
}
