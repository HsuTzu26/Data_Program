#include <stdio.h>
#include <stdlib.h> 
#include <time.h>

int main()
{
	int num[5], i, max=1, min=9999999, sum=0;
	double avg=0;
	srand(time(NULL));
	
	for(i=0;i<5;i++)
	{
//		printf("輸入第%d個數：", i+1);
//		scanf("%d", &num[i]);
		num[i]=rand()%100+1;
		sum+=num[i];
		printf("第%d個數：%d\n", i+1, num[i]);
	}	
	for(i=0;i<5;i++)
	{
		if(num[i]>max)
		{
			max=num[i];
		} 
		else if(num[i]<min)
		{
			min=num[i];
		}
	}
	avg = sum/5.0;
	printf("max=%d\nmin=%d\nsum=%d\navg=%.2f", max, min, sum, avg);
	
	
	
}
