#include<stdio.h>

int main()
{
	int A[100], B, judge=1, i=0, j;
	
	while(judge!=0)
	{
		printf("請輸入第%d個整數：",i+1);
		scanf("%d",&A[i]);	
		if(A[i]==-1)
		{
			judge=0;
		}
		else
		{
			i++;
		}
	}
	
	printf("============================\n");
	printf("請輸入欲判斷的值：");
	scanf("%d",&B);
	printf("============================\n");
	
	for(j=0;j<=i;j++)
	{
		if(A[j]==B)
		{
			printf("%d為輸入的第%d個整數",B,j+1);
			judge=1;
			break;
		}
	}
	if(judge=0)
	{
		printf("%d不在剛剛輸入的值中",B);
	}
	
	return 0;
}
