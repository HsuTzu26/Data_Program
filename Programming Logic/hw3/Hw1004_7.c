#include <stdio.h>
#include <stdlib.h>

int main()
{
	int numTF = 0;
	printf("�п�J�@���G(�O�D�D)�G");
	scanf("%d", &numTF);
	printf("==========================\n");
	
	if(numTF == 1)
	{
		printf("���G��True");
	}
	else if(numTF == 0)
	{
		printf("���G��False");
	}
	else
	{
		printf("Error");
	}
	
	printf("\n");
	
	int numOne = 0;
	printf("�п�J�@���G(����D)�G");
	scanf("%d", &numOne);
	printf("==========================\n");
	printf("���G��%d", numOne);
	printf("\n");
	
	int numMult = 1011;
	int i = 0;
	char arr[50]={0};
	printf("�п�J�@���G(�ƿ��D)�G");
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
