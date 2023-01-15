#include <stdio.h>
int main()
{
	FILE * fp;
	char ch;
	char pu='s';
	int count;
	fp=fopen("file.txt","a+");
	rewind(fp);
	count = fread(&ch,sizeof(char),1,fp);
	if(count == 0)
	{
		printf("file is empty");
		fputc(pu,fp);	
	}
	else if(count > 0)
	{
		printf("¤j¤j¤j");	
	}
	fclose(fp);
	return 0;
}
