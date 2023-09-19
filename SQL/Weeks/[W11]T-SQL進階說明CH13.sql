USE 練習13
GO 

-- P13-10
-- Table型別的變數
DECLARE @mybook TABLE ( 書籍編號 int PRIMARY KEY, 書籍名稱 varchar(50) )

INSERT @mybook
SELECT 書籍編號, 書籍名稱
FROM 書籍
WHERE 單價 >= 460

UPDATE @mybook
SET 書籍名稱 += '(附CD)'

DELETE @mybook
WHERE 書籍編號 = 7

SELECT * FROM @mybook

-- 必須使用資料表別名來指示欄位
DECLARE @mybook TABLE ( 書籍編號 int PRIMARY KEY, 書籍名稱 varchar(50) )

INSERT @mybook
SELECT 書籍編號, 書籍名稱
FROM 書籍
WHERE 單價 >= 400

PRINT @@ROWCOUNT

--SELECT * FROM @mybook
--SELECT * FROM 書籍

-- 必須使用資料表別名來指示欄位
--SELECT m.書籍編號, m.書籍名稱, 單價 
--FROM @mybook m JOIN 書籍 
 --    ON m.書籍編號 = 書籍.書籍編號
--GO

--table變數可用在 SELECT、INSERT、UPDATE、DELETE，
SELECT 書籍編號, 書籍名稱
INTO @mybook             -- 語法錯誤！不可用在 INTO 中
FROM 書籍

GO

-- SQL中的條件判斷與流程控制
/** (1) IF...ELSE
 ** (2) BEGIN...END
 ** (3) WHILE
 ** (4) CASE-->搭配WHEN...THEN
 ** (5) GOTO
 **/

/* (2) IF...ELSE語法*/
-- P13-13a

IF (SELECT SUM(價格) FROM 標標公司) > 1500 
   PRINT '標標公司共有資產大於 1100 元' 
ELSE 
   PRINT '標標公司共有資產小於 1100 元' 
GO

-- P13-13b
DECLARE @avg_price int 
SET @avg_price = (SELECT AVG(單價) FROM 書籍) 
IF @avg_price > 600 
   PRINT '書籍平均價格太高' 
ELSE 
   IF @avg_price > 400  -- 在 ELSE 中的 IF...ELSE 
      PRINT '書籍平均價格適中' 
   ELSE 
      PRINT '書籍平均價格太低' 
GO
-- P13-14a
IF 'Linux 使用手冊' IN (SELECT 書籍名稱 FROM 書籍) 
   PRINT '有Linux 使用手冊' 
ELSE 
   PRINT '無Linux 使用手冊'
GO

-- P13-14b
IF 1000 > ALL (SELECT 單價 FROM 書籍) 
   PRINT '沒有任何書籍超過 1000 元' 
GO

-- P13-15a
IF (SELECT 書籍名稱 FROM 書籍 WHERE 書籍編號 = '1001') IS NULL 
   PRINT '1001 的名稱未輸入' 
ELSE 
   PRINT '1001 的名稱已輸入' 
GO

-- P13-15b
IF EXISTS (SELECT * FROM 書籍) 
   PRINT '1001 的名稱已輸入' 
ELSE 
   PRINT '1001 的名稱未輸入'
GO

-- @@ROWCOUNT用法
SELECT * FROM 書籍
WHERE 單價 > 400
/*
-- 解釋@@ROWCOUNT
UPDATE 書籍
SET 單價=單價-10
WHERE 單價 > 400
PRINT @@ROWCOUNT

SELECT * FROM 書籍
*/

/* (3) WHILE語法  */
-- P13-16

DECLARE @id int, @name varchar(50), @price int, @count int 
SET @id = 0 
SET @count = 1

WHILE @id < 500 
   BEGIN 
      SET @id = @id + 1 
      SELECT @name = 書籍名稱, @price = 單價
         FROM 書籍 WHERE 書籍編號 = @id
      IF @@ROWCOUNT = 0 /* @@ ROWCOUNT 中會儲存著 */
         BEGIN          /* SELECT 傳回的記錄筆數 */
             PRINT '*** The End ***'
             BREAK 
         END 
      IF @price >= 400 CONTINUE
      PRINT CAST(@price AS CHAR(4)) + ' -- ' +@name
      IF @count % 3 = 0 PRINT '......'
      SET @count = @count + 1
   END
GO

/* (4) CASE語法  */ 
-- P13-18
DECLARE @a INT, @answer CHAR(10) 
SET @a = 1 
SET @answer = CASE @a 
   WHEN 1 THEN 'A' 
   WHEN 2 THEN 'B' 
   WHEN 3 THEN 'C' 
   WHEN 4 THEN 'D' 
   ELSE 'OTHERS' 
END 
PRINT 'IS ' + @answer 
GO

-- P13-19
SELECT '<' + 
             CASE RIGHT(書籍名稱, 2)   
                WHEN '手冊' THEN '1入門' 
                WHEN '實務' THEN '2實例' 
                WHEN '應用' THEN '3技巧' 
                WHEN '秘笈' THEN '4技術' 
                ELSE '5未分' 
             END + '類>' AS 類別 
            , 書籍名稱 
FROM 書籍 
ORDER BY 類別 

GO
/* (5) GOTO語法  */
-- P13-21 -- GOTO
DECLARE @number smallint 
SET @number = 99 
IF (@number % 3) = 0 
   GOTO Three 
ELSE 
   GOTO NotThree 
Three: 
   PRINT '三的倍數' 
   GOTO TheEnd 
NotThree: 
   PRINT '不是三的倍數' 
TheEnd: 

GO

/** 特殊程式控制
 ** (1) WAITFOR ---wait for 等待某個時間後再執行 (延後執行的概念)
  *    - 語法結構: 
            WAITFOR {DELAY | TIME} 'time'
 ** (2) RETURN (用於Stored Procedure與FUNCTION)
 **/
-- P13-22
DECLARE @count INT 
SET @count = 0 
WHILE @count < 5  /* 此迴圈最多做 5 次 */
  BEGIN 
	INSERT 員工記錄 (異動日期, 員工編號, 薪資) 
	VALUES ('2012/10/6', 15, 30000) 
	IF @@error = 0 BREAK  /* 如果成功即跳出迴圈 */
	SET @count = @count + 1 
	WAITFOR DELAY '00:00:05'  /* 等待 5 秒 */
  END 
GO

--P13-23a
WAITFOR TIME '12:39'
SELECT * INTO 訂單備份 
FROM 訂單 

GO

/* 錯誤處理
 * (1) RAISERROR 
 *  - 訊息編號需大於50000
 *  - 要先建立英文版本，才能在建立其他語言版本
 *  - 錯誤訊息放在view sys.message裡面
 */
-- P13-27
/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT * FROM sys.messages WHERE message_id=66666
DELETE FROM sys.messages WHERE message_id=66666
EXEC sp_dropmessage 66666
EXEC sp_dropmessage @msgnum = 66666, @lang = 'all'; 

EXEC sp_addmessage  66666, 7, 'Monsters!', @lang = 'us_english'
GO
EXEC sp_addmessage 66666, 7, '有怪獸!有怪獸!', @lang = '繁體中文'
GO
RAISERROR (66666, 7, 1)

GO
-- P13-28a
RAISERROR ('失敗為成功之母', 9, 1)
GO

/*  severity: LOG的等級
 *   - 0-9: 顯示狀態資訊或不嚴重的錯誤訊息
 *   - 10: 使用者輸入的資訊有問題或不正確
 *   - 11-16: 用使用者操作上的錯誤
 *   - 17-25: 有軟體或硬體上的錯誤 (17以上要通知系統管理員
 *   - >19: 要具備sysadmin權限才能使用，且須搭配WITH LOG選項
 * state: 代表錯誤的狀態，0~255，可由使用者自訂
 */
-- P13-28b
RAISERROR ('發生嚴重錯誤！', 20, 1) WITH LOG 

GO
-- P13-29a

RAISERROR ('此訊息由 RAISERROR 產生', 0, 1)
PRINT '此訊息由 PRINT 產生'

GO
-- P13-29b

SELECT '此訊息由 SELECT 產生'

GO

-- P13-30
BEGIN TRANSACTION
INSERT 旗旗公司 (產品名稱, 價格)
  VALUES ('PHP程式語言', 500)

UPDATE 訂單
  SET    是否付款 = 1
  WHERE  訂單序號 = 3

IF @@ERROR !=0 OR @@ROWCOUNT = 0
   ROLLBACK TRANSACTION
ELSE
   COMMIT TRANSACTION

GO


/**************************************/
/* TRY-...CATCH 
 * 語法: 
 * BEGIN TRY
 *   sql_statement
 * END TRY
 *
 * BEGIN CATCH
 *   sql_statement
 * END CATCH
 */
-- P13-32
BEGIN TRY
    RAISERROR (66666, 10, 1) WITH LOG  
    PRINT '沒有發生重大錯誤'                   
END TRY                                        
BEGIN CATCH  
    IF ERROR_SEVERITY() > 16   
      PRINT '發生嚴重錯誤！請通知管理員, 錯誤編號為:' + 
			CAST(ERROR_NUMBER() AS CHAR)
    ELSE 
	  PRINT '發生錯誤！錯誤訊息為:' + ERROR_MESSAGE()
END CATCH

GO

/* TRY-...CATCH 無法處理的錯誤 */
-- P13-33
BEGIN TRY
    SELECT * FROM 資料表ABC
END TRY
BEGIN CATCH
    PRINT 'TRY…CATCH 發現一個錯誤：' + ERROR_MESSAGE()
END CATCH

GO

/* TRY-...CATCH 無法處理的錯誤的解決方法 --例如:在SP發生錯誤 */
-- P13-34
CREATE PROCEDURE testTRYCATCHProc
AS
    SELECT * FROM 資料表ABC
GO

BEGIN TRY
    EXECUTE testTRYCATCHProc 
END TRY                          
BEGIN CATCH
    PRINT 'TRY…CATCH 發現一個錯誤：' + ERROR_MESSAGE()
END CATCH

GO

-- P13-36a
THROW 51000, '這是由 THROW 產生的自訂錯誤.', 1
GO

-- P13-36b
BEGIN TRY
	THROW 51000, '這是由 THROW 產生的自訂錯誤.', 1
END TRY                                        
BEGIN CATCH  
    PRINT '●進入 CATCH 區塊';
	THROW
    PRINT '●正常結束 CATCH 區塊'
END CATCH
PRINT '●批次結束'

GO

-- P13-37
-- 建立可傳回訂單筆數的預存程序
CREATE PROCEDURE CountOrder 
AS
    DECLARE @cnt INT
	SELECT @cnt = COUNT(*) FROM 訂單		
    RETURN @cnt   -- 傳回訂單筆數      
GO

-- P13-38
DECLARE @value int, @msg varchar(30)
SET @msg = '訂單筆數為：'

EXEC @value = CountOrder       /* 執行預存程序 */
IF @value > 0
	SET @msg += CAST(@value AS varchar)
ELSE
	SET @msg += '沒有訂單'
PRINT @msg 
GO

-- P13-46
CREATE VIEW 下單記錄_VIEW  
AS 
SELECT  日期, 客戶名稱, 地址
FROM    訂單, 客戶
WHERE   訂單.客戶編號 = 客戶.客戶編號
GO

SELECT * FROM 下單記錄_VIEW

GO

-- P13-47
WITH 下單記錄_CTE         
AS (
   SELECT  日期, 客戶名稱, 地址
   FROM    訂單, 客戶
   WHERE   訂單.客戶編號 = 客戶.客戶編號
)

SELECT * FROM 下單記錄_CTE

GO

-- P13-50
WITH 員工階層_CTE (員工編號, 姓名, 主管員工編號, level, sort)
AS (                                            
    /* 錨點成員先找出第 1 層的主管 */
    SELECT 員工編號, 
           姓名, 
           主管員工編號, 
           1,  
           CONVERT(varchar(255), 姓名)  
    FROM 員工                            
    WHERE 主管員工編號 = 0 

    UNION ALL

    /* 遞迴成員接著以自我呼叫的方式, 找出各主管的員工 */
    SELECT 員工.員工編號,
           員工.姓名,
           員工.主管員工編號,
           level+1, 
           CONVERT (varchar(255), sort + '-' + 員工.姓名)  
    FROM 員工
    JOIN 員工階層_CTE ON 員工.主管員工編號 = 員工階層_CTE.員工編號
                         
)

SELECT '|' + REPLICATE('-', level*2) + 姓名 AS 員工層級, 員工編號, 主管員工編號, level, sort
FROM 員工階層_CTE
ORDER BY sort

GO
●● -- P13-51

SELECT 員工編號, 姓名, 主管員工編號, 1, CONVERT(varchar(255), 姓名)
FROM 員工
WHERE 主管員工編號 = 0

GO
●● -- P13-55

SELECT * FROM 部門 

MERGE 部門 t             -- 目的資料表 (要被更新的資料表)
USING 部門草案 s         -- 來源資料
ON t.ID = s.ID           -- 指定二個資料表的撮合 (JOIN) 條件
WHEN MATCHED AND t.主管 <> s.主管 THEN  -- 條件符合且主管不同時, 就修改主管
     UPDATE 
     SET t.主管 = s.主管
WHEN NOT MATCHED BY TARGET THEN  -- 不在目的資料中的(但在來源資料中), 就新增
     INSERT (ID, 部門名稱, 主管)
     VALUES (s.ID, s.部門名稱, s.主管)
WHEN NOT MATCHED BY SOURCE THEN  -- 不在來源資料中的(但在目的資料中), 就刪除
     DELETE
OUTPUT $action, 
	deleted.ID, deleted.部門名稱, deleted.主管,
	inserted.ID, inserted.部門名稱, inserted.主管;

SELECT * FROM 部門

GO
●● -- P13-56

MERGE 股票庫存 t
USING (SELECT * FROM 股票交易記錄 WHERE 已處理 = 0) s
ON t.股票名稱 = s.股票名稱
WHEN MATCHED AND t.張數 + s.購買張數 = 0 THEN
	DELETE
WHEN MATCHED THEN
	UPDATE SET t.張數 = t.張數 + s.購買張數
WHEN NOT MATCHED THEN
	INSERT (股票名稱, 張數)
	VALUES (s.股票名稱, s.購買張數)
OUTPUT $action, 
	deleted.股票名稱, deleted.張數,
	inserted.股票名稱, inserted.張數;

SELECT * FROM 股票庫存

GO
●● -- P13-57

MERGE 股票庫存 t
USING (	SELECT 股票名稱, SUM(購買張數) AS 購買張數
		FROM 股票交易記錄 
		WHERE 已處理 = 0
		GROUP BY 股票名稱) s
ON t.股票名稱 = s.股票名稱
WHEN MATCHED AND t.張數 + s.購買張數 = 0 THEN
	DELETE
WHEN MATCHED THEN
	UPDATE SET t.張數 = t.張數 + s.購買張數
WHEN NOT MATCHED THEN
	INSERT (股票名稱, 張數)
	VALUES (s.股票名稱, s.購買張數)
OUTPUT $action, 
	deleted.股票名稱, deleted.張數,
	inserted.股票名稱, inserted.張數;


GO
●● -- P13-58

-- 本批次用於練習儲存為：顯示分類書單.sql
SELECT '<' + 
             CASE RIGHT(書籍名稱, 2)   
                WHEN '手冊' THEN '1入門' 
                WHEN '實務' THEN '2實例' 
                WHEN '應用' THEN '3技巧' 
                WHEN '秘笈' THEN '4技術' 
                ELSE '5未分' 
             END + '類>' AS 類別 
            , 書籍名稱 
FROM 書籍 
ORDER BY 類別 

GO
