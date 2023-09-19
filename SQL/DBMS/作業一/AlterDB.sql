/*
	ALTER Database
 - 2.1 附加資料庫 : 需包含用指定特定mdf檔(15分)
  -  提示: 需先將資料庫bank.mdf檔建立起來，再用FOR ATTACH載入MDF檔。bank.mdf 。路徑請指定為 D:\MSSQL_DB\bank.mdf
 - 2.2 修改資料庫中的主檔，並將其SIZE, MAXSIZE以及FILEGROWTH的數值變成原本的2倍 (每個各5分，共15分)
2.3 AlterDB.sql: ALTER TABLE規格:
 
 - 2.3.1 修改在[個人資訊]的[性別]欄位中，將預設值改為'M' (5分)
 - 2.3.2 將[帳號]以及[交易紀錄]以[帳號ID]欄位進行Foreigen Key 關聯，且不得破壞1.3所建立的關聯性 (15分)
 - 2.3.3 修改 [個人資訊]資料表中超過18歲才能開戶的限制，並變更為國籍為Taiwan才能開戶 (5分)
 - 2.3.4 修改這三個資料表的[更新日期與時間]欄位，設定預設值為 "今天" (每個各10分，共15分)
 - 2.3.5 新增一資料表，為銀行[分行帳號資料表]內容包含: (1)分行帳號 (2)分行名稱  (5分)
 - 2.3.6 將上述2.3.5(1)分行帳號使用Alter語法使用Foreigen Key與[帳號資料表] 進行關聯，且不得破壞2.3.2 與1.3所建立的關聯性 (10分)
*/

--資料庫建立檔案群組設定參數

/*
--資料庫若還在使用中
方法一：
	Step1:先查詢哪些DB目前使用(連線)中
	Exec sp_who
	EXEC sys.sp_who2
	Step2:切換到非要卸離的資料庫
	--先將資料庫切換到非要卸離的資料庫
	USE master
	GO
	--卸載資料庫
	EXEC master.dbo.sp_detach_db @dbname = N'Bank'
方法二：
	--卸離資料庫 set single_user
	alter database Bank set single_user with rollback immediate
	use master
	exec sp_detach_db Bank
*/

--卸離資料庫
/*
--方法1
ALTER DATABASE Bank SET SINGLE_USER WITH ROLLBACK IMMEDIATE
USE master
EXEC sp_detach_db Bank
*/
--卸離資料庫
--方法2
USE master
GO

EXEC master.dbo.sp_detach_db @dbname = N'Bank'

--附加資料庫
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

--修改在[個人資訊]的[性別]欄位中，將預設值改為'M' 
--先刪除舊有條件約束
ALTER TABLE Personal DROP CONSTRAINT DGender
--再新增新的條件約束
ALTER TABLE Personal ADD CONSTRAINT DGender DEFAULT 'M' FOR Gender

--將[帳號]以及[交易紀錄]以[帳號ID]欄位進行Foreigen Key 關聯，且不得破壞1.3所建立的關聯性
ALTER TABLE Transac ADD Acc int
ALTER TABLE Transac ADD CONSTRAINT FK_Personal_Transac FOREIGN KEY (Acc) REFERENCES Personal(Acc)

--修改 [個人資訊]資料表中超過18歲才能開戶的限制，並變更為國籍為Taiwan才能開戶
ALTER TABLE Personal DROP CONSTRAINT AGE
ALTER TABLE Personal ADD CONSTRAINT CCitizenship CHECK (Citizenship = '台灣')
--若已經存在一些資料行的 "Citizenship" 欄位值不等於 'Taiwan'就會出現conflict

--修改這三個資料表的[更新日期與時間]欄位，設定預設值為 "今天"
UPDATE Account SET Modify_date = GETDATE()
UPDATE Personal SET Modify_date = GETDATE()
UPDATE Transac SET Modify_date = GETDATE()

--新增一資料表，為銀行[分行帳號資料表]內容包含: (1)分行帳號 (2)分行名稱
CREATE TABLE Branch
(
	Branch_ID char(20) PRIMARY KEY,
	Branch_name char(20),
)

INSERT INTO Branch
	(Branch_ID, Branch_name)
VALUES
	('001', '三三星空銀行'),
	('002', '上海儲蓄銀行'),
	('003', '台新國際商業銀行'),
	('004', '信義安和銀行'),
	('005', '午二時銀行'),
	('006', '中國信託商業銀行');


--將上述2.3.5(1)分行帳號使用Alter語法使用Foreigen Key與[帳號資料表] 進行關聯，且不得破壞2.3.2 與1.3所建立的關聯性
ALTER TABLE Account ADD CONSTRAINT FK_Branch_Account FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)