#include <stdio.h> 
int main()
{
	int WrongQ=3, Score=100;
	float Question = 2.5;
	char Level = 'A';
	char Name[16] = "畗戈癮";
	
	int newInt_Score = Score - WrongQ * Question;
	float newF_Score = Score - WrongQ * Question;
	//printf("Θ罿(俱计)%d\n", newInt_Score);
	//printf("Θ罿(疊翴计)%0.1f\n", newF_Score);
	
	
	printf("厩ネ﹎%s\n", Name);
	printf("Θ罿(俱计)%d\n", (int)(Score - WrongQ * Question));
	printf("Θ罿(疊翴计)%0.1f\n", (float)(Score - WrongQ * Question));
	printf("单%c", Level);
	
} 
