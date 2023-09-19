/*## 說明
1. 將附件的mdf附加到MSSQL中
2. 請將所有隨堂練習的語法，儲存在同一檔案，名稱HW2.sql
 
### 1. 新增資料表(insert)
- 隨堂練習1:請將[出貨記錄].[編號]IDENTITY關閉，並手動新增一筆資料 (10)
- 隨堂練習2:請新增[員工]中，職位為 "辦事員"的資料至[圖書室借用記錄] (10)
- 隨堂練習3:請將SQL中定義的資料型態int, smallint, char, vchar的TYPE_NAME, PRECISION, DATA_TYPE的資訊放到自訂暫存資料表，並顯示結果 (10)
  -- 提示1：使用　sp_datatype_info
  -- 提示2：自訂暫存表的資料型態需與sp_datatype_info查詢結果的欄位資料型態相符
- 隨堂練習4:顯示[出貨記錄]與[客戶]資料表中所有的資料表，顯示不能重複欄位，將聯絡人的姓氏為'陳'的聯絡人顯示出來 (10)
- 隨堂練習5:請將隨堂練習4的結果放到新增資料表[詳細借用記錄]中 (10)
 
### 2. 修改資料表(update)
- 隨堂練習6 圖書館員發現之前經理借的所有書籍都少紀錄一本，請將結果更新至[圖書室借用記錄] (10)
- 隨堂練習7 請刪除[應徵者]未繳交自傳的資料 (10)
 
### 綜合練習
- 隨堂練習8 (30)
 - 1. 經理借了書籍中所有人沒有借過的書，請將記錄此資訊新增至[圖書室借用記錄]
 - 2. 將更動的紀錄的所有欄位記錄在一個新增暫存資料表 */
 
use master;
DROP DATABASE HW_2

 --附加資料庫
USE master;
IF DB_ID ( 'HW_2' ) IS NOT NULL
	DROP DATABASE HW_2
GO
CREATE DATABASE HW_2
ON PRIMARY
(
	NAME = 'HOMEWORK2_Primary',
	FILENAME='C:\Data_Program\SQL\DBMS\作業二\record練習08.mdf'
)
FOR ATTACH
GO
/*
### 1. 新增資料表(insert)
- 隨堂練習1:請將[出貨記錄].[編號]IDENTITY關閉，並手動新增一筆資料 (10)
- 隨堂練習2:請新增[員工]中，職位為 "辦事員"的資料至[圖書室借用記錄] (10)
- 隨堂練習3:請將SQL中定義的資料型態int, smallint, char, vchar的TYPE_NAME, PRECISION, DATA_TYPE的資訊放到自訂暫存資料表，並顯示結果 (10)
  -- 提示1：使用　sp_datatype_info
  -- 提示2：自訂暫存表的資料型態需與sp_datatype_info查詢結果的欄位資料型態相符
- 隨堂練習4:顯示[出貨記錄]與[客戶]資料表中所有的資料表，顯示不能重複欄位，將聯絡人的姓氏為'陳'的聯絡人顯示出來 (10)
- 隨堂練習5:請將隨堂練習4的結果放到新增資料表[詳細借用記錄]中 (10)
*/

USE HW_2;

-- 隨堂練習1:請將[出貨記錄].[編號]IDENTITY關閉，並手動新增一筆資料 (10)
SELECT * FROM 出貨記錄

SET IDENTITY_INSERT 出貨記錄 ON

INSERT INTO 出貨記錄
	(編號, 日期, 客戶名稱, 書名, 數量)
VALUES
	(9, GETDATE(), '咖咖書局', '我今天很開心99', 11)

SET IDENTITY_INSERT 出貨記錄 OFF
SELECT * FROM 出貨記錄

-- 隨堂練習2:請新增[員工]中，職位為 "辦事員"的資料至[圖書室借用記錄] (10)
SET IDENTITY_INSERT 圖書室借用記錄 OFF

SELECT * FROM 員工
SELECT * FROM 圖書室借用記錄

INSERT INTO 圖書室借用記錄
			(員工編號, 書名)
SELECT A.編號, B.書名
FROM 員工 AS A, 圖書室借用記錄 AS B
WHERE A.編號 = B.員工編號 AND A.職位 = '辦事員'


SELECT * FROM 員工
SELECT * FROM 圖書室借用記錄

-- 隨堂練習3:請將SQL中定義的資料型態int, smallint, char, vchar的TYPE_NAME, PRECISION, DATA_TYPE的資訊放到自訂暫存資料表，並顯示結果 (10)
  -- 提示1：使用　sp_datatype_info
  -- 提示2：自訂暫存表的資料型態需與sp_datatype_info查詢結果的欄位資料型態相符
EXEC sp_datatype_info

CREATE TABLE #TEMP
(
    TYPE_NAME nvarchar(24) ,
	DATA_TYPE smallint,
    PRECISION int ,
    LITERAL_PREFIX varchar(24),
	 LITERAL_SUFFIX varchar(24),
	 CREATE_PARAMS varchar(24),
	 NULLABLE bit,
	 CASE_SENSITIVE bit,
	 SEARCHABLE smallint,
	 UNSIGNED_ATTRIBUTE bit,
	 MONEY bit,
	 AUTO_INCREMENT bit,
	 LOCAL_TYPE_NAME nvarchar(24) ,
	 MINIMUM_SCALE smallint,
	 MAXIMUM_SCALE smallint,
	 SQL_DATA_TYPE smallint,
	 SQL_DATETIME_SUB smallint,
	 NUM_PREC_RADIX smallint,
	 INTERVAL_PRECISION smallint,
	 USERTYPE smallint
)
GO

INSERT #TEMP
EXEC sp_datatype_info

SELECT * FROM #TEMP

CREATE TABLE #DATATYPEDB
(
	TYPE_NAME nvarchar(24) ,
	PRECISION int ,
	DATA_TYPE smallint,
)

INSERT #DATATYPEDB
SELECT TYPE_NAME, PRECISION, DATA_TYPE
FROM #TEMP
WHERE TYPE_NAME='int' OR TYPE_NAME='smallint' OR TYPE_NAME='char' OR TYPE_NAME='varchar'

SELECT * FROM #DATATYPEDB

-- 隨堂練習4:顯示[出貨記錄]與[客戶]資料表中所有的資料表，顯示不能重複欄位，將聯絡人的姓氏為'陳'的聯絡人顯示出來 (10)
-- WHERE條件中的LIKE語法 
SELECT  客戶.客戶編號, 客戶.客戶名稱, 客戶.聯絡人, 客戶.地址, 客戶.電話, 出貨記錄.編號
AS 訂單編號, 出貨記錄.日期, 出貨記錄.書名, 出貨記錄.數量
FROM 客戶 
LEFT JOIN 出貨記錄
ON 客戶.客戶名稱 = 出貨記錄.客戶名稱
WHERE 客戶.聯絡人 LIKE ('陳%')

--DROP TABLE 詳細借用記錄
-- 隨堂練習5:請將隨堂練習4的結果放到新增資料表[詳細借用記錄]中 (10)
CREATE TABLE 詳細借用記錄
(
	 客戶編號 int,
	 客戶名稱 varchar(20),
	 聯絡人 varchar(20),
	 地址 nvarchar(50),
	 電話 int,
	 訂單編號 int,
	 日期 datetime,
	 書名 varchar(20),
	 數量 int
)
SELECT * FROM 詳細借用記錄

INSERT 詳細借用記錄
SELECT 客戶.客戶編號, 客戶.客戶名稱, 客戶.聯絡人, 客戶.地址, 客戶.電話, 出貨記錄.編號
AS 訂單編號,出貨記錄.日期,出貨記錄.書名,出貨記錄.數量
FROM 客戶 
LEFT JOIN 出貨記錄
on 客戶.客戶名稱 = 出貨記錄.客戶名稱
WHERE 客戶.聯絡人 LIKE ('陳%')

SELECT * FROM 詳細借用記錄


-----------------------------------------
/*
### 2. 修改資料表(update)
- 隨堂練習6 圖書館員發現之前經理借的所有書籍都少紀錄一本，請將結果更新至[圖書室借用記錄] (10)
- 隨堂練習7 請刪除[應徵者]未繳交自傳的資料 (10)
*/

--隨堂練習6 圖書館員發現之前經理借的所有書籍都少紀錄一本，請將結果更新至[圖書室借用記錄]
SELECT* FROM 員工
SELECT* FROM 圖書室借用記錄

UPDATE  圖書室借用記錄
SET     數量 = 數量 + 1 ,
        附註 = '經理借的書籍少紀錄'
WHERE   員工編號 = 2

SELECT* FROM 圖書室借用記錄

-- 隨堂練習7 請刪除[應徵者]未繳交自傳的資料 (10)
SELECT * FROM 應徵者

DELETE 應徵者
WHERE 自傳 IS NULL

SELECT * FROM 應徵者

----------------------------------------
-- ### 隨堂練習8 綜合練習 
-- 1. 經理借了書籍中所有人沒有借過的書，請將記錄此資訊新增至[圖書室借用記錄]
-- 2. 將更動的紀錄的所有欄位記錄在一個新增暫存資料表
SELECT * FROM 圖書室借用記錄
SELECT * FROM 書籍

SELECT DISTINCT 書名
FROM 圖書室借用記錄 AS A
JOIN 書籍 AS B on (A.書名 != B.書籍名稱)
WHERE B.書籍名稱 NOT IN(SELECT 書名 FROM 圖書室借用記錄)

CREATE TABLE #BOOK
(
編號 int,
員工編號 int,
書名 varchar(20),
數量 int,
歸還日期 datetime,
附註 varchar(50)
)
SELECT* FROM #BOOK

INSERT 圖書室借用記錄(員工編號, 書名)
output inserted.員工編號, inserted.書名 into #BOOK(員工編號,書名)
SELECT DISTINCT '2',書名
FROM 圖書室借用記錄 AS A
JOIN 書籍 AS B on (A.書名 != B.書籍名稱)
WHERE B.書籍名稱 NOT IN(SELECT 書名 FROM 圖書室借用記錄)



/*UPDATE 圖書室借用記錄
SET     附註 = '經理借了所有人沒有借過的書'
WHERE   員工編號 = 2

SELECT* FROM 圖書室借用記錄

--DROP TABLE #BOOK
CREATE TABLE #BOOK
(
編號 int,
員工編號 int,
書名 varchar(20),
數量 int,
歸還日期 datetime,
附註 varchar(50)
)
SELECT* FROM #BOOK

UPDATE 圖書室借用記錄
SET 員工編號 = '2'
OUTPUT INSERTED.編號, INSERTED.員工編號, INSERTED.書名,
	   INSERTED.數量, INSERTED.歸還日期, INSERTED.附註 
INTO #BOOK (編號, 員工編號, 書名, 數量 ,歸還日期, 附註)
WHERE 員工編號 = '2'

SELECT* FROM #BOOK*/
