#include<stdio.h>

int main()
{
	int score[3][3];
	char sub[3][8] = {"國文", "英文", "數學"};
	int i, j, n;
	
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		{
			printf("請輸入第%d位同學的%s成績：",i+1,sub[j]);
			scanf("%d",&score[i][j]);
		}
	}
	
	printf("============================\n");
	printf("請輸入欲判斷的值：");
	scanf("%d",&n);
	printf("============================\n");
	
	printf("第%d位同學的成績為：%s%d分，%s%d分，%s%d分",n,sub[0],score[n-1][0],sub[1],score[n-1][1],sub[2],score[n-1][2]);
	
	
	
	return 0;
}
