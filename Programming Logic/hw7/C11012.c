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
		
		printf("�п�J�@��ơG");
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
//		printf("�̤j��: %d\n",max);
//		printf("�̤p��: %d\n",min);
		
		if(num>max)
		{
			max=num;
			temp=max;
			printf("�̤j��: %d\n",temp);
			
			temp1=min;
			printf("�̤p��: %d\n",temp1);
		}
		else if(num<min)
		{
			temp=max;
			printf("�̤j��: %d\n",temp);
			
			min=num;
			temp1=min;
			printf("�̤p��: %d\n",temp1);
			
			
		}
		else
		{
			printf("�̤j��: %d\n",max);
			printf("�̤p��: %d\n",min);
		}
		
		sum=sum+num;
		avg=(float)sum/count;
		printf("������: %.2f\n",avg);
	}
	

	return 0;
}
