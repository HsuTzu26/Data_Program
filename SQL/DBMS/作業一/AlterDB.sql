/*
	ALTER Database
 - 2.1 ���[��Ʈw : �ݥ]�t�Ϋ��w�S�wmdf��(15��)
  -  ����: �ݥ��N��Ʈwbank.mdf�ɫإ߰_�ӡA�A��FOR ATTACH���JMDF�ɡCbank.mdf �C���|�Ы��w�� D:\MSSQL_DB\bank.mdf
 - 2.2 �ק��Ʈw�����D�ɡA�ñN��SIZE, MAXSIZE�H��FILEGROWTH���ƭ��ܦ��쥻��2�� (�C�ӦU5���A�@15��)
2.3 AlterDB.sql: ALTER TABLE�W��:
 
 - 2.3.1 �ק�b[�ӤH��T]��[�ʧO]��줤�A�N�w�]�ȧאּ'M' (5��)
 - 2.3.2 �N[�b��]�H��[�������]�H[�b��ID]���i��Foreigen Key ���p�A�B���o�}�a1.3�ҫإߪ����p�� (15��)
 - 2.3.3 �ק� [�ӤH��T]��ƪ��W�L18���~��}�᪺����A���ܧ󬰰��y��Taiwan�~��}�� (5��)
 - 2.3.4 �ק�o�T�Ӹ�ƪ�[��s����P�ɶ�]���A�]�w�w�]�Ȭ� "����" (�C�ӦU10���A�@15��)
 - 2.3.5 �s�W�@��ƪ�A���Ȧ�[����b����ƪ�]���e�]�t: (1)����b�� (2)����W��  (5��)
 - 2.3.6 �N�W�z2.3.5(1)����b���ϥ�Alter�y�k�ϥ�Foreigen Key�P[�b����ƪ�] �i�����p�A�B���o�}�a2.3.2 �P1.3�ҫإߪ����p�� (10��)
*/

--��Ʈw�إ��ɮ׸s�ճ]�w�Ѽ�

/*
--��Ʈw�Y�٦b�ϥΤ�
��k�@�G
	Step1:���d�߭���DB�ثe�ϥ�(�s�u)��
	Exec sp_who
	EXEC sys.sp_who2
	Step2:������D�n��������Ʈw
	--���N��Ʈw������D�n��������Ʈw
	USE master
	GO
	--������Ʈw
	EXEC master.dbo.sp_detach_db @dbname = N'Bank'
��k�G�G
	--������Ʈw set single_user
	alter database Bank set single_user with rollback immediate
	use master
	exec sp_detach_db Bank
*/

--������Ʈw
/*
--��k1
ALTER DATABASE Bank SET SINGLE_USER WITH ROLLBACK IMMEDIATE
USE master
EXEC sp_detach_db Bank
*/
--������Ʈw
--��k2
USE master
GO

EXEC master.dbo.sp_detach_db @dbname = N'Bank'

--���[��Ʈw
CREATE DATABASE Bank
ON PRIMARY
  ( 
	NAME='Bank_Primary',
    FILENAME='D:\MSSQL_DB\Bank_Prm.mdf',
    SIZE=16MB,
    MAXSIZE=128MB,
    FILEGROWTH=2MB
	)
LOG ON
  ( 
	NAME='Bank_log',
    FILENAME='D:\MSSQL_DB\Bank_log.ldf',
    SIZE=16MB,
    MAXSIZE=128MB,
    FILEGROWTH=2MB
	)
FOR ATTACH;

--ALTER TABLE
USE Bank;
GO

--�ק�b[�ӤH��T]��[�ʧO]��줤�A�N�w�]�ȧאּ'M' 
--���R���¦��������
ALTER TABLE Personal DROP CONSTRAINT DGender
--�A�s�W�s���������
ALTER TABLE Personal ADD CONSTRAINT DGender DEFAULT 'M' FOR Gender

--�N[�b��]�H��[�������]�H[�b��ID]���i��Foreigen Key ���p�A�B���o�}�a1.3�ҫإߪ����p��
ALTER TABLE Transac ADD Acc int
ALTER TABLE Transac ADD CONSTRAINT FK_Personal_Transac FOREIGN KEY (Acc) REFERENCES Personal(Acc)

--�ק� [�ӤH��T]��ƪ��W�L18���~��}�᪺����A���ܧ󬰰��y��Taiwan�~��}��
ALTER TABLE Personal DROP CONSTRAINT AGE
ALTER TABLE Personal ADD CONSTRAINT CCitizenship CHECK (Citizenship = '�x�W')
--�Y�w�g�s�b�@�Ǹ�Ʀ檺 "Citizenship" ���Ȥ����� 'Taiwan'�N�|�X�{conflict

--�ק�o�T�Ӹ�ƪ�[��s����P�ɶ�]���A�]�w�w�]�Ȭ� "����"
UPDATE Account SET Modify_date = GETDATE()
UPDATE Personal SET Modify_date = GETDATE()
UPDATE Transac SET Modify_date = GETDATE()

--�s�W�@��ƪ�A���Ȧ�[����b����ƪ�]���e�]�t: (1)����b�� (2)����W��
CREATE TABLE Branch
(
	Branch_ID char(20) PRIMARY KEY,
	Branch_name char(20),
)

INSERT INTO Branch
	(Branch_ID, Branch_name)
VALUES
	('001', '�T�T�P�ŻȦ�'),
	('002', '�W���x�W�Ȧ�'),
	('003', '�x�s��ڰӷ~�Ȧ�'),
	('004', '�H�q�w�M�Ȧ�'),
	('005', '�ȤG�ɻȦ�'),
	('006', '����H�U�ӷ~�Ȧ�');


--�N�W�z2.3.5(1)����b���ϥ�Alter�y�k�ϥ�Foreigen Key�P[�b����ƪ�] �i�����p�A�B���o�}�a2.3.2 �P1.3�ҫإߪ����p��
ALTER TABLE Account ADD CONSTRAINT FK_Branch_Account FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)