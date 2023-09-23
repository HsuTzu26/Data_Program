DROP DATABASE HW2
CREATE DATABASE HW2
ON PRIMARY
(
 name='WH2',
 filename='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\練習08.mdf'
)
FOR ATTACH
GO

USE HW2
--DELETE FROM 出貨記錄 WHERE 編號=0;
-- 隨堂練習1:請將[出貨記錄].[編號]IDENTITY關閉，並手動新增一筆資料
-- IDENTITY_INSERT ON
SET IDENTITY_INSERT 出貨記錄 ON
INSERT 出貨記錄 ( 編號,日期,客戶名稱,書名,數量)
VALUES ( 0, GETDATE(), '天天書局','Windows網路',10)

-- IDENTITY_INSERT OFF
SET IDENTITY_INSERT 出貨記錄 OFF
SELECT *
FROM 出貨記錄

USE HW2
--隨堂練習2:請新增[員工]中，職位為 "辦事員"的資料至[圖書室借用記錄] 
INSERT 圖書室借用記錄(員工編號,書名)
SELECT 員工.編號,'Word使用手冊'
FROM   員工
WHERE  職位 = '辦事員';

-- 隨堂練習3:請將SQL中定義的資料型態int, smallint, char, vchar的TYPE_NAME, PRECISION, DATA_TYPE的資訊放到自訂暫存資料表，並顯示結果 (10)
  -- 提示1：使用　sp_datatype_info
  -- 提示2：自訂暫存表的資料型態需與sp_datatype_info查詢結果的欄位資料型態相符
  EXEC sp_datatype_info
--DROP TABLE #temp
CREATE TABLE #temp
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
go

INSERT  #temp
EXEC sp_datatype_info

CREATE TABLE #DATATYPEDB
(
	TYPE_NAME nvarchar(24) ,
 PRECISION int ,
 DATA_TYPE smallint,
)

--DROP TABLE #DATATYPEDB
INSERT #DATATYPEDB
SELECT TYPE_NAME,PRECISION ,DATA_TYPE
FROM #temp
WHERE TYPE_NAME='int' or TYPE_NAME='smallint' or TYPE_NAME='char' or TYPE_NAME='varchar'

USE HW2
--隨堂練習4:顯示[出貨記錄]與[客戶]資料表中所有的資料表，顯示不能重複欄位，將聯絡人的姓氏為'陳'的聯絡人顯示出來 (10)
-- 提示：WHERE條件中的LIKE語法 
SELECT  客戶.客戶編號,客戶.客戶名稱,客戶.聯絡人,客戶.地址,客戶.電話,出貨記錄.編號
as 訂單編號,出貨記錄.日期,出貨記錄.書名,出貨記錄.數量
FROM 客戶 
LEFT JOIN 出貨記錄
on 客戶.客戶名稱 = 出貨記錄.客戶名稱
WHERE 客戶.聯絡人 LIKE ('陳%')

USE HW2
--DROP TABLE 詳細借用記錄
--隨堂練習5:請將隨堂練習4的結果放到新增資料表[詳細借用記錄]中
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
SELECT 客戶.客戶編號,客戶.客戶名稱,客戶.聯絡人,客戶.地址,客戶.電話,出貨記錄.編號
as 訂單編號,出貨記錄.日期,出貨記錄.書名,出貨記錄.數量
FROM 客戶 
LEFT JOIN 出貨記錄
on 客戶.客戶名稱 = 出貨記錄.客戶名稱
WHERE 客戶.聯絡人 LIKE ('陳%')

SELECT * FROM 詳細借用記錄


--隨堂練習6 圖書館員發現之前經理借的所有書籍都少紀錄一本，請將結果更新至[圖書室借用記錄]
SELECT* FROM 員工
SELECT* FROM 圖書室借用記錄

UPDATE  圖書室借用記錄
SET     數量 = 數量 + 1 ,
        附註 = '經理借的書籍少紀錄'
WHERE   員工編號 = 2

SELECT* FROM 圖書室借用記錄
-----------------------------------------
-- 6.2 引用其他資料表的值來更新
UPDATE  圖書室借用記錄
SET     附註 = '借書人為' + 員工.姓名   
FROM    員工                            
WHERE   圖書室借用記錄.員工編號 = 員工.編號


/****** 練習7 (P8-23-25) - 刪除紀錄 - DELETE, TRUNCATE  ******/
-- 7.1 刪除指定條件
DELETE 圖書室借用記錄
WHERE  書名 = 'Word 手冊'

SELECT * FROM 圖書室借用記錄

-- 7.1 刪除指定其他資料表條件
DELETE  圖書室借用記錄
FROM    員工
WHERE   圖書室借用記錄.員工編號 = 員工.編號　AND 員工.姓名 = '楊咩咩'

SELECT * 
FROM 圖書室借用記錄
---------------------
SELECT * FROM 應徵者

DELETE 應徵者
WHERE 自傳 IS NULL

SELECT * FROM 應徵者


-- ### 隨堂練習7 請刪除[應徵者]未繳交自傳的資料

/****** 練習8 (P8-23-25) - 輸出更動的資料 - OUTPUT  ******/
-- 8.1 將新增資料的結果使用OUTPUT顯示(INSERTED)
INSERT 圖書室借用記錄 ( 員工編號, 書名 )
OUTPUT INSERTED.*
VALUES ( '12', 'SQL 語法辭典' ),
       ( '25', 'Windows 使用手冊' ),
       ( '13', 'Linux 架站實務'),
       ( '12', 'VB 程式設計')

GO

-- 8.2 將更新資料的結果使用OUTPUT顯示(DELETED, INSERTED) - 比較更新前後的數值
UPDATE 圖書室借用記錄 
SET 書名 = 'C# 程式設計'
OUTPUT DELETED.編號, DELETED.書名 舊書名, INSERTED.書名 新書名
WHERE 編號 = 5

-- 8.3 將刪除資料的結果使用OUTPUT顯示(DELETED)
DELETE 圖書室借用記錄
OUTPUT DELETED.*
WHERE 編號 = 3

GO

-- 8.4 將更動的資料輸出至其他資料表或Table變數
CREATE TABLE #OUTPUT_TB
   ( 編號  int IDENTITY,
     員工編號 int, 
     書名  nvarchar(16)
   )
GO

UPDATE 圖書室借用記錄
SET 員工編號 = '57'
OUTPUT INSERTED.編號, INSERTED.員工編號, INSERTED.書名 INTO #OUTPUT_TB (編號, 員工編號, 書名)
WHERE 員工編號 = '12'

SELECT * FROM #OUTPUT_TB

----------------------------------
SELECT* FROM 圖書室借用記錄

UPDATE 圖書室借用記錄
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
OUTPUT INSERTED.編號, INSERTED.員工編號, INSERTED.書名, INSERTED.數量, INSERTED.歸還日期, INSERTED.附註 INTO #BOOK (編號, 員工編號, 書名, 數量 ,歸還日期, 附註)
WHERE 員工編號 = '2'

SELECT* FROM #BOOK

-- ### 隨堂練習8 綜合練習 
-- 1. 經理借了書籍中所有人沒有借過的書，請將記錄此資訊新增至[圖書室借用記錄]
-- 2. 將更動的紀錄的所有欄位記錄在一個新增暫存資料表
