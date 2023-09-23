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

-- 個人資料
-- 個人帳號、姓氏、名字、生日、性別、通訊地址、城市、國籍、更新時間日期、異動人
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

-- 帳戶資訊
-- 銀行帳號、銀行代號、餘額、分行帳號、帳戶類型、更新時間日期、異動人
CREATE TABLE Account
(
    Acc_ID int PRIMARY KEY,     --銀行帳號
    Bank_ID char(20),    --銀行代號
	Acc int,		--個人帳號
    Balance  int,       --餘額
    Branch_ID char(20), --分行帳號
    Acctype int,        --帳戶類型: 1:活存, 2: 定存
    Modify_date date,-- 更新時間日期
    Modify_user char(20)   -- 異動人
	
)

INSERT INTO Account
    (Acc_ID, Bank_ID, Balance, Branch_ID, Acctype,Acc)
VALUES
    ('001', '004','1000', '01', '1',100000),
    ('002', '004','3000', '01', '1',100002),
    ('003', '004','5000', '01', '2',100004),
	('004', '001','8000', '02', '1',100000),
    ('005', '002','10000','03', '2',100002)

-- 交易資訊
-- 銀行帳號、交易編號、交易時間、ATM編號、交易類型、交易內容、更新時間日期、異動人
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

-- 銀行
-- 銀行代號、銀行名稱、地址
CREATE TABLE BankInfo
(
    Bank_ID char(20)PRIMARY KEY,
    Bankname char(50),
    Bankaddress char(50)
)

INSERT INTO BankInfo
    (Bank_ID, Bankname, Bankaddress)
VALUES
    ('004', '臺灣', '臺北'),
    ('001', '中央', '桃園'),
	('002', '中壢', '桃園')

Alter Table Account add constraint FK_Account_Personal foreign key (Acc) references Personal(Acc)
Alter Table Account add constraint FK_Account_BankInfo foreign key (Bank_ID) references BankInfo(Bank_ID)
--exec sp_helpconstraint @objname='Account'

 -- 銀行代號、個人帳號、銀行帳號、交易編號、交易時間、交易類型、交易內容
SELECT 
Account.Bank_ID AS 銀行代號,
Account.Acc AS 個人帳號,
Trade.Acc_ID AS 銀行帳號,
Trade.Trade_ID AS 交易編號,
Trade.Trade_date AS 交易時間,
Trade.Trade_type AS 交易類型,
Trade.Trade_content AS 交易內容
FROM Account,Trade
WHERE Trade.Acc_ID = '001' and  Trade.Acc_ID = Account.Acc_ID