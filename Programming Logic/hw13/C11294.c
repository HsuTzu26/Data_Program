#include <stdio.h> 

int main()
{
	char A[5][256]; //LargeStr
	char B[64]; //SmallStr
	int i=0;
	
	printf("Enter LargeStr�G");
	scanf("%s", &A);
	printf("Enter SmallStr�G");
	scanf("%s", &B);
	
	if(strstr(A, B))
	{
		printf("���@���@\n");
		for(i; i<strlen(B); i++)
		{
			printf("%c", B[i]);
		}
			
	}
	else
	{
		printf("�S��");
	}
}
