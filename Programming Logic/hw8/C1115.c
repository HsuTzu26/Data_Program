#include<stdio.h>

int main()
{
	int A[100], B, judge=1, i=0, j;
	
	while(judge!=0)
	{
		printf("�п�J��%d�Ӿ�ơG",i+1);
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
	printf("�п�J���P�_���ȡG");
	scanf("%d",&B);
	printf("============================\n");
	
	for(j=0;j<=i;j++)
	{
		if(A[j]==B)
		{
			printf("%d����J����%d�Ӿ��",B,j+1);
			judge=1;
			break;
		}
	}
	if(judge=0)
	{
		printf("%d���b����J���Ȥ�",B);
	}
	
	return 0;
}
