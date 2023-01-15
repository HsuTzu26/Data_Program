# include <stdio.h>
int main(void)
{
  int a[23] = {1,5,66,8,55,9,1,32,65,4,15,64,156,1564,7,215};
  int b[24]; //用來存放插入數字後的新陣列,因為又插入了一個值,所以長度為24
  int Index; //插入值的下標,Index是“下標”的英文單詞
  int num; //插入的值
  int i; //迴圈變數
  printf("請輸入插入值的下標：");
  scanf("%d",&Index);
  printf("請輸入插入的數值：");
  scanf("%d",&num);
  for (i=0; i<24; ++i)
  {
    if (i < Index)
    {
      b[i] = a[i]; /*迴圈變數i小於插入值位置Index時,每一個元素所放的位置不變*/
    }
    else if (i == Index)
    {  
      b[i] = num; //i等於Index時,將插入值賦給陣列b
    }
    else
    {
      b[i] = a[i-1]; /*因為插入了一個新的元素,所以插入位置後的每一個元素所存放的位置都要向後移一位*/
    }
  }
  for (i=0; i<24; ++i)
  {
    printf("%d\x20",b[i]);
  }
  printf("\n");
  
  int a[23] = {1,215};
  int b[22]; /*用來存放刪除數字後的新陣列,因為刪除了一個值,所以長度為22*/
  int Index; //要刪除的值的下標
  int i; //迴圈變數
  printf("請輸入要刪除的值的下標：");
  scanf("%d",&Index);
  for (i=0; i<23; ++i)
  {
    if (i < Index)
    {
      b[i] = a[i]; /*迴圈變數i小於插入值位置Index時,每一個元素所存放的位置不變*/
    }
    else
    {
      b[i] = a[i+1]; /*刪除值後面的元素都往前移一位,要刪除的值直接被覆蓋*/
    }
  }
  for (i=0; i<22; ++i)
  {
    printf("%d\x20",b[i]); // \x20表示空格
  }
  printf("\n");
  return 0;
  
}
