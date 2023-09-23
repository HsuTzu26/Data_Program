/*
use Bank
drop table Personal
drop table Account
drop table BankInfo
drop table Trade
drop table Branch
use master
DROP DATABASE Bank
*/
CREATE DATABASE Bank
ON PRIMARY
(
	name='CreateDB',
	filename='D:\MSSQL_DB\bank.mdf',
	size=16MB,
	maxsize=128MB,
	filegrowth=2MB
)
log on
(
	name='CreateDB_log',
	filename='D:\MSSQL_DB\bank.ldf',
	size=16MB,
	maxsize=128MB,
	filegrowth=2MB
)
GO

USE Bank
go

-- �ӤH���
-- �ӤH�b���B�m��B�W�r�B�ͤ�B�ʧO�B�q�T�a�}�B�����B���y�B��s�ɶ�����B���ʤH
CREATE TABLE Personal
(
    Acc int PRIMARY KEY IDENTITY (100000,2) ,
    First_name char(50),
    Last_name char(50),
    Birth_date date,
    Sex char(1) CONSTRAINT D_Sex DEFAULT 'U',-- 0: female, 1: male, 2: others
    Cityaddress char(50),
    City char(50),
    Citizenship char(25),
    Modify_date date,
    Modify_user char(50),

	CONSTRAINT age check (DATEDIFF(DY, Birth_date, GETDATE()) >= 18*365.25-1)
)

INSERT INTO Personal
    ( First_name,Last_name, Birth_date,Sex, Cityaddress, City, Citizenship)
VALUES
    ('chen',  'test',  '20040317' ,'0','address' ,'taipei' ,'taiwan' ),
    ('chen2', 'test2', '20020616' ,'1','address' ,'taipei' ,'taiwan' ),
    ('chen3', 'test3', '20020617' ,'0','address' ,'taipei' ,'taiwan' )

-- �b���T
-- �Ȧ�b���B�Ȧ�N���B�l�B�B����b���B�b�������B��s�ɶ�����B���ʤH
CREATE TABLE Account
(
    Acc_ID int PRIMARY KEY,     --�Ȧ�b��
    Bank_ID char(20),    --�Ȧ�N��
	Acc int,		--�ӤH�b��
    Balance  int,       --�l�B
    Branch_ID char(20), --����b��
    Acctype int,        --�b������: 1:���s, 2: �w�s
    Modify_date date,-- ��s�ɶ����
    Modify_user char(20)   -- ���ʤH
	
)

INSERT INTO Account
    (Acc_ID, Bank_ID, Balance, Branch_ID, Acctype,Acc)
VALUES
    ('001', '004','1000', '01', '1',100000),
    ('002', '004','3000', '01', '1',100002),
    ('003', '004','5000', '01', '2',100004),
	('004', '001','8000', '02', '1',100000),
    ('005', '002','10000','03', '2',100002)

-- �����T
-- �Ȧ�b���B����s���B����ɶ��BATM�s���B��������B������e�B��s�ɶ�����B���ʤH
CREATE TABLE Trade
(
    Acc_ID int,
	Trade_ID char(50)PRIMARY KEY,
    Trade_date date,
    ATM_ID char(50),
    Trade_type char(1),
    Trade_content char(50),
    Modify_date date,
    Modify_user char(50)
)

INSERT INTO Trade
    (Acc_ID,Trade_ID,Trade_date, ATM_ID,Trade_type, Trade_content)
VALUES
    ('001',  '01','20020323' ,'1' ,'1' ,'test' ),
    ('002', '02','20020323' ,'1' ,'1' ,'test' ),
    ('003', '03','20020323' ,'1' ,'2' ,'test' ),
    ('004', '04','20020323' ,'1' ,'2' ,'test' ),
    ('005', '05','20020323' ,'1' ,'1' ,'test' ),
    ('001', '06','20020323' ,'1' ,'1' ,'test' ),
    ('002', '07','20020323' ,'1' ,'2' ,'test' ),
    ('003', '08','20020323' ,'1' ,'2' ,'test' ),
    ('004', '09','20020323' ,'1' ,'3' ,'test' ),
    ('005','10','20020323' ,'1' ,'3' ,'test' ),
    ('001','11','20020323' ,'1' ,'2' ,'test' ),
    ('002','12','20020323' ,'1' ,'2' ,'test' ),
    ('003','13','20020323' ,'1' ,'1' ,'test' ),
    ('004','14','20020323' ,'1' ,'1' ,'test' )

-- �Ȧ�
-- �Ȧ�N���B�Ȧ�W�١B�a�}
CREATE TABLE BankInfo
(
    Bank_ID char(20)PRIMARY KEY,
    Bankname char(50),
    Bankaddress char(50)
)

INSERT INTO BankInfo
    (Bank_ID, Bankname, Bankaddress)
VALUES
    ('004', '�O�W', '�O�_'),
    ('001', '����', '���'),
	('002', '���c', '���')

Alter Table Account add constraint FK_Account_Personal foreign key (Acc) references Personal(Acc)
Alter Table Account add constraint FK_Account_BankInfo foreign key (Bank_ID) references BankInfo(Bank_ID)
--exec sp_helpconstraint @objname='Account'

 -- �Ȧ�N���B�ӤH�b���B�Ȧ�b���B����s���B����ɶ��B��������B������e
SELECT 
Account.Bank_ID AS �Ȧ�N��,
Account.Acc AS �ӤH�b��,
Trade.Acc_ID AS �Ȧ�b��,
Trade.Trade_ID AS ����s��,
Trade.Trade_date AS ����ɶ�,
Trade.Trade_type AS �������,
Trade.Trade_content AS ������e
FROM Account,Trade
WHERE Trade.Acc_ID = '001' and  Trade.Acc_ID = Account.Acc_ID