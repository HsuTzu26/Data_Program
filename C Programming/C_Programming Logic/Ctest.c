#include <stdio.h>

int main()
{
	char ch;
	ch = getchar();
	printf("Input Char Is :%c",ch);
	//��@�r���C���UEnter��~�B�z 
	
	char ch;
	ch = getch();
	printf("Input Char Is :%c",ch);
	//��@�r���C���U�Y�B�z,�r�����|��ܥX�� 
	
	char ch;
	ch = getche();
	printf("Input Char Is :%c",ch);
	//��@�r���C���U�Y�B�z,�r���|��ܥX�� 
	
	char str[128];
	gets(str);
	// �H�U���P printf("Input String Is: %s", str);
	puts("Input String Is:");
	puts(str);
	//��@�r��C(�i�]�t�Ů�) 
	
	return 0;
}
