#include <stdio.h>
#include <stdlib.h>

int main()
{
	int numTF = 0;
	printf("請輸入一結果(是非題)：");
	scanf("%d", &numTF);
	printf("==========================\n");
	
	if(numTF == 1)
	{
		printf("結果為True");
	}
	else if(numTF == 0)
	{
		printf("結果為False");
	}
	else
	{
		printf("Error");
	}
	
	printf("\n");
	
	int numOne = 0;
	printf("請輸入一結果(單選題)：");
	scanf("%d", &numOne);
	printf("==========================\n");
	printf("結果為%d", numOne);
	printf("\n");
	
	int numMult = 1011;
	int i = 0;
	char arr[50]={0};
	printf("請輸入一結果(複選題)：");
	scanf("%d", &numMult);
	snprintf(arr, "%d", numMult);
	
	printf("%s",arr);
//	for(i=0; i<=strlen(str); i++)
//	{
//		if(str[i] == 1)
//		{
//			printf("%d", i);	
//		}
//		else (str[i] == 0)
//		{
//			printf("");
//		}
//	}
	
	
	
	
	return 0;	
}
