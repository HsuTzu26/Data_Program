/*
	CREATE Database & Table

 CREATE TABLE 規格:
 - 1.1. 新增資料庫，需包含用指定特定資料檔路徑(15分)
 - 1.2. 每個資料表需建立個別的PRIMARY KEY (每個表各5分，共15分)
 - 1.3  將[帳號], [個人資訊]這兩個資料表以[個人帳號ID]欄位進行Foreigen Key 關聯(每個表各10分，共20分)
 - 1.4  在 [個人資訊]資料表中加入限制開戶應超過18歲才能開戶(才能建檔) (5分)
 - 1.5  在[個人資訊]的[性別]欄位中，設定預設值為'U'  (5分)
 - 1.6  在[個人資訊]的ID設定資料型態為int,且為PRIMARY KEY，且預設初始值為100000, 當新增資料時，每次數值自動加2 (5分)
*/
--新增資料庫(檢查DATABASE是否已存在)
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

--帳號Account(Acc)
-- 銀行帳號、銀行代號、餘額、分行帳號、帳號類型、更新時間日期、異動人
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

--個人資訊:(Personal)
--個人帳號、姓氏、名字、生日、性別、通訊地址、城市、國籍、更新時間日期、異動人

--USE CHECK and DATEDIFF ( datepart , startdate , enddate )  
CREATE TABLE Personal
(
	Acc int IDENTITY(100000,2) PRIMARY KEY,
	FName char(20),
	LName char(20),
	BDate date ,--CONSTRAINT AGE CHECK (DATEDIFF (year, BDate, GETDATE()) >= 18), --條件不成立時會跳出衝突ERROR
	Gender char(1),-- CONSTRAINT DGender DEFAULT 'U', -- 0: female, 1: male, 2: others
	Address char(50),
	City char(20),
	Citizenship char(20),
	Modify_date datetime,
	Modify_user char(20)
)
GO
/*
--清空資料表(不刪除)
TRUNCATE TABLE Personal
--刪除CONSTRAINT
ALTER TABLE Personal
DROP CONSTRAINT AGE
*/
--新增CONSTRAINT
ALTER TABLE Personal ADD CONSTRAINT AGE CHECK (DATEDIFF (year, BDate, GETDATE()) >= 18)

ALTER TABLE Personal ADD CONSTRAINT DGender DEFAULT 'U' FOR Gender;

/*
--停用CONSTRAINT/FK
ALTER TABLE Personal NOCHECK CONSTRAINT AGE
--啟用
ALTER TABLE Personal CHECK CONSTRAINT AGE
*/


-- 交易紀錄: (Transaction records)
-- 銀行帳號、交易編號、交易時間、ATM編號、交易類型、交易內容、更新時間日期、異動人
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

--銀行
--銀行代號、銀行名稱、地址
CREATE TABLE BankInfo
(
	Bank_ID char(20) PRIMARY KEY,
	BankName char(50),
	BankAdress char(50)
)

--建 FK: Acc, Bank_ID
ALTER TABLE Account ADD CONSTRAINT FK_Account_Personal FOREIGN KEY (Acc) REFERENCES Personal(Acc)
ALTER TABLE Account ADD CONSTRAINT FK_Account_BankInfo FOREIGN KEY (Bank_ID) REFERENCES BankInfo(Bank_ID)
--查看FK結果
--exec sp_helpconstraint @objname='Account'


/* 刪除CONSTRAINT FK
ALTER TABLE Account DROP CONSTRAINT FK_Account_Personal
ALTER TABLE Account DROP CONSTRAINT FK_Account_BankInfo
*/

/*
--列出現在使用之資料庫中的所有資料表
SELECT * FROM INFORMATION_SCHEMA.TABLES ORDER BY TABLE_NAME
*/

--當 IDENTITY_INSERT 設為 OFF 時，無法將外顯值插入資料表 'Personal' 的識別欄位中。
--開啟自動識別欄位
SET IDENTITY_INSERT Personal ON

--個人資訊 5筆資料
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100010, '嘎', '油壓', '1998-09-22', '2', '新北市新莊區888號', '新北市', '台灣', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100012, '牛', '媽媽', '1978-11-12', '0', '台北市南港區777號', '台北市', '台灣', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100014, '楊', '拔爸', '1990-06-03', '1', '高雄市鳳山區666號', '高雄市', '台灣', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100016, '邱', '天來', '2000-03-15', '1', '台北市萬華區555號', '台北市', '台灣', GETDATE(), 'Hsu')
INSERT INTO Personal
	(Acc, FName, LName, BDate, Gender, Address, City, Citizenship, Modify_date, Modify_user)
VALUES
	(100018, '李', '真誠', '2021-02-07', '0', '新北市三重區867號', '新北市', '台灣', GETDATE(), 'Hsu')

--銀行資訊 3筆資料
INSERT INTO BankInfo
	(Bank_ID, BankName, BankAdress)
VALUES
	('822', '中國信託商業銀行', '台北'),
	('515', '午二時銀行', '台南'),
	('007', '金牌特務銀行', '桃園')

--帳號- 2人各1筆資料 共2筆
INSERT INTO Account
	(Acc_ID, Bank_ID, Acc, Balance, Branch_ID, Acc_Type, Modify_date, Modify_user)
VALUES
	(11111, '822', 100010, 10000, '001', 1, GETDATE(), 'Hsu'),
	(22222, '515', 100012, 20000, '002', 2, GETDATE(), 'Hsu')

--交易紀錄- 20筆(每個帳號10筆)
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
