# include <stdio.h>
# include <stdlib.h>

int main()
{
	int weight, height = 0;
	float h, BMI = 0;
	
	printf("�п�J�魫(Kg): ");
	scanf("%d", &weight);
	printf("�M��J����(Cm): ");
	scanf("%d", &height);
	
	h = (float)height / 100;
	
	BMI = (float)weight / (h*h);
	
	printf("========================\n");
	
	if (BMI >= 23)
	{
		printf("BMI=%.2f  (�魫�L��)", BMI);
	}
	else if (BMI < 18.5)
	{
		printf("BMI=%.2f  (�魫�L��)", BMI);
	}
	else
	{
		printf("BMI=%.2f  (���`���)", BMI);
	}
	
	return 0;
}
