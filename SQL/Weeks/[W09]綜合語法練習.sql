USE master
IF DB_ID ( 'Ex3' ) IS NOT NULL
  DROP DATABASE Ex3;
GO
CREATE DATABASE Ex3
GO
USE Ex3;

/* - 1. 主題1: 設計一個自動產生交易紀錄ID的功能, 規則說明如下:
   - 1.1 每筆交易紀錄的[交易ID]前8碼為以系統日期命名，後6碼為交易紀錄序號，格式: 系統日期(8碼)_序號(6碼)。
   - 1.2 流水號由1開始編碼，流水號不足則左邊補0。
   - 1.3 參考範例: 20190507_000001
 */
DECLARE @TS varchar(8)		--系統日期(8碼)
DECLARE @No varchar(6)		--格式: 序號(6碼)
DECLARE @TranID varchar(15)	--格式: 系統日期(8碼)_序號(6碼)
DECLARE @LogCount int		--設定計數

SET @LogCount=000001
--PRINT @LogCount 

/*1. 轉換date --> yyyymmdd */
SET @TS=CONVERT(varchar, GETDATE(), 112)	--將date轉為varchar
--PRINT '日期(yyyymmdd)= ' + @TS

/* 2. 產生左方補0的序號 */
--PRINT REPLICATE('0', 6)					--(1)產生長度=6的字串(varchar)
--PRINT CAST(@LogCount as varchar)	    --(2)序號型態轉換 int-->varchar

/* 方法1: 使用直接填000000 */
SET @No = RIGHT('000000'+CAST(@LogCount as varchar),6)
/* 方法2: 使用REPLICATE */
/*SET @No = RIGHT(REPLICATE('0', 6) + CAST(@LogCount as varchar),6)
PRINT @No*/

/* 3. 產生系統日期(8碼)_序號(6碼) */
SET @TranID = @TS + '_' + @No
PRINT 'TranID= ' + @TranID

-----------------------------------------------------------------------------------------------------------------
/* 2. 主題2: 設計一個自動計算產生交易紀錄的資料表，記錄每日產生多少筆ID
      說明: 新增一個資料表LOG_SEQ，此資料表為記錄每天一共有多少筆log產生，以日期yyyymmdd作為primary key 
	  Schema規則如下 
*/
-- 建立紀錄號碼牌統計表格
CREATE TABLE LOG_SEQ(
  SDATE varchar(8) NOT NULL PRIMARY KEY, 	-- 當天的log紀錄
  LOG_COUNT varchar(6) NOT NULL 			-- 當天一共有多少筆log
) 

-- 建立交易紀錄表格
CREATE TABLE Trans (
	ID  char(15),		  /* 格式: 系統日期(8碼)_序號(6碼) */    
    TransDate   datetime
);
GO
/* 2.1 請撰寫SQL Script如果當天第一筆log產生時，且LOG_SEQ無資料時, 新增當天的紀錄，並給予初始化，SDATE數值指定為當天，且LOG_COUNT指定為0 (30)
   2.2 呈2.1, 若每新增一筆log時，LOG_COUNT自動加1 (10)
   提示: 2使用子查詢(Subquery)中的EXISTS語法 
 */

-- (1) 查詢LOG_SEG找出當天LOG_COUNTG值
SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = CONVERT(varchar, GETDATE(), 112)

-- (2) 如果已有值-->則LOG_COUNT+1，並Update LOG_COUNT； 
--     如果沒值-->表示今天還沒有交易紀錄產生---> Insert第一筆資料，LOG_COUNT=1

DECLARE @No varchar(6)		--格式: 序號(6碼)
DECLARE @TS varchar(8)		--格式: 系統日期(8碼)

--SET @TS = CONVERT(varchar, GETDATE(), 112)
SET @TS = '20220509' /* 手動輸入日期(測試用) */

SET @No=(SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS)

IF @No IS NULL	/* 如果沒值-->表示今天還沒有交易紀錄產生 */
	BEGIN
		SET @No = '000001'
		INSERT INTO LOG_SEQ VALUES(@TS ,'000001') /* Insert第一筆資料，LOG_COUNT=0 */
	END
ELSE			/* 如果已有值-->則LOG_COUNT+1，並Update LOG_COUNT； */
	BEGIN
		SET @No=RIGHT('000000'+ CAST( (CAST(@No as int) + 1) as varchar),6)
		UPDATE LOG_SEQ SET LOG_COUNT=@No WHERE SDATE = @TS	--更新LOG_COUNT		
	END

--SELECT * FROM LOG_SEQ

/* 產生TransID: 系統日期(8碼)_序號(6碼)*/
DECLARE @TranID varchar(15)		--格式: 系統日期(8碼)_序號(6碼)
SET @TranID = @TS + '_' + @No

--TRUNCATE TABLE LOG_SEQ
-----------------------------------------------------------------------------------------------
/* 3.主題3: 整合1與2語法，並且將SDATE以及LOG_COUNT的結果帶入新增[交易紀錄]語法(INSERT)中 */
INSERT INTO Trans VALUES(@TranID, GETDATE())
SELECT * FROM LOG_SEQ
SELECT * FROM Trans

-----------------------------------------------------------------------------------------------
/* 4. 請修改[個人資訊]資料表，並新增[個人密碼]欄位，使用變數宣告方式撰寫SQL Script輸入帳號與密碼，若帳密正確，顯示"密碼正確"；密碼錯誤顯示"密碼錯誤" (20)-*/ 
CREATE TABLE Customer (
    ID  char (10) PRIMARY KEY,
    PWD varbinary(500)	
);

CREATE TABLE CustomerWithPWDPlainText (
    ID  char (10) PRIMARY KEY,
    PWD varchar(100)	
);

INSERT INTO CustomerWithPWDPlainText
VALUES('cym','123');
SELECT * FROM CustomerWithPWDPlainText

/* 密碼保護 */
-- 方法1: 使用PWDENCRYPT加密
INSERT INTO Customer
VALUES('cy',PWDENCRYPT('123'));
SELECT * FROM Customer

-- 驗證密碼
DECLARE @gID varchar(10) 
DECLARE @gPWD varchar(20)
SET @gID='cy' 
SET @gPWD='123' 

SELECT pwdcompare(@gPWD,PWD)
FROM Customer
WHERE ID=@gID

GO

--方法2: 使用HASHBYTES
/*
  HASHBYTES ( '<algorithm>', { @input | 'input' } )  
  <algorithm>::= MD2 | MD4 | MD5 | SHA | SHA1 | SHA2_256 | SHA2_512   
*/

INSERT INTO Customer
VALUES('cy15',HASHBYTES('SHA2_512','123'));
SELECT * FROM Customer

DECLARE @gID varchar(16) 
DECLARE @gPWD varchar(20)
SET @gID='cy15' 
SET @gPWD='123' 

SELECT * FROM Customer WHERE ID=@gID AND PWD= HASHBYTES('SHA2_512',@gPWD)

/*主題4: 帳號密碼驗證功能
* 說明: 完成一個[個人資訊]資料表，新增[個人密碼]欄位，使用變數宣告方式撰寫SQL Script輸入帳號與密碼
        若帳密正確，顯示"密碼正確"；密碼錯誤顯示"密碼錯誤"
		若帳號不存在，顯示"帳號不存在"
*/

/* SQL Injection 以php實作帳號密碼登入為範例 */
/* 後端PHP 執行的 SQL 語法: 
   
     SELECT * FROM Customer  WHERE ID='$name' AND PWD='$password'
   
   如果駭客輸入有特殊字元的帳號ID：「'' or 1=1 -- 」，密碼：「任意值(I love SQL)」  
這時SQL語法就會變成：

     SELECT * FROM Customer  WHERE ID='' or 1=1 -- AND PWD='I love SQL'
*/

DECLARE @DangerSQL varchar(100)	
SET @DangerSQL='SELECT * FROM Customer WHERE ID='''' OR 1=1 -- AND PWD=''I love SQL'''
PRINT @DangerSQL
EXEC (@DangerSQL)   --執行@DangerSQL的文字指令
