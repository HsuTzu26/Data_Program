#include <stdio.h>
#include <stdbool.h>

int main()
{
//	int num, i;
//	
//	while(num!=0)
//	{
//		printf("請輸入一整數：");
//		scanf("%d", &num);
//		printf("===============\n");
//		
//		if(num==2) printf("%d為質數\n", num);
//		
//		for(i=2;i<num;i++)
//		{
//			if(num%i==0)
//			{
//				printf("%d非質數\n", num);
//				break;
//			}
//			else
//			{
//				printf("%d為質數\n", num);
//				break;
//			}
//		}
//	}
	
	
	int n=1;
//    bool isPrime=true;
    
    
    while(n!=0)
    {
    	printf("enter num: ");
   		scanf("%d", &n);
        if(n==1 || n==3)
	    {
	    	printf("not a prime\n");
		}
		if(n==2) printf("It's a prime\n"); 
		
		int i=2;
		for(; i*i<=n; i++)
		{
			
			if(n%i==0)
			{
				printf("not a prime\n");
				break;
			}
			else
			{
				printf("It's a prime\n");
				break;
			}
		}
		
//		if(isPrime)
//		{
//			printf("It's a prime");
//			break;
//		}		
//		else
//		{
//			printf("not a prime\n");
//			break;
//		}
				
	}
	
	
	return 0;
}
