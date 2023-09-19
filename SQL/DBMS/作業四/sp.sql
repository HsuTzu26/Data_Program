/*
1. 載入[練習9.mdf]使用LEFT JOIN結合四個資料表，並加入搜尋條件，輸入客戶編號，查詢該客戶的訂單紀錄與相關資訊 (40分)
 - 四個資料表為: 訂單, 客戶, 訂購項目, 書籍
 - 顯示欄位依左至右為: 訂單編號, 下單日期, 書籍名稱, 書籍數量, 客戶名稱, 客戶聯絡人, 客戶地址, 客戶電話
 - 輸入: 客戶編號
 - 輸出:  查詢結果清單
 */
use master
use 練習09

SELECT *
FROM 客戶

SELECT O.訂單編號, O.下單日期, B.書籍名稱, I.數量 AS 書籍數量, C.客戶名稱, C.聯絡人 AS 客戶聯絡人, C.地址 AS 客戶地址, C.電話 AS 客戶電話
FROM 訂單 O
LEFT JOIN 客戶 C ON O.客戶編號 = C.客戶編號
LEFT JOIN 訂購項目 I ON O.訂單編號 = I.訂單編號
LEFT JOIN 書籍 B ON I.書籍編號 = B.書籍編號   

-- DROP PROCEDURE IF EXISTS 查詢結果清單_Procedure

CREATE PROCEDURE 查詢結果清單_Procedure (@客戶編號 INT)
AS
BEGIN
    SELECT O.訂單編號, O.下單日期, B.書籍名稱, I.數量 AS 書籍數量, C.客戶名稱, C.聯絡人 AS 客戶聯絡人, C.地址 AS 客戶地址, C.電話 AS 客戶電話
		FROM 訂單 O
		LEFT JOIN 客戶 C ON O.客戶編號 = C.客戶編號
		LEFT JOIN 訂購項目 I ON O.訂單編號 = I.訂單編號
		LEFT JOIN 書籍 B ON I.書籍編號 = B.書籍編號
		WHERE C.客戶編號 = @客戶編號;
END

-- 客戶編號1~9
-- 1~6 皆有結果可以顯示, 7.8.9 無結果可顯示

EXEC 查詢結果清單_Procedure @客戶編號 = 1; 

/*
2. 綜合語法練習: 新增一筆交易紀錄，並同步更新LOG_SEQ (40分)
 - LOG_SEQ中的LOG_COUNT需自動加1
 - 需回傳結果是否成功
 - 輸入: 新增交易紀錄內容，欄位以不同變數輸入
 - 輸出:  回傳交易結果: 1:成功; 2:失敗
*/

-- 建立記錄號碼牌統計表格
CREATE TABLE LOG_SEQ(
  SDATE varchar(8) NOT NULL PRIMARY KEY, 	-- 當天的log記錄
  LOG_COUNT varchar(6) NOT NULL 			-- 當天一共有多少筆log
) 

-- 建立交易記錄表格
CREATE TABLE Trans (
	ID  char(15),		  /* 格式: 系統日期(8碼)_序號(6碼) */    
    TransDate   datetime
);
GO

-- DROP PROCEDURE IF EXISTS 交易記錄_Procedure;

CREATE PROCEDURE 交易記錄_Procedure(
	@交易內容 VARCHAR(50),
	@Result INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @TS VARCHAR(8)
        DECLARE @No VARCHAR(6)

        SET @TS = CONVERT(VARCHAR, GETDATE(), 112)

        -- 查詢LOG_SEQ找出當天LOG_COUNT值
        SET @No = (SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS)

        IF @No IS NULL
        BEGIN
            SET @No = '000001'
            -- 插入第一筆數據，LOG_COUNT=0
            INSERT INTO LOG_SEQ VALUES (@TS, '000001')
        END
        ELSE
        BEGIN
            SET @No = RIGHT('000000' + CAST((CAST(@No AS INT) + 1) AS VARCHAR), 6)
            -- 更新LOG_COUNT
            UPDATE LOG_SEQ SET LOG_COUNT = @No WHERE SDATE = @TS
        END

        -- 生成TransID: 系统日期(8碼)_序號(6碼)
        DECLARE @TranID VARCHAR(15)
        SET @TranID = @TS + '_' + @No

        -- 新增交易記錄
        INSERT INTO Trans (ID, TransDate)
        VALUES (@TranID, GETDATE());

		-- 模擬失敗情况
        RAISERROR('Transaction failed', 16, 1);

        COMMIT;
        SET @Result = 1; -- 成功
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        SET @Result = 2; -- 失敗
		PRINT '交易失敗'; -- 印出交易失敗消息
    END CATCH;

	-- 返回更新後的LOG_COUNT
    SET @Result = (SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS);
END


-- 1 成功
DECLARE @Result INT;

EXEC 交易紀錄_Procedure
    @交易內容 = '新增交易記錄內容',
    @Result = @Result OUTPUT;

SELECT @Result AS 'TransactionResult';
SELECT * from Trans

-- 2 失敗
DECLARE @Result INT;

EXEC 交易記錄_Procedure
    @交易內容 = '交易失敗內容',
    @Result = @Result OUTPUT;

IF @Result = 2
BEGIN
    PRINT '交易失敗';
END


/*
3. 綜合語法練習 - 製作帳號密碼驗證，輸入帳號與密碼，並回傳狀態，並顯示以下結果 (20分)
 - 帳號不存在
 - 密碼錯誤
 - 帳密正確
 - 輸入: 帳號、密碼
 - 輸出:  回傳狀態: 1: 帳號不存在; 2:密碼錯誤; 3:帳密正確
*/

CREATE TABLE Customer (
    ID  char (10) PRIMARY KEY,
    PWD varbinary(500)	
);

INSERT INTO Customer
VALUES('cy15',HASHBYTES('SHA2_512','123'));
SELECT * FROM Customer

--DROP PROCEDURE IF EXISTS ValidateAccount

CREATE PROCEDURE ValidateAccount
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @Status INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MatchCount INT;
    
    -- 檢查帳號是否存在
    SELECT @MatchCount = COUNT(*) FROM Customer WHERE ID = @Username;
    
    IF @MatchCount = 0
    BEGIN
        -- 帳號不存在
        SET @Status = 1;
    END
    ELSE
    BEGIN
        -- 驗證密码
        SELECT @MatchCount = COUNT(*) FROM Customer WHERE ID = @Username AND PWD = HASHBYTES('SHA2_512', @Password);
        
        IF @MatchCount = 0
        BEGIN
            -- 密碼錯誤
            SET @Status = 2;
        END
        ELSE
        BEGIN
            -- 帳號和密碼正確
            SET @Status = 3;
        END
    END
END;

-- 1 帳號不存在
DECLARE @Status INT;
EXEC ValidateAccount
    @Username = 'cy',
    @Password = '123',
    @Status = @Status OUTPUT;

SELECT @Status AS 'Status';

--2 密碼錯誤
DECLARE @Status INT;
EXEC ValidateAccount
    @Username = 'cy15',
    @Password = '1243',
    @Status = @Status OUTPUT;

SELECT @Status AS 'Status';

--3 帳密正確
DECLARE @Status INT;
EXEC ValidateAccount
    @Username = 'cy15',
    @Password = '123',
    @Status = @Status OUTPUT;

SELECT @Status AS 'Status';