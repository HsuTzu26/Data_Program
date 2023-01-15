#include <stdio.h>

int main()
{
	char Name[5][64], Phone[5][64], correct='Y';
	int count=0, i=0;
	
	while(correct=='Y'&& count<5)
	{
		printf("請輸入姓名：");
		scanf("%s", &Name[count]);
		printf("請輸入電話：");
		scanf("%s", &Phone[count]);
		
		if(count<5)
        {
            for(i=0;i<=count;i++)
            {
                printf("%s ",Name[i]);
                printf("%s\n",Phone[i]);
            }
        }
        
		printf("================\n"); 
		printf("是否繼續輸入(Y/N)？");
		scanf(" %c", &correct);
		if(correct=='Y')
        {
            count++;
        }
	}	
	
	while(correct=='Y' && count>=5)
    {
        for(i=0;i<=3;i++)
        {
        
	        strcpy(Name[i],Name[i+1]);
	        strcpy(Phone[i],Phone[i+1]);
		}  
		
        printf("請輸入姓名:");
        scanf("%s",&Name[4]);
        printf("請輸入電話:");
        scanf("%s",&Phone[4]);
        for(i=0;i<5;i++)
            {
            	printf("%s ",Name[i]);
                printf("%s\n",Phone[i]);
            }
        printf("====================\n");
        printf("是否繼續輸入(Y/N)？");
        scanf(" %c",&correct);
    }
	return 0;
}
