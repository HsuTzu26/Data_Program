#include <stdio.h>
#include <stdlib.h>
#include <time.h>
FILE *fp;    

int main() 
{
    int num, ans, judge=0, count=0,fcount, Flag;
    char Name[256], fName[80];
    char ch;
    srand(time(NULL));
    
    fp = fopen("file.txt", "r");
    
    ans = rand() % 100 + 1;
    printf("Ans:%d\n", ans);
    
    while(judge==0)
    {
        printf("請輸入一整數(1~100)：");
        scanf("%d", &num);
        printf("=====================\n");
        
        if(num == ans)
        {
            printf("Bingo！");
            judge=1;
            count++;
            break;
        }
        else if(num < ans)
        {
            printf("太小囉！\n");
            judge=0;
            count++;
        }
        else if(num > ans)
        {
            printf("太大囉！\n");
            judge=0;
            count++;
        }
    }
    
    printf("(您猜了%d次)\n", count);
    
	
    rewind(fp);
	Flag = fread(&ch,sizeof(ch),1,fp); //Flag-判斷是否為空 
    
    fscanf(fp, "%s %d", fName, &fcount);
    	
	if(Flag==0 || count < fcount)
	{
		fp = fopen("file.txt", "w");
		printf("您為最高分，請輸入您的姓名：");
    	scanf("%s", &Name);
    	fprintf(fp,"%s %d", Name, count);
	}
	else if(Flag > 0 && count > fcount)
	{
		printf("最高分：%c%s %d次", ch, fName, fcount);
	}
	else if(count==fcount) printf("與%c%s同分", ch,fName);

    
    fclose(fp);
    
    return 0;
}
