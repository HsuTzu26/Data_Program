#include <stdio.h>
#include <stdlib.h>
int main()
{ 
//	short int no1=200; /* �ŧi���u��� */ 
//	int no2=200;
//	long int no3=200; 
//	printf("%d%����%d�줸��\n",no1,sizeof(no1)); /* �H10�i���X */ 
//	printf("%d%����%d�줸��\n",no2,sizeof(no2)); /* �H10�i���X */
//	printf("%d%����%d�줸��\n",no3,sizeof(no3)); /* �H10�i���X */ 
	
//	int Num=100; /* �H10�i��]�w����ܼ� */
//	int OctNum=0200; /* �H8�i��]�w�u����ܼ� */
//	int HexNum=0x33f; /* �H16�i��]�w����ܼ� */ 
//	printf("Num=%d\n",Num); /* �H10�i���X */ 
//	printf("OctNum=%d\n",OctNum); /* �H8�i���X */
//	printf("HexNum=%d\n",HexNum); /* �H16�i���X */

//	char ch1='\'';/* ch1�]�Ȭ�' */ 
//	printf("\"I%cm a good boy.\"\n",ch1);
//	/* �Q��printf()��ƿ�X��޸��P���޸�*/ 
	
//	printf( "short int����ƪ��ס�%d�줸��\n",sizeof(short int)); /*���oshort int���A
//	�j�p*/ 
//	printf( "long int ����ƪ��ס�%d�줸��\n",sizeof(long int)); /*���olong int���A�j
//	�p*/
//	printf( "long long int ����ƪ��ס�%d�줸��\n",sizeof(long long int)); /*���olong 
//	long int���A�j�p*/
//	printf( "char����ƪ��ס�%d�줸��\n",sizeof(char)); /*���ochar���A�j�p*/
//	printf( "float����ƪ��ס�%d�줸��\n",sizeof(float)); /*���ofloat���A�j�p */
//	printf( "double����ƪ��ס�%d�줸��\n",sizeof(double)); /*���odouble���A�j
//	�p*/ 

//	int x; 
//	x=765/17*2*210;
//	printf("�@�ݪ�O:%d ��\n",x);

//	/*�ŧi�ܼ�*/
//	float c, f;
//	//��J���ū�
//	printf("�п�J���ūסG");
//	scanf("%f",&c);
//	f=(9*c)/5+32; /* �ؤ�ū��ഫ���� */ 
//	printf("���%.1f�� = �ؤ�%.1f��\n",c,f); 
	
//	int num, MAX= 0, input, i;
//	printf("�ǳƿ�J�Ʀr���ӼơG");
//	scanf("%d", &num);
//	for(i = 0; i < num; i++)
//	{
//		printf(">");
//		scanf("%d", &input);
//		if(MAX<input)
//		MAX=input;
//	} /* �Q��for�j��ӿ�J�P�M��̤j�� */ 
//	printf("�o�ǼƦr�����̤j�Ȭ��G%d\n",MAX);

	int i, sum=0;
	for(i=1; i<=200; i=i+2)
	{
		if(i==101)
			break;
		sum+=i;
	}
	printf("1~99���_���`�M�G%d\n", sum);

	return 0;
}

