# include <stdio.h>
# include <stdlib.h>

int main()
{
	int years = 0;
	
	printf("�п�J�褸�~��: ");
	scanf("%d", &years);
	
	printf("===============================\n");
	
	if ((years%4==0)&&(years%100!=0))
	{
		printf("%d�O�|�~", years);		
	}
	else if (years%400 == 0)
	{
		printf("%d�O�|�~", years);
	}
	else
	{
		printf("%d���O�|�~", years);
	}
	
	return 0;
}
