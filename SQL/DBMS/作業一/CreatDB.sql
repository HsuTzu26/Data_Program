/*
	CREATE Database & Table

 CREATE TABLE �W��:
 - 1.1. �s�W��Ʈw�A�ݥ]�t�Ϋ��w�S�w����ɸ��|(15��)
 - 1.2. �C�Ӹ�ƪ�ݫإ߭ӧO��PRIMARY KEY (�C�Ӫ�U5���A�@15��)
 - 1.3  �N[�b��], [�ӤH��T]�o��Ӹ�ƪ�H[�ӤH�b��ID]���i��Foreigen Key ���p(�C�Ӫ�U10���A�@20��)
 - 1.4  �b [�ӤH��T]��ƪ��[�J����}�����W�L18���~��}��(�~�����) (5��)
 - 1.5  �b[�ӤH��T]��[�ʧO]��줤�A�]�w�w�]�Ȭ�'U'  (5��)
 - 1.6  �b[�ӤH��T]��ID�]�w��ƫ��A��int,�B��PRIMARY KEY�A�B�w�]��l�Ȭ�100000, ��s�W��ƮɡA�C���ƭȦ۰ʥ[2 (5��)
*/
--�s�W��Ʈw(�ˬdDATABASE�O�_�w�s�b)
USE master;
GO

IF DB_ID ( 'Bank' ) IS NOT NULL
	DROP DATABASE Bank
GO
CREATE DATABASE Bank
ON PRIMARY
(
	NAME='Bank_Primary',
	FILENAME='D:\MSSQL_DB\Bank_Prm.mdf'
)
LOG ON
(
	NAME='Bank_log',
	FILENAME='D:\MSSQL_DB\Bank_log.ldf'
)
GO

USE Bank;
GO

--�b��Account(Acc)
-- �Ȧ�b���B�Ȧ�N���B�l�B�B����b���B�b�������B��s�ɶ�����B���ʤH
CREATE TABLE Account
(
	Acc_ID int PRIMARY KEY, --�Ȧ�b��
	Bank_ID char(20), --�Ȧ�N��
	Acc int, --�ӤH�b��
	Balance int, --�l�B
	Branch_ID char(20), --����b��
	Acc_Type int, --�b������: 1:���s, 2:�w�s
	Modify_date datetime, --��s�ɶ����
	Modify_user char(20) --���ʤH
)
GO

--�ӤH��T:(Personal)
--�ӤH�b���B�m��B�W�r�B�ͤ�B�ʧO�B�q�T�a�}�B�����B���y�B��s�ɶ�����B���ʤH

--USE CHECK and DATEDIFF ( datepart , startdate , enddate )  
CREATE TABLE Personal
(
	Acc int IDENTITY(100000,2) PRIMARY KEY,
	FName char(20),
	LName char(20),
	BDate date ,--CONSTRAINT AGE CHECK (DATEDIFF (year, BDate, GETDATE()) >= 18), --���󤣦��߮ɷ|���X�Ĭ�ERROR
	Gender char(1),-- CONSTRAINT DGender DEFAULT 'U', -- 0: female, 1: male, 2: others
	Address char(50),
	City char(20),
	Citizenship char(20),
	Modify_date datetime,
	Modify_user char(20)
)
GO
/*
--�M�Ÿ�ƪ�(���R��)
TRUNCATE TABLE Personal
--�R��CONSTRAINT
ALTER TABLE Personal
DROP CONSTRAINT AGE
*/
--�s�WCONSTRAINT
ALTER TABLE Personal ADD CONSTRAINT AGE CHECK (DATEDIFF (year, BDate, GETDATE()) >= 18)

ALTER TABLE Personal ADD CONSTRAINT DGender DEFAULT 'U' FOR Gender;

/*
--����CONSTRAINT/FK
ALTER TABLE Personal NOCHECK CONSTRAINT AGE
--�ҥ�
ALTER TABLE Personal CHECK CONSTRAINT AGE
*/


-- �������: (Transaction records)
-- �Ȧ�b���B����s���B����ɶ��BATM�s���B��������B������e�B��s�ɶ�����B���ʤH
CREATE TABLE Transac
(
	Acc_ID int,
	Transac_ID char(50) PRIMARY KEY,
	Transac_date datetime,
	ATM_ID char(50),
	Transac_Type char(1), -- 0:���� 1: ��b 2:�l�B�d�� 3:ú�O 4:ú�|
	Transac_content char(1), -- 0:��ܥ�����B����ܱb��l�B 1:��ܱb��l�B
	Modify_date datetime,
	Modify_user char(20)
)

--�Ȧ�
--�Ȧ�N���B�Ȧ�W�١B�a�}
CREATE TABLE BankInfo
(
	Bank_ID char(20) PRIMARY KEY,
	BankName char(50),
	BankAdress char(50)
)

--�� FK: Acc, Bank_ID
ALTER TABLE Account ADD CONSTRAINT FK_Account_Personal FOREIGN KEY (Acc) REFERENCES Personal(Acc)
ALTER TABLE Account ADD CONSTRAINT FK_Account_BankInfo FOREIGN KEY (Bank_ID) REFERENCES BankInfo(Bank_ID)
--�d��FK���G
--exec sp_helpconstraint @objname='Account'


/* �R��CONSTRAINT FK
ALTER TABLE Account DROP CONSTRAINT FK_Account_Personal
ALTER TABLE Account DROP CONSTRAINT FK_Account_BankInfo
*/

/*
--�C�X�{�b�ϥΤ���Ʈw�����Ҧ���ƪ�
SELECT * FROM INFORMATION_SCHEMA.TABLES ORDER BY TABLE_NAME
*/

--�� IDENTITY_INSERT �]�� OFF �ɡA�L�k�N�~��ȴ��J��ƪ� 'Personal' ���ѧO��줤�C
--�}�Ҧ۰��ѧO���
SET IDENTITY_INSERT Personal ON

--�ӤH��T 5�����
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100010, '��', '�o��', '1998-09-22', '2', '�s�_���s����888��', '�s�_��', '�x�W', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100012, '��', '����', '1978-11-12', '0', '�x�_���n���777��', '�x�_��', '�x�W', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100014, '��', '�ު�', '1990-06-03', '1', '��������s��666��', '������', '�x�W', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100016, '��', '�Ѩ�', '2000-03-15', '1', '�x�_���U�ذ�555��', '�x�_��', '�x�W', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100018, '��', '�u��', '2021-02-07', '0', '�s�_���T����867��', '�s�_��', '�x�W', GETDATE(), 'Hsu')

--�Ȧ��T 3�����
INSERT INTO BankInfo
	(Bank_ID, BankName, BankAdress)
VALUES
	('822', '����H�U�ӷ~�Ȧ�', '�x�_'),
	('515', '�ȤG�ɻȦ�', '�x�n'),
	('007', '���P�S�ȻȦ�', '���')

--�b��- 2�H�U1����� �@2��
INSERT INTO Account
	(Acc_ID, Bank_ID, Acc, Balance, Branch_ID, Acc_Type, Modify_date, Modify_user)
VALUES
	(11111, '822', 100010, 10000, '001', 1, GETDATE(), 'Hsu'),
	(22222, '515', 100012, 20000, '002', 2, GETDATE(), 'Hsu')

--�������- 20��(�C�ӱb��10��)
INSERT INTO Transac
	(Acc_ID, Transac_ID, Transac_date, ATM_ID, Transac_Type, Transac_content, Modify_date, Modify_user)
VALUES
	(11111, '121', '2023/1/26', '001', '0', '0', '2023/1/26', 'Hsu'),
	(11111, '122', '2023/1/27', '002', '1', '0', '2023/1/27', 'Hsu'),
	(11111, '123', '2023/1/28', '003', '3', '0', '2023/1/28', 'Hsu'),
	(11111, '124', '2023/1/29', '004', '4', '0', '2023/1/29', 'Hsu'),
	(11111, '115', '2023/1/30', '005', '2', '1', '2023/1/30', 'Hsu'),
	(11111, '116', '2023/1/31', '006', '1', '0', '2023/1/31', 'Hsu'),
	(11111, '101', '2023/2/01', '001', '0', '0', '2023/2/01', 'Hsu'),
	(11111, '102', '2023/2/02', '002', '1', '0', '2023/2/02', 'Hsu'),
	(22222, '103', '2023/2/03', '003', '3', '0', '2023/2/03', 'Hsu'),
	(22222, '104', '2023/2/04', '004', '4', '0', '2023/2/04', 'Hsu'),
	(22222, '105', '2023/2/05', '005', '2', '1', '2023/2/05', 'Hsu'),
	(22222, '106', '2023/2/06', '006', '1', '0', '2023/2/06', 'Hsu'),
	(22222, '107', '2023/2/07', '007', '0', '0', '2023/2/07', 'Hsu'),
	(22222, '108', '2023/2/08', '008', '3', '0', '2023/2/08', 'Hsu'),
	(22222, '109', '2023/2/09', '009', '3', '0', '2023/2/09', 'Hsu'),
	(22222, '110', '2023/2/10', '010', '0', '0', '2023/2/10', 'Hsu'),
	(22222, '111', '2023/2/11', '011', '1', '0', '2023/2/11', 'Hsu'),
	(22222, '112', '2023/2/12', '012', '4', '0', '2023/2/12', 'Hsu'),
	(11111, '113', '2023/2/13', '013', '0', '0', '2023/2/13', 'Hsu'),
	(11111, '114', '2023/2/14', '014', '2', '1', '2023/2/14', 'Hsu');
