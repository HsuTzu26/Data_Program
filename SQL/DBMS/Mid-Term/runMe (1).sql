USE MASTER
IF DB_ID('WHOPANDA') IS NOT NULL
	DROP DATABASE WHOPANDA
GO
CREATE DATABASE WHOPANDA
GO

USE WHOPANDA

CREATE TABLE 會員資料
(
	學號 INT ,
	身分證字號 VARCHAR(30) UNIQUE NOT NULL,
	姓氏 VARCHAR(20),
	名字 VARCHAR(20),
	生日 DATETIME,
	性別 CHAR(2) DEFAULT 'U',
	更新時間 DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(學號)
)

CREATE TABLE 付款方式
(
	卡號 INT IDENTITY(1000000001,1),
	類型 VARCHAR(20),
	學號 INT ,
	更新時間 DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(卡號),
	FOREIGN KEY (學號) REFERENCES 會員資料(學號)
)

CREATE TABLE 商品
(
	商品編號 INT,
	商品名稱 VARCHAR(20),
	店家編號 INT,
	店家名稱 VARCHAR(20),
	單價 INT,
	更新時間 DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(商品編號)
)

CREATE TABLE 訂單
(
	訂單編號 INT,
	訂購時間 DATETIME,
	學號 INT,
	更新時間 DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(訂單編號),
	FOREIGN KEY (學號) REFERENCES 會員資料(學號)
)

CREATE TABLE 訂單明細
(
	明細編號 INT,
	商品編號 INT,
	商品名稱 varchar(20),
	訂單編號 INT,
	更新時間 DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(明細編號),
	FOREIGN KEY (訂單編號) REFERENCES 訂單(訂單編號),
	FOREIGN KEY (商品編號) REFERENCES 商品(商品編號)
	
)

CREATE TABLE 交易紀錄
(
	交易紀錄編號 UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL,
	訂單狀態 VARCHAR(50),
	卡號 INT,
	學號 int,
	訂單編號 INT,
	更新時間 DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(交易紀錄編號),
	FOREIGN KEY (卡號) REFERENCES 付款方式(卡號),
	FOREIGN KEY (學號) REFERENCES 會員資料(學號),
	FOREIGN KEY (訂單編號) REFERENCES 訂單(訂單編號)

)
ALTER AUTHORIZATION ON DATABASE :: WHOPANDA TO [SA]

INSERT INTO 會員資料
	(學號,身分證字號,姓氏,名字,生日 ,性別)
VALUES
	(102214120,'A111111111','林','木木','20021120','女'),
	(102214121,'A222222222','張','弓長','20021220','男'),
	(102214122,'A333333333','姚','女兆','20001020','女')

INSERT INTO 付款方式
	(類型,學號)
VALUES
	('悠遊卡',102214120),
	('信用卡',102214121),
	('LINEPAY',102214122)

INSERT INTO 訂單
	(訂單編號,訂購時間,學號)
VALUES
	(1,'20230421',102214120),
	(2,'20230422',102214121),
	(3,'20230422',102214122),
	(4,'20230423',102214120),
	(5,'20230423',102214120),
	(6,'20230423',102214121),
	(7,'20230424',102214121),
	(8,'20230424',102214122),
	(9,'20230424',102214122),
	(10,'20230424',102214120),
	(11,'20230425',102214120),
	(12,'20230425',102214121),
	(13,'20230425',102214121),
	(14,'20230425',102214122),
	(15,'20230425',102214122)


INSERT INTO 交易紀錄
	(訂單狀態,卡號,訂單編號,學號)
VALUES
	('已收單',1000000001,1,102214120),
	('配送中',1000000002,2,102214121),
	('已送達',1000000003,3,102214122),
	('已取消',1000000001,4,102214120),
	('已收單',1000000002,5,102214121),
	('配送中',1000000003,6,102214122),
	('已送達',1000000001,7,102214120),
	('已取消',1000000002,8,102214121),
	('已收單',1000000003,9,102214122),
	('配送中',1000000001,10,102214120),
	('已送達',1000000002,11,102214121),
	('已取消',1000000003,12,102214122),
	('已收單',1000000001,13,102214120),
	('配送中',1000000002,14,102214121),
	('已取消',1000000003,15,102214122)


INSERT INTO 商品
	(商品編號,商品名稱,店家編號,店家名稱,單價)
VALUES
	(1,'招牌飯',1,'大三元',100),
	(2,'10顆鍋貼',2,'阿財',60),
	(3,'雞排',3,'派克',80),
	(4,'珍奶',4,'COCO',50)

INSERT INTO 訂單明細
	(明細編號,商品編號,訂單編號)
VALUES
	(1,1,1),
	(2,2,1),
	(3,2,2),
	(4,3,2),
	(5,3,3),
	(6,4,3)


--3.
alter table 交易紀錄 add 消費者 varchar(25) DEFAULT '無'

--SELECT * FROM 交易紀錄
--4.
UPDATE 交易紀錄 
SET 消費者 = 會員資料.姓氏 + 會員資料.名字
from 會員資料,交易紀錄,付款方式
WHERE 交易紀錄.學號 = 會員資料.學號 and 付款方式.卡號 = 交易紀錄.卡號


--select * from 交易紀錄
--select * from 會員資料
--select * from 付款方式

--5.

update 會員資料
set 名字 = '幕幕'
output deleted.名字 as  原名字,inserted.名字 as  更新後名字
where 名字 = '木木'

--6.
DECLARE @TEXT INT
SET @TEXT = 102214120
SELECT DISTINCT 交易紀錄.交易紀錄編號,交易紀錄.訂單狀態, 付款方式.卡號,商品.店家名稱,商品.商品名稱,商品.單價,會員資料.姓氏+SPACE(1)+會員資料.名字 AS 姓名 ,CONVERT(VARCHAR,會員資料.學號,20)+'/'+CONVERT(VARCHAR,會員資料.生日,23)+'/'+會員資料.性別 AS 基本資訊 
FROM 交易紀錄 JOIN 付款方式 ON 交易紀錄.卡號 = 付款方式.卡號
			  JOIN 會員資料  ON 交易紀錄.學號 = 會員資料.學號,
	 訂單明細 JOIN 訂單 ON 訂單.訂單編號 = 訂單明細.訂單編號
			  JOIN 商品 ON 商品.商品編號 = 訂單明細.商品編號
WHERE 會員資料.學號 = @TEXT

--7.
INSERT INTO 訂單
	(訂單編號,訂購時間,學號)
VALUES
	(16,'20230909',102214120)

INSERT INTO 訂單明細
	(明細編號,商品編號,訂單編號)
VALUES
	(7,3,16),
	(8,4,16)

INSERT INTO 交易紀錄
	(訂單狀態,卡號,訂單編號,學號,消費者)
VALUES
	('已收單',1000000001,16,102214120,'林幕幕')

--SELECT * FROM 交易紀錄
SELECT DISTINCT 交易紀錄.交易紀錄編號,交易紀錄.訂單狀態, 交易紀錄.消費者,CONVERT(VARCHAR,會員資料.學號,20)+'/'+CONVERT(VARCHAR,會員資料.生日,23)+'/'+會員資料.性別 AS 基本資訊 
FROM 交易紀錄 JOIN 付款方式 ON 交易紀錄.卡號 = 付款方式.卡號
			  JOIN 會員資料  ON 交易紀錄.學號 = 會員資料.學號,
	 訂單明細 JOIN 訂單  ON 訂單.訂單編號 = 訂單明細.訂單編號
			  JOIN 商品 ON 商品.商品編號 = 訂單明細.商品編號
WHERE 會員資料.學號 = 102214120

--8.
SELECT 會員資料.學號,COUNT(訂單.訂單編號) AS 訂單總次數,SUM(商品.單價)訂單合計總金額
FROM 會員資料,訂單,商品,訂單明細
WHERE 訂單.訂單編號 = 訂單明細.訂單編號  AND 訂單.學號 = 會員資料.學號 AND 商品.商品編號 = 訂單明細.商品編號
GROUP BY 會員資料.學號
ORDER BY 訂單總次數 DESC


