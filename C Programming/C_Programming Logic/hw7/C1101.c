#include <stdio.h>

int main()
{
	int num, i;

	printf("�п�J�@��ơG");
	scanf("%d", &num);
	printf("===============\n");
	
	printf("%d���Ҧ����]��: ",num);
	for(i=1;i<=num;i++)
	{
		if(num%i==0)
		{
			printf("%d ",i);
		}	
	}
	
	
	return 0;
}
