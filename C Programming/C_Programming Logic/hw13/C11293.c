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
		printf("骰子點數為 : ");
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
			printf("結果為 洗拔辣!\n",dice[1]);
		}else if(dice[0] == 1 && dice[1] == 2 && dice[2] == dice[3] && dice[1]!= dice[2])		
		{
			printf("結果為 BG(3點)\n");
		}else if(dice[2] == 5 && dice[3] == 6 && dice[1] == dice[2] && dice[1]!= dice[2])
		{	
			printf("結果為 11 點 \n");		
		}
		else if(dice[0]== dice[1] && dice[1]!= dice[2] && dice[2]!= dice[3])
		{
			printf("結果為 %d 點",dice[2]+dice[3]);
		}
		else if(dice[1] == dice[2] && dice[0]!= dice[1] && dice[0]!= dice[3] && dice[1]!=dice[3])
		{
			printf("結果為 %d 點",dice[0]+dice[3]);
		}else if(dice[2] == dice[3] && dice[0]!= dice[1] && dice[1]!= dice[2] && dice[0]!=dice[3])
		{
			printf("結果為 %d 點",dice[0]+dice[1]);
		}
		else if(dice[0] == dice[1] && dice[1] == dice[2] && dice[2] == dice[3])
		{
			printf("結果為 一色 (%d-%d-%d-%d) \n",dice[0],dice[1],dice[2],dice[3]); 	
		}
		else if(dice[0] != dice[1] && dice[0] != dice[2] && dice[0]!= dice[3] && dice[1] != dice[2]  && dice[1] != dice[3] && dice[2] != dice[3])
		{
			printf("結果為 不算 \n");	
		}else
		{
			printf("結果為 不算 \n");
		} 
		printf("\n");
		printf(" 按’r’或’R’可重擲，按’q’或’Q’結束");
        printf("\n");
        select = getch();
		if(select == 'Q' || select == 'q')
		{
			printf("結束!");
			break;
		}
		
	}
}
