# include <stdio.h>
int main(void)
{
  int a[23] = {1,5,66,8,55,9,1,32,65,4,15,64,156,1564,7,215};
  int b[24]; //�ΨӦs�񴡤J�Ʀr�᪺�s�}�C,�]���S���J�F�@�ӭ�,�ҥH���׬�24
  int Index; //���J�Ȫ��U��,Index�O���U�С����^����
  int num; //���J����
  int i; //�j���ܼ�
  printf("�п�J���J�Ȫ��U�СG");
  scanf("%d",&Index);
  printf("�п�J���J���ƭȡG");
  scanf("%d",&num);
  for (i=0; i<24; ++i)
  {
    if (i < Index)
    {
      b[i] = a[i]; /*�j���ܼ�i�p�󴡤J�Ȧ�mIndex��,�C�@�Ӥ����ҩ񪺦�m����*/
    }
    else if (i == Index)
    {  
      b[i] = num; //i����Index��,�N���J�Ƚᵹ�}�Cb
    }
    else
    {
      b[i] = a[i-1]; /*�]�����J�F�@�ӷs������,�ҥH���J��m�᪺�C�@�Ӥ����Ҧs�񪺦�m���n�V�Ჾ�@��*/
    }
  }
  for (i=0; i<24; ++i)
  {
    printf("%d\x20",b[i]);
  }
  printf("\n");
  
  int a[23] = {1,215};
  int b[22]; /*�ΨӦs��R���Ʀr�᪺�s�}�C,�]���R���F�@�ӭ�,�ҥH���׬�22*/
  int Index; //�n�R�����Ȫ��U��
  int i; //�j���ܼ�
  printf("�п�J�n�R�����Ȫ��U�СG");
  scanf("%d",&Index);
  for (i=0; i<23; ++i)
  {
    if (i < Index)
    {
      b[i] = a[i]; /*�j���ܼ�i�p�󴡤J�Ȧ�mIndex��,�C�@�Ӥ����Ҧs�񪺦�m����*/
    }
    else
    {
      b[i] = a[i+1]; /*�R���ȫ᭱�����������e���@��,�n�R�����Ȫ����Q�л\*/
    }
  }
  for (i=0; i<22; ++i)
  {
    printf("%d\x20",b[i]); // \x20��ܪŮ�
  }
  printf("\n");
  return 0;
  
}
