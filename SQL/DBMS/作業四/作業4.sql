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

CREATE PROCEDURE 查詢結果清單_Procedure (@客戶編號 INT)
AS
BEGIN
    /*CREATE TABLE #TempOrderDetails
    (
        OrderID INT,
        OrderDate DATE,
        BookName VARCHAR(100),
        Quantity INT,
        CustomerName VARCHAR(100),
        ContactPerson VARCHAR(100),
        Address VARCHAR(100),
        Phone VARCHAR(100)
    )*/

    SELECT O.訂單編號, O.下單日期, B.書籍名稱, I.數量 AS 書籍數量, C.客戶名稱, C.聯絡人 AS 客戶聯絡人, C.地址 AS 客戶地址, C.電話 AS 客戶電話
		FROM 訂單 O
		LEFT JOIN 客戶 C ON O.客戶編號 = C.客戶編號
		LEFT JOIN 訂購項目 I ON O.訂單編號 = I.訂單編號
		LEFT JOIN 書籍 B ON I.書籍編號 = B.書籍編號
		WHERE C.客戶編號 = @客戶編號;

    /*SELECT * FROM #TempOrderDetails;

    DROP TABLE #TempOrderDetails;*/
END


EXEC 查詢結果清單_Procedure @客戶編號 = 1;


--DROP FUNCTION IF EXISTS 查詢結果清單;

CREATE FUNCTION 查詢結果清單_Function (@客戶編號 int)
RETURNS TABLE
AS
RETURN
(
    SELECT O.訂單編號, O.下單日期, B.書籍名稱, I.數量 AS 書籍數量, C.客戶名稱, C.聯絡人 AS 客戶聯絡人, C.地址 AS 客戶地址, C.電話 AS 客戶電話
    FROM 訂單 O
    LEFT JOIN 客戶 C ON O.客戶編號 = C.客戶編號
    LEFT JOIN 訂購項目 I ON O.訂單編號 = I.訂單編號
    LEFT JOIN 書籍 B ON I.書籍編號 = B.書籍編號
    WHERE C.客戶編號 = @客戶編號
);

SELECT * FROM 查詢結果清單_Function(1);


/*
2. 綜合語法練習: 新增一筆交易紀錄，並同步更新LOG_SEQ (40分)
 - LOG_SEQ中的LOG_COUNT需自動加1
 - 需回傳結果是否成功
 - 輸入: 新增交易紀錄內容，欄位以不同變數輸入
 - 輸出:  回傳交易結果: 1:成功; 2:失敗
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

DROP PROCEDURE IF EXISTS 交易紀錄_Procedure;


CREATE PROCEDURE 交易紀錄_Procedure(
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

        -- 查詢LOG_SEQ找出当天LOG_COUNT值
        SET @No = (SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS)

        IF @No IS NULL
        BEGIN
            SET @No = '000001'
            -- 插入第一笔数据，LOG_COUNT=0
            INSERT INTO LOG_SEQ VALUES (@TS, '000001')
        END
        ELSE
        BEGIN
            SET @No = RIGHT('000000' + CAST((CAST(@No AS INT) + 1) AS VARCHAR), 6)
            -- 更新LOG_COUNT
            UPDATE LOG_SEQ SET LOG_COUNT = @No WHERE SDATE = @TS
        END

        -- 生成TransID: 系统日期(8码)_序号(6码)
        DECLARE @TranID VARCHAR(15)
        SET @TranID = @TS + '_' + @No

        -- 新增交易记录
        INSERT INTO Trans (ID, TransDate)
        VALUES (@TranID, GETDATE());

        COMMIT;
        SET @Result = 1; -- 成功
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        SET @Result = 2; -- 失败
    END CATCH;

	-- 返回更新后的LOG_COUNT
    SET @Result = (SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS);
END

DECLARE @Result INT;

EXEC 交易紀錄_Procedure
    @交易內容 = '新增交易记录内容',
    @Result = @Result OUTPUT;

SELECT @Result AS 'TransactionResult';

-- FUNCTION

DROP FUNCTION IF EXISTS UpdateLogCount;

CREATE PROCEDURE InsertTransactionRecord (
    @TransactionContent VARCHAR(100),
    @Result INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @TS VARCHAR(8)
        DECLARE @No VARCHAR(6)
        DECLARE @TranID VARCHAR(15)

        SET @TS = CONVERT(VARCHAR, GETDATE(), 112)

        -- 查詢LOG_SEQ找出当天LOG_COUNT值
        SET @No = (SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS)

        IF @No IS NULL
        BEGIN
            SET @No = '000001'
            -- 插入第一笔数据，LOG_COUNT=0
            INSERT INTO LOG_SEQ VALUES (@TS, '000001')
        END
        ELSE
        BEGIN
            SET @No = RIGHT('000000' + CAST((CAST(@No AS INT) + 1) AS VARCHAR), 6)
            -- 更新LOG_COUNT
            UPDATE LOG_SEQ SET LOG_COUNT = @No WHERE SDATE = @TS
        END

        -- 生成TransID: 系统日期(8码)_序号(6码)
        SET @TranID = @TS + '_' + @No

        -- 新增交易记录
        INSERT INTO Trans (ID, TransDate)
        VALUES (@TranID, GETDATE());

        COMMIT;
        SET @Result = 1; -- 成功
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        SET @Result = 2; -- 失败
    END CATCH;

    -- 返回更新后的LOG_COUNT
    SET @Result = (SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS);
END

/*
在 SQL Server 中，函数无法包含具有副作用(修改)的操作，如 INSERT 或 UPDATE。
因此，无法直接在函数中执行这些操作。
我建议将更新 LOG_COUNT 的逻辑放在存储过程中，而不是函数中。
*/

DECLARE @Result INT;
SET @Result = dbo.GetUpdatedLogCount();

SELECT @Result AS 'UpdatedLogCount';


/*
3. 綜合語法練習 - 製作帳號密碼驗證，輸入帳號與密碼，並回傳狀態，並顯示以下結果 (20分)
 - 帳號不存在
 - 密碼錯誤
 - 帳密正確
 - 輸入: 帳號、密碼
 - 輸出:  回傳狀態: 1: 帳號不存在; 2:密碼錯誤; 3:帳密正確
*/

DROP PROCEDURE IF EXISTS ValidateAccount

CREATE TABLE Customer (
    ID  char (10) PRIMARY KEY,
    PWD varbinary(500)	
);

INSERT INTO Customer
VALUES('cy15',HASHBYTES('SHA2_512','123'));
SELECT * FROM Customer

CREATE PROCEDURE ValidateAccount
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @Status INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MatchCount INT;
    
    -- 检查帐号是否存在
    SELECT @MatchCount = COUNT(*) FROM Customer WHERE ID = @Username;
    
    IF @MatchCount = 0
    BEGIN
        -- 帐号不存在
        SET @Status = 1;
    END
    ELSE
    BEGIN
        -- 验证密码
        SELECT @MatchCount = COUNT(*) FROM Customer WHERE ID = @Username AND PWD = HASHBYTES('SHA2_512', @Password);
        
        IF @MatchCount = 0
        BEGIN
            -- 密码错误
            SET @Status = 2;
        END
        ELSE
        BEGIN
            -- 帐号和密码正确
            SET @Status = 3;
        END
    END
END;

DECLARE @Status INT;

-- 1 帳號不存在
EXEC ValidateAccount
    @Username = 'cy',
    @Password = '123',
    @Status = @Status OUTPUT;

SELECT @Status AS 'Status';

--2 密碼錯誤
EXEC ValidateAccount
    @Username = 'cy15',
    @Password = '1243',
    @Status = @Status OUTPUT;

SELECT @Status AS 'Status';

--3 帳密正確
EXEC ValidateAccount
    @Username = 'cy15',
    @Password = '123',
    @Status = @Status OUTPUT;

SELECT @Status AS 'Status';


-- FUNCTION
CREATE FUNCTION ValidateAccount_FUNC (
    @Username VARCHAR(50),
    @Password VARCHAR(50)
)
RETURNS INT
AS
BEGIN
    DECLARE @Status INT;

    IF NOT EXISTS (SELECT 1 FROM Customer WHERE ID = @Username)
    BEGIN
        -- 帐号不存在
        SET @Status = 1;
    END
    ELSE IF EXISTS (SELECT 1 FROM Customer WHERE ID = @Username AND PWD = HASHBYTES('SHA2_512', @Password))
    BEGIN
        -- 帐号和密码正确
        SET @Status = 3;
    END
    ELSE
    BEGIN
        -- 密码错误
        SET @Status = 2;
    END

    RETURN @Status;
END;


DECLARE @Username VARCHAR(50) = 'cy15';
DECLARE @Password VARCHAR(50) = '123';
DECLARE @Status INT;

SET @Status = dbo.ValidateAccount_FUNC(@Username, @Password);

SELECT @Status AS 'TransactionResult';
