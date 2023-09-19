/*
### 隨堂練習 3
1. 建立NTUNHS_IM資料庫後，新增一個表格，並插入一筆資料後，並顯示出來
*/
-- 01新增資料庫
CREATE DATABASE NTUNHS_IM

-- 02新增資料庫並檢查是否存在
IF DB_ID('NTUNHS_IM') IS NOT NULL
	DROP DATABASE NTUNHS_IM;
GO
CREATE DATABASE NTUNHS_IM;
GO

-- 03新增TABLE
USE NTUNHS_IM
DROP TABLE Customer
CREATE TABLE Customer
(
    First_Name char(50),
    Last_Name char(50),
    Address char(50),
    City char(50),
    Country char(25),
    Birth_Date datetime	
);

-- 04插入一筆資料
-- 新增方法1
/*
INSERT INTO Customer
	(First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES
	('HSUTZU', 'HSU', 'NewTaipei', 'Taiwan', '20021126');
INSERT INTO Customer
	(First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES
	('LAND', 'LALA', 'Taipei', 'TaiNan', '20010106');
*/

-- 新增方法2
INSERT INTO Customer
	(First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES 
	('HSUTZU', 'HSU', 'NewTaipei', 'NewTaipei', 'Taiwan', '2002-11-26'),
	('LAND', 'LALA', 'Taipei', 'Taipei', 'Taiwan', '2001-01-06'),
	('GAGA', 'WU', 'Taichung', 'Taichung', 'Taiwan', '1999-07-07'),
	('TRAIN', 'HEAD', 'Xinchu', 'Xinchu', 'Taiwan', '2011-10-07'),
	('LUXI', 'Lien', 'Hualien', 'Hualien', 'Taiwan', '1997-06-07')

-- 05查詢所有資料
SELECT *
FROM Customer

-- 06查詢在台北市的所有資料
SELECT *
FROM Customer
WHERE City = 'Taipei'

-- 07查詢在台北市且生日大於1997年的所有資料
SELECT *
FROM Customer
WHERE City = 'Taipei' AND Birth_Date > '1997-01-01'

-- 08更新一筆資料
UPDATE Customer
SET Birth_Date = '1998-06-16'
WHERE City = 'Taipei' AND Last_Name = 'LALA'

-- 09刪除一筆資料
DELETE FROM Customer
WHERE City = 'Taipei' AND Last_Name = 'LALA'

-- 10增加欄位 & 設定預設值
ALTER TABLE Customer ADD Gender char(1) DEFAULT 'U'
-- 11刪除欄位
ALTER TABLE Products DROP COLUMN ProductName

-- 12修改
-- 12.1 欄位大小型態
USE NTUNHS_IM;
IF DB_ID('NTUNHS_IM') IS NOT NULL
ALTER TABLE Customer ALTER COLUMN First_Name char(30);
GO
-- 12.2 修改欄位名稱
USE NTUNHS_IM;
IF DB_ID('NTUNHS_IM') IS NOT NULL
EXEC sp_rename 'Customer.First_Name', 'FirstName', 'COLUMN'
GO
-- 12.3 修改欄位預設值
-- 12.3.1 檢查有無重複的限制(Constraint):
--NULL ([允許空值)、NOT NULL  (非空值)
--UNIQUE  (唯一值)
--CHECK (例如: 只能大於0):  CHECK (ID > 0),  ( MySQL沒有CHECK)
--其他:
--Primary key
--Foreign key
--DEFAULT
--查詢物件(通常為Table)中的限制條件
EXEC sp_helpconstraint @objname = 'Customer'
-- 12.3.2 有重複限制需要先刪除
ALTER TABLE Customer DROP CONSTRAINT Gender --若有預設值,會有條件約束問題
ALTER TABLE Customer DROP CONSTRAINT DF__Customer__Gender__49C3F6B7
-- 12.3.3 重新建立Constraint
ALTER TABLE Customer ADD CONSTRAINT Gender DEFAULT 'F' FOR Gender
-- 13 清除資料表
TRUNCATE TABLE Customer
-- 14 UPDATE資料(指定條件)
UPDATE Customer SET Birth_Date = '1999-07-07' WHERE ID = '001'
-- 15 DELETE資料(指定條件)
DELETE FROM Customer
WHERE ID = '001'
--16 查詢兩個表格並輸出成一個結果
SELECT A.ID, B.Birth_Date
FROM IDTABLE AS A, Customer AS B
WHER A.ID = B.ID