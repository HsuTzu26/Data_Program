#include <stdio.h>

int main()
{
 int a[10] = { 5,61 };
 int i = 0,n=0,k=0;
 char get;
 
 for (i = 0; i < 10; i++)
  printf("%3d",a[i]);
 printf("\n");
 printf("請輸入需要進行的操作（插入‘I',刪除‘D'）\n");
 
 get = getchar();
 getchar();
 
 if (get=='D')
 {
  printf("請輸入要刪除的整數：\n");
  n = getchar(); 
  getchar();
  n -= 48;
  for (i = 0; i < 10; i++)
  {
  if (a[i]==n)
  {
   for (; i < 10; i++)
   {
    a[i] = a[i + 1];
   }
   a[9] = 0;
   break;
  }
  }
 for (i = 0; i < 9; i++)
  printf("%3d",a[i]);
 printf("\n");
 }
 
 printf("請輸入需要進行的操作（插入‘I',刪除‘D'）\n");
 get = getchar();
 getchar();
 
 if (get='I')
 {
 printf("請輸入要插入的整數：\n");
 scanf_s("%d",&n);         //注意陷阱，不能用getchar(),因為13其實是兩個字元，回車之後，n只吸收了‘1'，所以只能用scanf_s().
 for (i = 0; i < 10; i++)
 {
  if (a[i] < n&&n < a[i + 1])
  {
  k = i;
  for (i = 8; i > k; i--)
  {
   a[i+1] = a[i];
  }
  a[k+1] = n;
  break;
  }
 }
 for (i = 0; i < 10; i++)
  printf("%3d",a[i]);
 }
 return 0;
} 
