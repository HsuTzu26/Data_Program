#include <stdio.h>
#include <stdlib.h>
int main()
{ 
//	short int no1=200; /* 宣告為短整數 */ 
//	int no2=200;
//	long int no3=200; 
//	printf("%d%佔有%d位元組\n",no1,sizeof(no1)); /* 以10進位輸出 */ 
//	printf("%d%佔有%d位元組\n",no2,sizeof(no2)); /* 以10進位輸出 */
//	printf("%d%佔有%d位元組\n",no3,sizeof(no3)); /* 以10進位輸出 */ 
	
//	int Num=100; /* 以10進位設定整數變數 */
//	int OctNum=0200; /* 以8進位設定短整數變數 */
//	int HexNum=0x33f; /* 以16進位設定整數變數 */ 
//	printf("Num=%d\n",Num); /* 以10進位輸出 */ 
//	printf("OctNum=%d\n",OctNum); /* 以8進位輸出 */
//	printf("HexNum=%d\n",HexNum); /* 以16進位輸出 */

//	char ch1='\'';/* ch1設值為' */ 
//	printf("\"I%cm a good boy.\"\n",ch1);
//	/* 利用printf()函數輸出單引號與雙引號*/ 
	
//	printf( "short int的資料長度＝%d位元組\n",sizeof(short int)); /*取得short int型態
//	大小*/ 
//	printf( "long int 的資料長度＝%d位元組\n",sizeof(long int)); /*取得long int型態大
//	小*/
//	printf( "long long int 的資料長度＝%d位元組\n",sizeof(long long int)); /*取得long 
//	long int型態大小*/
//	printf( "char的資料長度＝%d位元組\n",sizeof(char)); /*取得char型態大小*/
//	printf( "float的資料長度＝%d位元組\n",sizeof(float)); /*取得float型態大小 */
//	printf( "double的資料長度＝%d位元組\n",sizeof(double)); /*取得double型態大
//	小*/ 

//	int x; 
//	x=765/17*2*210;
//	printf("共需花費:%d 元\n",x);

//	/*宣告變數*/
//	float c, f;
//	//輸入攝氏溫度
//	printf("請輸入攝氏溫度：");
//	scanf("%f",&c);
//	f=(9*c)/5+32; /* 華氏溫度轉換公式 */ 
//	printf("攝氏%.1f度 = 華氏%.1f度\n",c,f); 
	
//	int num, MAX= 0, input, i;
//	printf("準備輸入數字的個數：");
//	scanf("%d", &num);
//	for(i = 0; i < num; i++)
//	{
//		printf(">");
//		scanf("%d", &input);
//		if(MAX<input)
//		MAX=input;
//	} /* 利用for迴圈來輸入與尋找最大值 */ 
//	printf("這些數字中的最大值為：%d\n",MAX);

	int i, sum=0;
	for(i=1; i<=200; i=i+2)
	{
		if(i==101)
			break;
		sum+=i;
	}
	printf("1~99的奇數總和：%d\n", sum);

	return 0;
}

