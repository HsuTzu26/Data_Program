#include <stdio.h>

int main()
{
 int a[10] = { 5,61 };
 int i = 0,n=0,k=0;
 char get;
 
 for (i = 0; i < 10; i++)
  printf("%3d",a[i]);
 printf("\n");
 printf("�п�J�ݭn�i�檺�ާ@�]���J��I',�R����D'�^\n");
 
 get = getchar();
 getchar();
 
 if (get=='D')
 {
  printf("�п�J�n�R������ơG\n");
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
 
 printf("�п�J�ݭn�i�檺�ާ@�]���J��I',�R����D'�^\n");
 get = getchar();
 getchar();
 
 if (get='I')
 {
 printf("�п�J�n���J����ơG\n");
 scanf_s("%d",&n);         //�`�N�����A�����getchar(),�]��13���O��Ӧr���A�^������An�u�l���F��1'�A�ҥH�u���scanf_s().
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
