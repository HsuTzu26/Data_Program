#include<stdio.h>

int isPrime(int n)
{
    if(n==1)
        return 0;
    int i=2;
    for(; i*i<=n; i++)
    {
        if(n%i==0)
        {
            return 0;
        }
    }
    return 1;
}

int main()
{
    int n;
    scanf("%d", &n);
    if(isPrime(n))
    {
        printf("It's a prime\n");
    }else{
        printf("It's not a prime\n");
    }
  
    return 0;
}
