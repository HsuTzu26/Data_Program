#include <stdio.h> 
int main()
{
	int WrongQ=3, Score=100;
	float Question = 2.5;
	char Level = 'A';
	char Name[16] = "�}��a";
	
	int newInt_Score = Score - WrongQ * Question;
	float newF_Score = Score - WrongQ * Question;
	//printf("���Z(���)�G%d\n", newInt_Score);
	//printf("���Z(�B�I��)�G%0.1f\n", newF_Score);
	
	
	printf("�ǥͩm�W�G%s\n", Name);
	printf("���Z(���)�G%d\n", (int)(Score - WrongQ * Question));
	printf("���Z(�B�I��)�G%0.1f\n", (float)(Score - WrongQ * Question));
	printf("���šG%c", Level);
	
} 
