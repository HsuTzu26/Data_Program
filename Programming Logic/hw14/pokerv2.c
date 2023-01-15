//Poker v2
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
//void Count(num)
//{
//	char c;
//	if(num==1)
//	{
//		c='A';
//		printf("%c	",c);
//	}else if(num==11)
//	{
//		c='J';
//		printf("%c	",c);
//	}else if(num==12)
//	{
//		c='Q';
//		printf("%c	",c);
//	}else if(num==13)
//	{
//		c='K';
//		printf("%c	",c);
//	}else
//	{
//		printf("%d	", num);
//	}
//	
//}

void swap(int *a, int *b) 
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void sort(int *arr, int n) 
{
	int i,j;
    for (i = 0; i < n; i++) {
        for (j = i + 1; j < n; ++j) {
            if (arr[i] > arr[j]) {
                swap(&arr[i], &arr[j]);
            }
        }
    }
}

int main() 
{
	int poker[52], piles[4][13],i,j;
	const char *flower_table[] = {"S","H","D","C"}; //¶Â®ç(S spade), ¬õ¤ß(H hear), µÙ§Î(D diamond), ±öªá(C club) 
	const char *number_table[] = {"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"};
	srand(time(NULL));
	
	for (i = 0; i < 52; i++)
	{
		poker[i] = i + 1;
	}
	
	for (i = 0; i < 52; i++) //shuffle 
	{
		swap(&poker[i], &poker[rand()%52]);
	}
	
	for (i = 0; i < 52; i++) 
	{
        piles[i % 4][i / 4] = poker[i];
    }
    

    for (i = 0; i < 4; i++) {
        sort(piles[i], 13);

        for (j = 0; j < 13; j++) {
            if (j > 0) printf(" ");
            strcpy(poker, flower_table[piles[i][j] / 13]); //put flowers into poker
            strcat(poker, number_table[piles[i][j] % 13]); //concatenate number with poker
            printf("%s", poker);
        }

        printf("\n");
    }
	
	return 0; 
	
}
