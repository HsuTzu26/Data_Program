#include<stdio.h>

int main()
{
	int score[3][5];
	char sub[3][8] = {"���", "�^��", "�ƾ�"};
	int i, j, k, total=0, temp;
	
	for(i=0;i<3;i++)
	{
		total=0;
		score[i][0]=i+1;
		for(j=1;j<4;j++)
		{
			printf("�п�J��%d��P�Ǫ�%s���Z�G",i+1,sub[j-1]);
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
		printf("%d.��%d��P�ǡG%s%d���A%s%d���A%s%d���A�`��%d���A����%.2f��\n",i+1,score[i][0],sub[0],score[i][1],sub[1],score[i][2],sub[2],score[i][3],score[i][4],score[i][4]/3.0);	
	}
	
	
	
	
	
	return 0;
}
