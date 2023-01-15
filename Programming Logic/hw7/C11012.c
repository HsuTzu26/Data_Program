#include <stdio.h>

int main()
{
	int num=1, count=0;
	int max=0, min=55555555, temp, temp1;
	int sum=0;
	float avg=0;

	while(num!=0)
	{
		count++;
		
		printf("叫块俱计");
		scanf("%d", &num);
		printf("===============\n");
		
		if(num==0)
		{
			printf("End");
			break; 
		}
		
		if(count==1)
		{
			max=num;
			min=num;
		}
		
//		if(num<min)
//		{
//			min=num;
//		}
//		
//		if(num>max)
//		{
//			max=num;
//		}
//		
//		printf("程: %d\n",max);
//		printf("程: %d\n",min);
		
		if(num>max)
		{
			max=num;
			temp=max;
			printf("程: %d\n",temp);
			
			temp1=min;
			printf("程: %d\n",temp1);
		}
		else if(num<min)
		{
			temp=max;
			printf("程: %d\n",temp);
			
			min=num;
			temp1=min;
			printf("程: %d\n",temp1);
			
			
		}
		else
		{
			printf("程: %d\n",max);
			printf("程: %d\n",min);
		}
		
		sum=sum+num;
		avg=(float)sum/count;
		printf("キА: %.2f\n",avg);
	}
	

	return 0;
}
