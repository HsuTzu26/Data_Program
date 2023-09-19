/*
說明: 請使用觸發(Trigger)修改[W09] 綜合語法練習 ，規則如下:
 
1.請使用AFTER觸發程序，改寫原本程式，在新增交易紀錄後，自動更新LOG_SEG流水號
 
2.請使用INSTEAD OF觸發程序，在操作新增交易紀錄時，不需要輸入TranID(範例格式: 20210524_000001)。將TranID新增至交易紀錄取代原本新增交易紀錄動作。並自動更新LOG_SEG流水號
*/
USE master
IF DB_ID ( 'Ex3' ) IS NOT NULL
  DROP DATABASE Ex3;
GO
CREATE DATABASE Ex3
GO
USE Ex3;

/*
TRUNCATE TABLE LOG_SEQ
TRUNCATE TABLE Trans
DROP TRIGGER Update_LOG_SEQ
*/

-- 1.請使用AFTER觸發程序，改寫原本程式，在新增交易紀錄後，自動更新LOG_SEG流水號
-- 創建紀錄號碼牌統計表格
-- 創建交易紀錄表格
CREATE TABLE Trans (
	ID          char(15),      -- 格式: 系統日期(8碼)_序號(6碼)
	TransDate   datetime
);
GO

-- 創建紀錄號碼牌統計表格
CREATE TABLE LOG_SEQ(
  SDATE varchar(8) NOT NULL PRIMARY KEY,     -- 當天的log紀錄
  LOG_COUNT varchar(6) NOT NULL              -- 當天一共有多少筆log
);
GO

-- 創建觸發器
CREATE TRIGGER Update_LOG_SEQ
ON Trans
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
	--使用SET NOCOUNT ON是為了關閉在觸發器中產生的"xx 行受影響"消息的顯示

    DECLARE @TS varchar(8)     -- 系統日期(8碼)
    DECLARE @No int     -- 序號
    DECLARE @TranID varchar(15)     -- 格式: 系統日期(8碼)_序號(6碼)

    SET @TS = CONVERT(varchar, GETDATE(), 112) -- 獲取當前日期

    -- 查詢當天LOG_COUNT值
    SELECT @No = LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS

    -- 如果當天沒有記錄，則將LOG_COUNT初始化為0
    IF @No IS NULL
    BEGIN
        SET @No = 0;
        INSERT INTO LOG_SEQ (SDATE, LOG_COUNT) VALUES (@TS, @No);
    END

    -- LOG_COUNT加1，並更新LOG_COUNT
    SET @No = @No + 1
    UPDATE LOG_SEQ SET LOG_COUNT = @No WHERE SDATE = @TS -- 更新LOG_COUNT

    -- 生成TransID: 系統日期(8碼)_序號(6碼)
    SET @TranID = @TS + '_' + RIGHT('000000' + CAST(@No AS varchar), 6)

    -- 更新插入記錄的ID字段為生成的ID
    UPDATE T SET ID = @TranID
    FROM Trans AS T
    INNER JOIN inserted AS I ON T.TransDate = I.TransDate;
END
GO

-- 插入測試數據
INSERT INTO Trans (TransDate)
VALUES (GETDATE());

-- 查詢更新後的Trans表
SELECT * FROM Trans;
SELECT * FROM LOG_SEQ

/************************************/
/*
TRUNCATE TABLE Trans_INSTEAD
TRUNCATE TABLE LOG_SEQ_INSTEAD
DROP TRIGGER Insert_Trans
*/

/* 
2.請使用INSTEAD OF觸發程序，在操作新增交易紀錄時，不需要輸入TranID(範例格式: 20210524_000001)。
將TranID新增至交易紀錄取代原本新增交易紀錄動作。並自動更新LOG_SEG流水號
*/
-- 創建交易紀錄表格
CREATE TABLE Trans_INSTEAD (
    ID          char(15),      -- 格式: 系統日期(8碼)_序號(6碼)
    TransDate   datetime
);
GO

-- 創建紀錄號碼牌統計表格
CREATE TABLE LOG_SEQ_INSTEAD(
    SDATE varchar(8) NOT NULL PRIMARY KEY,     -- 當天的log紀錄
    LOG_COUNT int NOT NULL              -- 當天一共有多少筆log
);
GO

-- 創建觸發器
CREATE TRIGGER Insert_Trans
ON Trans_INSTEAD
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TS varchar(8)     -- 系統日期(8碼)
    DECLARE @No int     -- 序號
    DECLARE @TranID varchar(15)     -- 格式: 系統日期(8碼)_序號(6碼)

    SET @TS = CONVERT(varchar, GETDATE(), 112) -- 獲取當前日期

    -- 查詢當天LOG_COUNT值
    SELECT @No = LOG_COUNT FROM LOG_SEQ_INSTEAD WHERE SDATE = @TS

    -- 如果當天沒有記錄，則將LOG_COUNT初始化為0
    IF @No IS NULL
    BEGIN
        SET @No = 0;
        INSERT INTO LOG_SEQ_INSTEAD(SDATE, LOG_COUNT) VALUES (@TS, @No);
    END

    -- LOG_COUNT加1，並更新LOG_COUNT
    SET @No = @No + 1
    UPDATE LOG_SEQ_INSTEAD SET LOG_COUNT = @No WHERE SDATE = @TS -- 更新LOG_COUNT

    -- 生成TransID: 系統日期(8碼)_序號(6碼)
    SET @TranID = @TS + '_' + RIGHT('000000' + CAST(@No AS varchar), 6)

    -- 插入交易紀錄並自動生成ID
    INSERT INTO Trans_INSTEAD(ID, TransDate)
    SELECT @TranID, TransDate
    FROM inserted;
END
GO

-- 插入測試數據
INSERT INTO Trans_INSTEAD(TransDate)
VALUES (GETDATE());

-- 查詢更新後的Trans表
SELECT * FROM Trans_INSTEAD;
SELECT * FROM LOG_SEQ_INSTEAD
