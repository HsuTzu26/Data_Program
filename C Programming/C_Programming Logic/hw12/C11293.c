#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main()
{
	int dice[4],rd,i,j,temp;
	char select = 'r';
	srand(time(NULL));
	while(select == 'R' || select == 'r')
	{
		printf("��l�I�Ƭ� : ");
		for(i=0;i<4;i++) 
		{
			//srand(time(NULL));
			rd = rand() % 6 + 1 ;
			dice[i] = rd;
			printf("%d  ",dice[i]); 
		}
		printf("\n");
		printf("===============\n");
		for (i = 0; i < 4; ++i) {
	    		for (j = 0; j < i; ++j) {
	      			if (dice[j] > dice[i]) {
				        temp = dice[j];
				        dice[j] = dice[i];
				        dice[i] = temp;
	      			}
	    		}
	  		}
	  	printf("%d %d %d %d \n", dice[0],dice[1],dice[2],dice[3]);	
	  	
		if(dice[0] == dice[1] && dice[2] == dice[3] && dice[1]!= dice[2])
		{
			printf("���G�� �~�޻�!\n",dice[1]);
		}else if(dice[0] == 1 && dice[1] == 2 && dice[2] == dice[3] && dice[1]!= dice[2])		
		{
			printf("���G�� BG(3�I)\n");
		}else if(dice[2] == 5 && dice[3] == 6 && dice[1] == dice[2] && dice[1]!= dice[2])
		{	
			printf("���G�� 11 �I \n");		
		}
		else if(dice[0]== dice[1] && dice[1]!= dice[2] && dice[2]!= dice[3])
		{
			printf("���G�� %d �I",dice[2]+dice[3]);
		}
		else if(dice[1] == dice[2] && dice[0]!= dice[1] && dice[0]!= dice[3] && dice[1]!=dice[3])
		{
			printf("���G�� %d �I",dice[0]+dice[3]);
		}else if(dice[2] == dice[3] && dice[0]!= dice[1] && dice[1]!= dice[2] && dice[0]!=dice[3])
		{
			printf("���G�� %d �I",dice[0]+dice[1]);
		}
		else if(dice[0] == dice[1] && dice[1] == dice[2] && dice[2] == dice[3])
		{
			printf("���G�� �@�� (%d-%d-%d-%d) \n",dice[0],dice[1],dice[2],dice[3]); 	
		}
		else if(dice[0] != dice[1] && dice[0] != dice[2] && dice[0]!= dice[3] && dice[1] != dice[2]  && dice[1] != dice[3] && dice[2] != dice[3])
		{
			printf("���G�� ���� \n");	
		}else
		{
			printf("���G�� ���� \n");
		} 
		printf("\n");
		printf(" ����r���Ρ�R���i���Y�A����q���Ρ�Q������");
        printf("\n");
        select = getch();
		if(select == 'Q' || select == 'q')
		{
			printf("����!");
			break;
		}
		
	}
}
