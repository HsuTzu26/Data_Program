#include<stdio.h>

int main()
{
	int score[3][3];
	char sub[3][8] = {"���", "�^��", "�ƾ�"};
	int i, j, n;
	
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		{
			printf("�п�J��%d��P�Ǫ�%s���Z�G",i+1,sub[j]);
			scanf("%d",&score[i][j]);
		}
	}
	
	printf("============================\n");
	printf("�п�J���P�_���ȡG");
	scanf("%d",&n);
	printf("============================\n");
	
	printf("��%d��P�Ǫ����Z���G%s%d���A%s%d���A%s%d��",n,sub[0],score[n-1][0],sub[1],score[n-1][1],sub[2],score[n-1][2]);
	
	
	
	return 0;
}
