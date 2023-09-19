use master;
IF DB_ID ('WhoPanda') IS NOT NULL
	DROP DATABASE WhoPanda
GO
CREATE DATABASE WhoPanda
GO
USE WhoPanda
--題目1
-- 會員資料: 學號 身份證字號 姓氏 名字 生日 性別
--	 身份證字號 不得為空, 且唯一, 不得為PK; 性別預設值為'U'
CREATE TABLE 會員資料
(
	學號 varchar(9) Primary Key,
	身份證字號 varchar(10) NOT NULL UNIQUE,
	姓氏 varchar(10),
	名字 varchar(20),
	生日 date,
	性別 varchar(1) DEFAULT 'U', -- F女 M男 U未知
	更新時間 datetime DEFAULT CONVERT(varchar, GETDATE(), 20)
)
--商品: 商品編號 商品名稱 店家編號 店家名稱 單價
CREATE TABLE 商品
(
	商品編號 int IDENTITY(1,1) Primary Key,
	商品名稱 varchar(50),
	店家編號 int,
	店家名稱 varchar(50),
	單價 int,
	更新時間 datetime DEFAULT CONVERT(varchar, GETDATE(), 20)
)
--訂單: 訂單編號 訂購時間
CREATE TABLE 訂單
(
	訂單編號 int IDENTITY(1,1) Primary Key,
	訂購時間 datetime,
	更新時間 datetime DEFAULT CONVERT(varchar, GETDATE(), 20),
	店家名稱 varchar(50),
	商品名稱 varchar(50),
	商品編號 int,
	單價 int
	FOREIGN KEY (商品編號) REFERENCES 商品(商品編號)
)
--付款方式: 卡號 類型
CREATE TABLE 付款方式
(
	卡號 int IDENTITY(1000000001,1) Primary Key,
	類型 int, -- 0儲值金 1悠遊卡 2LINE Pay 3信用卡
	更新時間 datetime DEFAULT CONVERT(varchar, GETDATE(), 20),
	學號 varchar(9),
	FOREIGN KEY (學號) REFERENCES 會員資料(學號)
)
--交易紀錄: 交易紀錄編號(GUID) 訂單狀態
CREATE TABLE 交易紀錄
(
	交易紀錄編號 UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL Primary Key, --GUID
	訂單狀態 int, -- 0已收單 1配送中 2已送達 3已取消
	更新時間 datetime DEFAULT CONVERT(varchar, GETDATE(), 20),
	卡號 int,
	店家名稱 varchar(50),
	商品名稱 varchar(50),
	商品編號 int,
	單價 int,
	FOREIGN KEY (卡號) REFERENCES 付款方式(卡號),
)
--訂單明細:
CREATE TABLE 訂單明細
(
	訂單編號 int IDENTITY(1,1) Primary Key,
	訂購時間 datetime,
	卡號 int,
	付款方式 int, -- 0儲值金 1悠遊卡 2LINE Pay 3信用卡
	交易紀錄編號 UNIQUEIDENTIFIER,
	商品編號 int,
	商品名稱 varchar(50),
	店家編號 int,
	店家名稱 varchar(50),
	單價 int,
	學號 varchar(9),
	FOREIGN KEY (卡號) REFERENCES 付款方式(卡號),
	FOREIGN KEY (學號) REFERENCES 會員資料(學號),
	FOREIGN KEY (交易紀錄編號) REFERENCES 交易紀錄(交易紀錄編號),
	FOREIGN KEY (商品編號) REFERENCES 商品(商品編號)
)

--題目2
INSERT INTO 會員資料
	(學號, 身份證字號, 姓氏, 名字, 生日, 性別)
VALUES
	('097758135', 'A123456789', '高', '敏敏', '19990610', 'F'),
	('107945876', 'A234567890', '許', '添興', '20001013', 'M'),
	('118542367', 'A345678912', '黃', '阿老', '20020915', 'M');

INSERT INTO 付款方式
	(類型, 學號)
VALUES
	(2, '097758135'), -- 1000000001 
	(3, '107945876'), -- 1000000002
	(0, '118542367'); -- 1000000003


INSERT INTO 交易紀錄
	(訂單狀態, 卡號, 商品名稱, 店家名稱, 單價, 商品編號)
VALUES
	(1,1000000001,'招牌飯','大三元', 90,1), --1000000001
	(0,1000000001,'招牌鍋貼','阿財鍋貼', 70,2),
	(2,1000000001,'羊肉羹飯','羊老弟', 95,3),
	(2,1000000001,'好大塊雞排','派克雞排', 75,4),
	(0,1000000001,'水煎包','劉媽媽水煎包', 100,5),
	(2,1000000002,'羊肉羹飯','羊老弟', 95,3), --1000000002
	(3,1000000002,'好大塊雞排','派克雞排', 75,4),
	(1,1000000002,'水煎包','劉媽媽水煎包', 100,5),
	(2,1000000002,'招牌鍋貼','阿財鍋貼', 70,2),
	(3,1000000002,'水煎包','劉媽媽水煎包', 100,5),
	(1,1000000003,'水煎包','劉媽媽水煎包', 100,5), --1000000003
	(1,1000000003,'招牌飯','大三元', 90,1),
	(2,1000000003,'水煎包','劉媽媽水煎包', 100,5),
	(1,1000000003,'招牌鍋貼','阿財鍋貼', 70,2),
	(0,1000000003,'招牌飯','大三元', 90,1);

INSERT INTO 商品
	(商品名稱, 店家編號, 店家名稱, 單價)
VALUES
	('招牌飯',1,'大三元', 90),
	('招牌鍋貼',2,'阿財鍋貼', 70),
	('羊肉羹飯',3,'羊老弟', 95),
	('好大塊雞排',4,'派克雞排', 75),
	('水煎包',5,'劉媽媽水煎包', 100);

INSERT INTO 訂單
	(訂購時間, 商品名稱, 商品編號)
VALUES
	('2023-04-01', '招牌飯',1),
	('2023-04-06', '招牌鍋貼',2),
	('2023-04-11', '好大塊雞排',4),
	('2023-04-16', '羊肉羹飯',3),
	('2023-04-21', '水煎包',5),
	('2023-04-21', '招牌飯',1);

--題目3
ALTER TABLE 交易紀錄 ADD 消費者 varchar(20)

--題目4 將會員姓名填入至 消費者
UPDATE 交易紀錄
SET 消費者 = '高敏敏'
WHERE 卡號='1000000001'

UPDATE 交易紀錄
SET 消費者 = '許添興'
WHERE 卡號='1000000002'

UPDATE 交易紀錄
SET 消費者 = '黃阿老'
WHERE 卡號='1000000003'

--題目5
UPDATE 會員資料
SET 姓氏='許', 名字='天星'
OUTPUT deleted.姓氏 原姓, deleted.名字 原名, inserted.姓氏 新姓, inserted.名字 新名 
WHERE 學號='118542367'

--題目6
SELECT T.*, T.卡號 AS 付款卡號, (姓氏+SPACE(1)+名字) AS 姓名, (M.學號+'/'+CONVERT(varchar(100),生日,23)+'/'+性別) AS 基本資料
FROM 交易紀錄 T
	LEFT JOIN 付款方式 P ON P.卡號=T.卡號 
	LEFT JOIN 會員資料 M ON M.學號=P.學號
	LEFT JOIN 商品 S ON S.商品編號=T.商品編號
WHERE M.學號='097758135'

--題目7
INSERT INTO 交易紀錄
	(訂單狀態, 卡號, 商品名稱, 店家名稱, 單價, 商品編號)
VALUES
	(2, 1000000003, '好大塊雞排','派克雞排',75,4),
	(1, 1000000003, '羊肉羹飯','羊老弟',95,3);
UPDATE 交易紀錄

SET 消費者 = '許天星'
WHERE 消費者 IS NULL AND 卡號='1000000003'

SELECT T.*, T.卡號 AS 付款卡號, (姓氏+SPACE(1)+名字) AS 姓名, (M.學號+'/'+CONVERT(varchar(100),生日,23)+'/'+性別) AS 基本資料
FROM 交易紀錄 T
	LEFT JOIN 付款方式 P ON P.卡號=T.卡號 
	LEFT JOIN 會員資料 M ON M.學號=P.學號
	LEFT JOIN 商品 S ON S.商品編號=T.商品編號
WHERE M.學號='118542367'

--題目8
SELECT M.學號, COUNT(T.訂單狀態) AS 訂單總次數, SUM(T.單價) AS 訂單合計總金額
FROM 交易紀錄 T
	LEFT JOIN 付款方式 P ON P.卡號=T.卡號  
	LEFT JOIN 會員資料 M ON M.學號=P.學號
	LEFT JOIN 商品 S ON S.商品編號=T.商品編號
GROUP BY M.學號
ORDER BY 訂單總次數 DESC

