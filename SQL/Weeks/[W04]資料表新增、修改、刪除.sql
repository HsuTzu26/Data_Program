/*****練習1 (P8-14 ) - IDENTITY切換 ******/
-- 1.1 IDENTITY
-- 查看[圖書室借用記錄]Table
-- 1.2 IDENTITY_INSERT ON
use HW_2
SET IDENTITY_INSERT 圖書室借用記錄 ON
INSERT 圖書室借用記錄 ( 編號, 員工編號, 書名 )
VALUES ( 0, 5, 'Word 手冊')
-- 3. IDENTITY_INSERT OFF
SET IDENTITY_INSERT 圖書室借用記錄 OFF
SELECT *
FROM 圖書室借用記錄
-- ### 隨堂練習1:請將[出貨記錄].[編號]IDENTITY關閉，並手動新增一筆資料
/****** 練習2 (P8-16) - 從TABLE A取出資料後放入TABLE B  ******/
-- 2.1 查看[書籍]Table
SELECT *
FROM 書籍
-- 2.2 將[書籍]的指定資料，新增至[圖書室借用記錄]
INSERT  圖書室借用記錄 ( 員工編號, 書名 )
SELECT 3, 書籍名稱
FROM   書籍
WHERE  書籍編號 < 4
SELECT *
FROM 圖書室借用記錄
-- 2.3 [問題]請列出　所有[書籍].[書籍編號]<4的書分配給[員工]Table中職務為＝主任的清單
SELECT *
FROM 員工
SELECT 書籍名稱
FROM 書籍
-- 答案
SELECT B.編號, A.書籍名稱
FROM   書籍 AS A, 員工 AS B
WHERE  B.職位 ='主任' AND A.書籍編號 < 4
-- ### 隨堂練習2:請新增[員工]中，職位為 "辦事員"的資料至[圖書室借用記錄]
/****** 練習3 (P8-16) - 將EXEC執行的結果存入暫存資料表  ******/
--3.1 執行sp_helpdb並將結果儲存至暫存資料表#HELPDB
EXEC sp_helpdb
CREATE TABLE #HELPDB
(
    名稱 nvarchar(24) ,
    空間大小 nvarchar(13) ,
    擁有者 varchar(24) ,
    DBID smallint ,
    建立日期 smalldatetime ,
    狀態 text ,
    相容性層級 tinyint
)
INSERT #HELPDB
EXEC sp_helpdb
SELECT *
FROM #HELPDB
-- ### 隨堂練習3:請將SQL中定義的資料型態int, smallint, char, vchar
-- ### 的TYPE_NAME, PRECISION, DATA_TYPE的資訊放到自訂暫存資料表，並顯示結果
-- 提示1：使用　sp_datatype_info
-- 提示2：自訂暫存表的資料型態需與sp_datatype_info查詢結果的欄位資料型態相符
/****** 練習4 (P8-18~21) - WHERE查詢條件  ******/
-- 4.1　單一欄位查詢條件
SELECT  書名, 數量, 歸還日期, 電話
FROM    圖書室借用記錄, 員工
WHERE   姓名 = '劉天王' －－AND 圖書室借用記錄.員工編號 = 員工.編號
GO
-- 4.2　多個欄位與與多個資料表查詢條件AND, OR
SELECT  書名, 數量, 歸還日期, 電話 AS 借用者電話
FROM    圖書室借用記錄 AS A, 員工 AS B
WHERE   姓名 = '劉天王' AND A.員工編號 = B.編號
-- 4.3　查詢條件符合多個資料表
SELECT 姓名 AS 借閱者, 書名, 數量 AS 本數
INTO   借閱清單
FROM   圖書室借用記錄, 員工
WHERE  圖書室借用記錄.員工編號 = 員工.編號
SELECT *
FROM 借閱清單
-- ### 隨堂練習4　顯示[出貨記錄]與[客戶]資料表中所有的欄位，顯示不能重複欄位
--               將聯絡人的姓氏為'陳'的聯絡人顯示出來
-- 提示：WHERE條件中的LIKE語法
/****** 練習5 (P8-22-24) - 查詢結果建立新資料表(SELECT INTO)  ******/
-- 5.1 新增一個[聯絡名冊]，並將[員工]的所有資料複製過去
SELECT * INTO  聯絡名冊
FROM 員工
WHERE  1 = 0
-- 將WHERE條件設定為false
SELECT *
FROM 員工
GO
--用來區分兩段程式
SELECT *
FROM 聯絡名冊
-- 5.2 新增一個[聯絡名冊]，並將[員工]職位為'辦事員'的所有資料複製過去
SELECT * INTO  聯絡名冊
FROM  員工
WHERE 職位='辦事員'
-- ### 隨堂練習5 請將隨堂練習4的結果放到新增資料表[詳細記錄]中
/****** 練習6 (P8-23-25) - 更新資料表- update  ******/
-- 6.1 更新指定條件的資料
SELECT *
FROM 圖書室借用記錄
GO
UPDATE  圖書室借用記錄
SET     員工編號 = 6 ,　附註 = NULL
WHERE   員工編號 = 3
SELECT *
FROM 圖書室借用記錄
GO
-- 6.2 更新指定條件的資料-2
UPDATE  圖書室借用記錄
SET     數量 = 數量 + 5 ,
        附註 = '業務人員借閱'
WHERE   員工編號 = 6
-- 6.2 引用其他資料表的值來更新
UPDATE  圖書室借用記錄
SET     附註 = '借書人為' + 員工.姓名   
FROM    員工                            
WHERE   圖書室借用記錄.員工編號 = 員工.編號
-- ### 隨堂練習6 圖書館員發現之前經理借的所有書籍都少紀錄一本，請將結果更新至[圖書室借用記錄]
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
-- ### 隨堂練習8 綜合練習
-- 1. 經理借了書籍中所有人沒有借過的書，請將記錄此資訊新增至[圖書室借用記錄]
-- 2. 將更動的紀錄的所有欄位記錄在一個新增暫存資料表