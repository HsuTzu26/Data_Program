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

--DROP FUNCTION IF EXISTS 查詢結果清單_FUNC;

CREATE FUNCTION 查詢結果清單_FUNC (@客戶編號 INT)
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

-- 客戶編號1~9
-- 1~6 皆有結果可以顯示, 7.8.9 無結果可顯示

SELECT * FROM dbo.查詢結果清單_FUNC(1); 

/*
2. 綜合語法練習: 新增一筆交易紀錄，並同步更新LOG_SEQ (40分)
 - LOG_SEQ中的LOG_COUNT需自動加1
 - 需回傳結果是否成功
 - 輸入: 新增交易紀錄內容，欄位以不同變數輸入
 - 輸出:  回傳交易結果: 1:成功; 2:失敗
*/

/*
在 SQL Server 中，函數無法包含具有副作用(修改狀態)的操作，如 INSERT 或 UPDATE。
因此，無法直接在函數中執行 INSERT 或 UPDATE 等操作。
需要將插入新資料與更新的程式放在存儲過程中，而不是函數中。

CREATE FUNCTION中的"限制事項 "提到
 - 使用者定義函數不能用來執行修改資料庫狀態的動作。
 - 使用者定義函式不得包含具有資料表作為其目標的 OUTPUT INTO 子句。
*/

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

-- DROP FUNCTION IF EXISTS ValidateAccount_FUNC

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
        -- 帳號不存在
        SET @Status = 1;
    END
    ELSE IF EXISTS (SELECT 1 FROM Customer WHERE ID = @Username AND PWD = HASHBYTES('SHA2_512', @Password))
    BEGIN
        -- 帳號和密碼正確
        SET @Status = 3;
    END
    ELSE
    BEGIN
        -- 密碼錯誤
        SET @Status = 2;
    END

    RETURN @Status;
END;

 -- 1 帳號不存在
DECLARE @Username VARCHAR(50) = 'hsu15';
DECLARE @Password VARCHAR(50) = '123';
DECLARE @Status INT;

SET @Status = dbo.ValidateAccount_FUNC(@Username, @Password);

SELECT @Status AS 'TransactionResult';

 -- 2 密碼錯誤
DECLARE @Username VARCHAR(50) = 'cy15';
DECLARE @Password VARCHAR(50) = 'abc';
DECLARE @Status INT;

SET @Status = dbo.ValidateAccount_FUNC(@Username, @Password);

SELECT @Status AS 'TransactionResult';


 -- 3 帳密正確
DECLARE @Username VARCHAR(50) = 'cy15';
DECLARE @Password VARCHAR(50) = '123';
DECLARE @Status INT;

SET @Status = dbo.ValidateAccount_FUNC(@Username, @Password);

SELECT @Status AS 'TransactionResult';




