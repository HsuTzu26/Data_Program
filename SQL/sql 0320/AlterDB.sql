
--������Ʈw
alter database Bank set single_user with rollback immediate
use master
exec sp_detach_db Bank
--���[��Ʈw
CREATE DATABASE Bank
ON 
(
	filename='D:\MSSQL_DB\bank.mdf'
)
FOR ATTACH;

--�ק�b[�ӤH��T]��[�ʧO]��줤�A�N�w�]�ȧאּ'M'
USE Bank
Alter table Personal DROP CONSTRAINT D_Sex
Alter table Personal add CONSTRAINT D_Sex  DEFAULT 'M' for Sex

--�N[�b��]�H��[�������]�H[�b��ID]���i��Foreigen Key ���p�A�B���o�}�a1.3�ҫإߪ����p��
Alter table Trade add Acc int
Alter table Trade add CONSTRAINT FK_Personal foreign key (Acc) references Personal(Acc)

--�ק� [�ӤH��T]��ƪ��W�L18���~��}�᪺����A���ܧ󬰰��y��Taiwan�~��}��
Alter table Personal DROP CONSTRAINT age
Alter table Personal add CONSTRAINT nationality check(Citizenship = 'Taiwan') 

--�ק�o�T�Ӹ�ƪ�[��s����P�ɶ�]���A�]�w�w�]�Ȭ� "����"
update Account set Modify_date = GETDATE()
update Personal set Modify_date = GETDATE()
update Trade set Modify_date = GETDATE()

--�s�W�@��ƪ�A���Ȧ�[����b����ƪ�]���e�]�t: (1)����b�� (2)����W��
CREATE TABLE Branch
(
	����N�� char(20) CONSTRAINT PK_Acc_ID  PRIMARY KEY,
	����W�� char(20),
	�Ȧ�N�� char(20)
)
insert into Branch
	(����N��,����W��,�Ȧ�N��)
values
	('01','�x�_�Ȧ�','004'),
	('02','���Ȧ�','001'),
	('03','���c�Ȧ�','002')

--�N�W�z2.3.5(1)����b���ϥ�Alter�y�k�ϥ�Foreigen Key�P[�b����ƪ�] �i�����p�A�B���o�}�a2.3.2 �P1.3�ҫإߪ����p�� 
Alter table Account add CONSTRAINT FK_Branch_account  foreign key (Branch_ID) references Branch(����N��)
