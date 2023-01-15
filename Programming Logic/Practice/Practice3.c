#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
/*
 * ??衡?誹いΤぶヘ才﹃ 
 * ???original_data,	蠢?﹍?誹 
 * 			 key,			ヘ才﹃
 * ??誹い蠢?才﹃?? 
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
 * ?replace
 * ???original_data, 	蠢?﹍?誹 
 * 			 replaced,			砆蠢?才﹃
 * 			 to,				蠢?Θ才﹃
 * ?Θ穝才﹃
 * 			 ア?NULL
 */
char *replace(char *original_data, char *replaced, char *to)
{
	int rep_len = strlen (replaced);
	int to_len = strlen (to);
 	int counts = string_count (original_data, replaced);
	int m = strlen(original_data) + counts * (to_len - rep_len);/* ?衡?璶だ皌? */
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
		copy_len = pos_end - pos_start;		/* ?衡璶??璶蠢?才﹃ぇ玡才? */
		strncpy (pbuf, pos_start, copy_len);/* ?穝だ皌?? */
		pbuf += copy_len;					/* 穝???┕簿单Ω?甧? */
		strncpy (pbuf, to, strlen(to));     /* ?辨蠢?才﹃钡 */
		pbuf += to_len;						/* 穝???┕簿单Ω?甧? */
		pos_start = pos_end + rep_len;		/* 禫?砆蠢?才﹃??蠢? */
	}
	strncpy (pbuf, pos_start, strlen(pos_start) + 1);/* ?程?で皌才﹃才﹃(???'\0') */
 
	return new_buf;
}
 
int main(int argc, const char *argv[])
{
	char buf[] = "dfdshrplease, don'tdngljljeplease, don'tjlsdjf";
	char *replaced = "please, don't";
	char *to = "珃";
	char *result = NULL;
	
	printf ("%s\n", buf);
	
	result = replace (buf, replaced, to);
	if (NULL != result)
	{
		printf ("%s\n", result);
	}
 
	return 0;
}
