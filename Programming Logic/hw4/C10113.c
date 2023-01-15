# include <stdio.h>
# include <stdlib.h>

int main()
{
	char cc;
	
	printf("請輸入分數群組: ");
	scanf("%c", &cc);
	
	printf("========================\n");
	
	if (cc == 'A')
	{
		printf("分數在90分以上");
	}
	else if (cc == 'B')
	{
		printf("分數在80~89分之間");
	}
	else if (cc == 'C')
	{
		printf("分數在70~79分之間");
	}
	else if (cc == 'D')
	{
		printf("分數在60~69分之間");
	}
	else if (cc == 'E')
	{
		printf("你被當掉了");
	}
	else
	{
		printf("沒有此分數群組");
	}
	
	return 0;
}
