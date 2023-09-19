USE master
IF DB_ID ( 'NTUApp' ) IS NOT NULL
	DROP DATABASE NTUApp;
GO
CREATE DATABASE NTUApp
GO
USE NTUApp;
CREATE TABLE 個人資料
(
	學號 char(9) Primary Key,
	身份證字號 char(10) NOT NULL UNIQUE,
	姓氏 varchar(10),
	名字 varchar(20),
	生日 date,
	性別 varchar(1),						--F女/M男/U未知
	在學狀態 varchar(1),					--W退學/X休學/Y在學/Z畢業
	通訊地址 varchar(50),
	更新時間 DateTime DEFAULT CONVERT(varchar, GETDATE(), 20)
);
CREATE TABLE 卡片
(
	卡號 int IDENTITY(1000000001,1) Primary Key,
	餘額 int,
	系所 varchar(20),
	帳戶類型 varchar(1),					--A綜合/L活/F定
	開通狀態 varchar(1),					--Y/N
	學號 char(9),							--和[個人資料]關聯使用
	更新時間 DateTime DEFAULT CONVERT(varchar, GETDATE(), 20)
);
CREATE TABLE 交易紀錄
(
	卡號 int,
	交易編號 UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL Primary Key, --使用UID/GUID來編碼
	簽約店家 varchar(10),
	交易類型 varchar(10),
	交易金額 int,
	更新時間 DateTime DEFAULT CONVERT(varchar, GETDATE(), 20) 
);

ALTER TABLE 交易紀錄
ADD CONSTRAINT FK_CardTrans
FOREIGN KEY (卡號) REFERENCES 卡片(卡號);

ALTER TABLE 卡片
ADD CONSTRAINT FK_PersonalCard
FOREIGN KEY (學號) REFERENCES 個人資料(學號);

--EXEC sp_helpconstraint 卡片
--EXEC sp_helpconstraint 交易紀錄

--題目2 注意資料表的相依性, 順序 個人資料-->卡片--->交易紀錄
INSERT INTO 個人資料
	(學號, 身份證字號, 姓氏, 名字, 生日, 性別, 在學狀態, 通訊地址)
VALUES
	('100185741', 'A123456789', '王', '小明', '20000101', 'M', 'Y', '台北市信義區忠孝東路五段7號'),
	('090174819', 'A234567890', '陳', '大同', '19990315', 'M', 'N', '台北市大安區仁愛路四段37號'),
	('345678901', 'A678105901', '林', '小花', '20010520', 'F', 'N', '新北市三峽區介壽路100號'),
	('906789012', 'A345234581', '李', '大雄', '20010520', 'M', 'N', '新北市樹林區學勤路555號'),
	('745678901', 'A247821971', '孔', '康康', '20010520', 'F', 'N', '新北市新店區民生路45號');

INSERT INTO 卡片
	(餘額, 系所, 帳戶類型, 開通狀態, 學號)
VALUES
	(50000,'資管系','A','Y','100185741'),	--1000000001
	(60000,'資管系','L','Y','090174819'),	--1000000002
	(5000,'資管系','A','Y','345678901'),	--1000000003
	(7000,'資管系','A','Y','906789012'),	--1000000004
	(10000,'資管系','F','Y','745678901');	--1000000005

INSERT INTO 交易紀錄
	(卡號,簽約店家,交易類型,交易金額)
VALUES
	(1000000001,'7-11','刷卡',120),
	(1000000001,'台灣之星','刷卡',499),
	(1000000001,'學餐','扣儲值卡',220),
	(1000000002,'阿給小吃','扣儲值卡',150),
	(1000000002,'米米湯','刷卡',65),
	(1000000002,'牛肉好吃店','扣儲值卡',220),
	(1000000003,'阿財鍋貼','扣儲值卡',310),
	(1000000003,'寶雅','刷卡',168),
	(1000000003,'區陳賜','扣儲值卡',79),
	(1000000004,'康是美','刷卡',85),
	(1000000004,'TNT&C','扣儲值卡',610),
	(1000000004,'久久吃一遍','刷卡',105),
	(1000000005,'全聯','刷卡',240),
	(1000000005,'COSTCO','刷卡',1050),
	(1000000005,'STARBAKE','刷卡',890);

UPDATE 個人資料
SET 通訊地址='台北市信義區松仁路58號'
OUTPUT deleted.通訊地址 原地址, inserted.通訊地址 更新後地址
WHERE 學號='100185741'

SELECT T.*, C.卡號 AS 卡號, (姓氏+SPACE(1)+名字) AS 姓名, (U.學號+'/'+CONVERT(varchar(100),生日,23)+'/'+性別) AS 基本資料
FROM 交易紀錄 T
LEFT JOIN 卡片 C ON C.卡號=T.卡號
LEFT JOIN 個人資料 U ON U.學號=C.學號
WHERE C.系所='資管系'

SELECT U.學號,COUNT(T.交易編號) AS 交易總次數, SUM(T.交易金額) AS 交易總金額 
FROM 交易紀錄 T
LEFT JOIN 卡片 C ON C.卡號=T.卡號
LEFT JOIN 個人資料 U ON U.學號=C.學號
GROUP BY U.學號
ORDER BY 交易總次數 DESC