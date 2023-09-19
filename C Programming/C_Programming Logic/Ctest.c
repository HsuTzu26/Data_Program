#include <stdio.h>

int main()
{
	char ch;
	ch = getchar();
	printf("Input Char Is :%c",ch);
	//抓一字元。按下Enter後才處理 
	
	char ch;
	ch = getch();
	printf("Input Char Is :%c",ch);
	//抓一字元。按下即處理,字元不會顯示出來 
	
	char ch;
	ch = getche();
	printf("Input Char Is :%c",ch);
	//抓一字元。按下即處理,字元會顯示出來 
	
	char str[128];
	gets(str);
	// 以下等同 printf("Input String Is: %s", str);
	puts("Input String Is:");
	puts(str);
	//抓一字串。(可包含空格) 
	
	return 0;
}
