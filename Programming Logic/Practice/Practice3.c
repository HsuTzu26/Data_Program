#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
/*
 * �\��?���G?���?�u�����h�֥ت��r�Ŧ� 
 * ???���Goriginal_data,	�ݴ�?����l?�u 
 * 			 key,			�ت��r�Ŧ�
 * ��^?�ȡG��?�u���ݴ�?�r�Ŧꪺ?? 
 */
int string_count(char *original_data, char *key)
{
	int count = 0;
	int key_len = strlen (key);
	char *pos_start = original_data, *pos_end = NULL;
 
	while (NULL != 
		   (pos_end = strstr (pos_start, key)))
	{
		pos_start = pos_end + key_len;
		count++;
	}
 
	return count;
}
 
/*
 * �\��?���Greplace�\��
 * ???���Goriginal_data, 	�ݴ�?����l?�u 
 * 			 replaced,			�Q��?���r�Ŧ�
 * 			 to,				��?�����r�Ŧ�
 * ��^?�ȡG���\�A�s�r�Ŧꪺ�a�}
 * 			 ��?�ANULL
 */
char *replace(char *original_data, char *replaced, char *to)
{
	int rep_len = strlen (replaced);
	int to_len = strlen (to);
 	int counts = string_count (original_data, replaced);
	int m = strlen(original_data) + counts * (to_len - rep_len);/* ?��?�n���t��?�s���j�p */
	char *new_buf = NULL;
		
	new_buf = (char *) malloc (m + 1);
	if (NULL == new_buf)
	{
		printf ("malloc error\n");
		return NULL;
	}
 
	memset (new_buf, 0, m + 1);
 
	char *pos_start = original_data, *pos_end = NULL, *pbuf = new_buf;
	int copy_len = 0;
 
	while (NULL != (pos_end = strstr (pos_start, replaced)))
	{
		copy_len = pos_end - pos_start;		/* ?��n�n��?��?�סG�n��?���r�Ŧꤧ�e���r��?�� */
		strncpy (pbuf, pos_start, copy_len);/* ��?��s���t��?�s? */
		pbuf += copy_len;					/* �s?�s?����?���Z���A���ݤU�@��?�e��?�J */
		strncpy (pbuf, to, strlen(to));     /* ?�Ʊ��?���r�Ŧ걵��Z�� */
		pbuf += to_len;						/* �s?�s?����?���Z���A���ݤU�@��?�e��?�J */
		pos_start = pos_end + rep_len;		/* �V?�Q��?���r�Ŧ�A??�Z������? */
	}
	strncpy (pbuf, pos_start, strlen(pos_start) + 1);/* ��?�̦Z�@?�ǰt���r�Ŧ�Z�����r�Ŧ�(??��?'\0') */
 
	return new_buf;
}
 
int main(int argc, const char *argv[])
{
	char buf[] = "dfdshrplease, don'tdngljljeplease, don'tjlsdjf";
	char *replaced = "please, don't";
	char *to = "�z����";
	char *result = NULL;
	
	printf ("%s\n", buf);
	
	result = replace (buf, replaced, to);
	if (NULL != result)
	{
		printf ("%s\n", result);
	}
 
	return 0;
}
