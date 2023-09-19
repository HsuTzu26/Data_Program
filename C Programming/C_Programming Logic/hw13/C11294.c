#include <stdio.h> 

int main()
{
	char A[5][256]; //LargeStr
	char B[64]; //SmallStr
	int i=0;
	
	printf("Enter LargeStr：");
	scanf("%s", &A);
	printf("Enter SmallStr：");
	scanf("%s", &B);
	
	if(strstr(A, B))
	{
		printf("有哦有哦\n");
		for(i; i<strlen(B); i++)
		{
			printf("%c", B[i]);
		}
			
	}
	else
	{
		printf("沒料");
	}
}
