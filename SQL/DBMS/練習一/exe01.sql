-- [練習1]設計資料表
--請設計四個資料表，並使用帳號進行關聯 (1)帳戶、(2)個人資料 (3)交易紀錄以及 (4)銀行

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

-- (1)帳戶 
CREATE TABLE Account
(
	Acc_ID int PRIMARY KEY, --銀行帳號
	Bank_ID char(20), --銀行代號
	Acc int, --個人帳號
	Balance int, --餘額
	Branch_ID char(20), --分行帳號
	Acc_Type int, --帳號類型: 1:活存, 2:定存
	Modify_date datetime, --更新時間日期
	Modify_user char(20) --異動人
)
GO

-- (2)個人資料
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

-- (3)交易資訊
CREATE TABLE Transac
(
	Acc_ID int,
	Transac_ID char(50) PRIMARY KEY,
	Transac_date datetime,
	ATM_ID char(50),
	Transac_Type char(1), -- 0:提款 1: 轉帳 2:餘額查詢 3:繳費 4:繳稅
	Transac_content char(1), -- 0:顯示交易金額並顯示帳戶餘額 1:顯示帳戶餘額
	Modify_date datetime,
	Modify_user char(20)
)

-- (4)銀行
CREATE TABLE BankInfo
(
	Bank_ID char(20) PRIMARY KEY,
	BankName char(50),
	BankAdress char(50)
)

--建Foreign Key: 個人帳號(Acc)
ALTER TABLE Account ADD CONSTRAINT FK_Account_Personal FOREIGN KEY (Acc) REFERENCES Personal (Acc)
ALTER TABLE Account ADD CONSTRAINT FK_Account_BankInfo FOREIGN KEY (Bank_ID) REFERENCES BankInfo (Bank_ID)

--新增資料: (帳號5筆, 個人資料3筆, 交易紀錄14筆, 銀行2筆)
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100010, '卡加', '布列島', '2000-02-01', 0, '太平洋海域', '安德烈亞諾夫群島', '美國', '2023/1/01', '徐'),
	(100012, '皮', '卡丘', '2000-02-02', 1, '關都總務處', '真新鎮', '日本', '2023/1/02', '徐'),
	(100014, '石', '蓮花', '2000-02-03', 2, '廣西教務處', '廣西', '中國', '2023/1/03', '徐')

INSERT INTO Account
	(Acc_ID, Bank_ID, Acc, Balance, Branch_ID, Acc_Type, Modify_date, Modify_user)
VALUES
	(11111, '001', 100010, 10000, '822', 1, '2023/2/18', '徐'),
	(22222, '002', 100012, 20000, '515', 2, '2023/2/19', '徐'),
	(33333, '003', 100014, 30000, '382', 1, '2023/2/20', '徐'),
	(44444, '004', 100010, 40000, '957', 2, '2023/2/21', '徐'),
	(55555, '005', 100014, 50000, '006', 2, '2023/2/22', '徐')

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
	('001', '阿北海上銀行', '台北市北投區明德路'),
	('002', '破浪上海銀行', '台北市北投區石牌路');



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


-- 使用查詢(SELECT), 查詢某帳戶的所有交易紀錄, 須包含- 銀行代號、個人帳號、銀行帳號、交易編號、交易時間、交易類型、交易內容
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