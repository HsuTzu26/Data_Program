-- [�m��1]�]�p��ƪ�
--�г]�p�|�Ӹ�ƪ�A�èϥαb���i�����p (1)�b��B(2)�ӤH��� (3)��������H�� (4)�Ȧ�

/*
use master
drop database Test1
*/

IF DB_ID ( 'Test1' ) IS NOT NULL
	DROP DATABASE Test1
GO
CREATE DATABASE Test1
GO

USE Test1;
GO

-- (1)�b�� 
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

-- (2)�ӤH���
CREATE TABLE Personal
(
	Acc int PRIMARY KEY,
	FName char(20),
	LName char(20),
	BDate date,
	Gender char(1), -- 0: female, 1: male, 2: others
	Address char(50),
	City char(20),
	Citizenship char(20),
	Modify_date datetime,
	Modify_user char(20)
)
GO

-- (3)�����T
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

-- (4)�Ȧ�
CREATE TABLE BankInfo
(
	Bank_ID char(20) PRIMARY KEY,
	BankName char(50),
	BankAdress char(50)
)

--��Foreign Key: �ӤH�b��(Acc)
ALTER TABLE Account ADD CONSTRAINT FK_Account_Personal FOREIGN KEY (Acc) REFERENCES Personal (Acc)
ALTER TABLE Account ADD CONSTRAINT FK_Account_BankInfo FOREIGN KEY (Bank_ID) REFERENCES BankInfo (Bank_ID)

--�s�W���: (�b��5��, �ӤH���3��, �������14��, �Ȧ�2��)
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100010, '�d�[', '���C�q', '2000-02-01', 0, '�ӥ��v����', '�w�w�P�ȿդҸs�q', '����', '2023/1/01', '�}'),
	(100012, '��', '�d�C', '2000-02-02', 1, '�����`�ȳB', '�u�s��', '�饻', '2023/1/02', '�}'),
	(100014, '��', '����', '2000-02-03', 2, '�s��аȳB', '�s��', '����', '2023/1/03', '�}')

INSERT INTO Account
	(Acc_ID, Bank_ID, Acc, Balance, Branch_ID, Acc_Type, Modify_date, Modify_user)
VALUES
	(11111, '001', 100010, 10000, '822', 1, '2023/2/18', '�}'),
	(22222, '002', 100012, 20000, '515', 2, '2023/2/19', '�}'),
	(33333, '003', 100014, 30000, '382', 1, '2023/2/20', '�}'),
	(44444, '004', 100010, 40000, '957', 2, '2023/2/21', '�}'),
	(55555, '005', 100014, 50000, '006', 2, '2023/2/22', '�}')

INSERT INTO Transac
	(Acc_ID, Transac_ID, Transac_date, ATM_ID, Transac_Type, Transac_content, Modify_date, Modify_user)
VALUES
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
	(11111, '112', '2023/2/12', '012', '4', '0', '2023/2/12', 'Hsu'),
	(11111, '113', '2023/2/13', '013', '0', '0', '2023/2/13', 'Hsu'),
	(11111, '114', '2023/2/14', '014', '2', '1', '2023/2/14', 'Hsu');

INSERT INTO BankInfo
	(Bank_ID, BankName, BankAdress)
VALUES
	('001', '���_���W�Ȧ�', '�x�_���_��ϩ��w��'),
	('002', '�}���W���Ȧ�', '�x�_���_��ϥ۵P��');



/*
SELECT *
FROM Account

SELECT *
FROM Personal

SELECT *
FROM Transac

SELECT *
FROM BankInfo
*/


-- �ϥάd��(SELECT), �d�߬Y�b�᪺�Ҧ��������, ���]�t- �Ȧ�N���B�ӤH�b���B�Ȧ�b���B����s���B����ɶ��B��������B������e
SELECT 
BankInfo.BankName AS BankName,
Account.Bank_ID AS Bank_ID,
Account.Acc AS Acc,
Account.Acc_ID AS Acc_ID,
Transac.Transac_ID AS Transac_ID,
Transac.Transac_date AS Transac_date,
Transac.Transac_Type AS Transac_Type,
Transac.Transac_content AS Transac_content
FROM BankInfo, Account, Transac, Personal
WHERE (Account.Acc = 100010) AND (Personal.Acc = Account.Acc) AND (Transac.Acc_ID = Account.Acc_ID) AND (Account.Bank_ID = BankInfo.Bank_ID)

--ALTER AUTHORIZATION ON DATABASE::Test1 TO [sa];