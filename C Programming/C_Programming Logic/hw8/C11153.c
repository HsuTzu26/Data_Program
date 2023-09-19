#include<stdio.h>

int main()
{
	int score[3][5];
	char sub[3][8] = {"國文", "英文", "數學"};
	int i, j, k, total=0, temp;
	
	for(i=0;i<3;i++)
	{
		total=0;
		score[i][0]=i+1;
		for(j=1;j<4;j++)
		{
			printf("請輸入第%d位同學的%s成績：",i+1,sub[j-1]);
			scanf("%d",&score[i][j]);
			total=total+score[i][j];
		}
		score[i][4]=total;
	
	}
	printf("============================\n");
	
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		{
			if(score[j][4]<score[j+1][4])
			{
				for(k=0;k<=4;k++)
				{
					temp=score[j+1][k];
					score[j+1][k]=score[j][k];
					score[j][k]=temp;	
				}
				
			}
		}
	}
	
	for(i=0;i<3;i++)
	{
		printf("%d.第%d位同學：%s%d分，%s%d分，%s%d分，總分%d分，平均%.2f分\n",i+1,score[i][0],sub[0],score[i][1],sub[1],score[i][2],sub[2],score[i][3],score[i][4],score[i][4]/3.0);	
	}
	
	
	
	
	
	return 0;
}
