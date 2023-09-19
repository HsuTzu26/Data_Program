# include <stdio.h>
# include <stdlib.h>

int main()
{
	int weight, height = 0;
	float h, BMI = 0;
	
	printf("請輸入體重(Kg): ");
	scanf("%d", &weight);
	printf("清輸入身高(Cm): ");
	scanf("%d", &height);
	
	h = (float)height / 100;
	
	BMI = (float)weight / (h*h);
	
	printf("========================\n");
	
	if (BMI >= 23)
	{
		printf("BMI=%.2f  (體重過重)", BMI);
	}
	else if (BMI < 18.5)
	{
		printf("BMI=%.2f  (體重過輕)", BMI);
	}
	else
	{
		printf("BMI=%.2f  (正常體位)", BMI);
	}
	
	return 0;
}
