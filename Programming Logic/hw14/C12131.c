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
        printf("�п�J�@���(1~100)�G");
        scanf("%d", &num);
        printf("=====================\n");
        
        if(num == ans)
        {
            printf("Bingo�I");
            judge=1;
            count++;
            break;
        }
        else if(num < ans)
        {
            printf("�Ӥp�o�I\n");
            judge=0;
            count++;
        }
        else if(num > ans)
        {
            printf("�Ӥj�o�I\n");
            judge=0;
            count++;
        }
    }
    
    printf("(�z�q�F%d��)\n", count);
    
	
    rewind(fp);
	Flag = fread(&ch,sizeof(ch),1,fp); //Flag-�P�_�O�_���� 
    
    fscanf(fp, "%s %d", fName, &fcount);
    	
	if(Flag==0 || count < fcount)
	{
		fp = fopen("file.txt", "w");
		printf("�z���̰����A�п�J�z���m�W�G");
    	scanf("%s", &Name);
    	fprintf(fp,"%s %d", Name, count);
	}
	else if(Flag > 0 && count > fcount)
	{
		printf("�̰����G%c%s %d��", ch, fName, fcount);
	}
	else if(count==fcount) printf("�P%c%s�P��", ch,fName);

    
    fclose(fp);
    
    return 0;
}
