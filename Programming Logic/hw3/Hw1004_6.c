#include <stdio.h>
#include <stdlib.h>

int main()
{
	float area = 0;
	float top, bottom, h;
	printf("�п�J��Ϊ��W��: ");
	scanf("%f", &top);
	printf("�п�J��Ϊ��U��: ");
	scanf("%f", &bottom);
	printf("�п�J��Ϊ���: ");
	scanf("%f", &h);
	
	area  = (top+bottom) * h / 2;
	printf("==========================\n");
	printf("��έ��n=%.2f",area);
	
	return 0;
}
