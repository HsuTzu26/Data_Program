# include <stdio.h> 
# include <stdlib.h>

int main()
{
	int i, num = 0, p = 1;
	
	printf("�п�J�@��ơG");
	scanf("%d", &num);
	printf("===============\n");
	
	if(num > 0)
	{
		for(i=1; i <= num; i++)
		{
			p = p * i;	
		}
	
		printf("%d! = %d", num, p);
	}
	else
	{
		printf("Error");
	}
	
	return 0;
}
