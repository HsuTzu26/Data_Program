/*
### 練習1
說明:『北護學生會』期望製作一套『護胖達(WhoPanda)卡』系統，提供會員同時選擇多個特約店家商品的線上訂餐與外送服務，
例如: 會員可同時選擇訂購「大三元的招牌飯」以及「阿財鍋貼的10顆鍋貼」，然後再外送到指定送餐地點；可使用現金儲值與電子付款系統，
可提供儲值金、悠遊卡、LINE Pay、信用卡等多種付款功能；可查詢目前訂單歷史紀錄，例如: 已收單、配送中、已送達、已取消等多種狀態。
 
請設計至少五個資料表，使用CREATE TABLE語法建立資料表，指定主鍵(Primary Key)並以合適的欄位進行跨資料表關聯，
包含: (1) 會員資料(Member)、(2)付款方式(Payment)、(3)商品(Product)、(4) 訂單(Order)、以及(5)交易(Trans)
*/

USE master;

if DB_ID('WhoPanda') is not null
	DROP DATABASE WhoPanda
GO
CREATE DATABASE WhoPanda
GO

USE WhoPanda;

CREATE TABLE Member
(
	M_ID int PRIMARY KEY,
	Member_name char(20),
	Department int,
	MType int
)

CREATE TABLE Payment --卡片
(
	P_ID int PRIMARY KEY,
	Pay_name char(20),
	PNumber int,
	M_ID int,
	FOREIGN KEY (M_ID) REFERENCES Member(M_ID)
)
--M_ID FK

CREATE TABLE Orders
(
	O_ID int PRIMARY KEY,
	O_date datetime,
	O_state int,
	O_Price int,
	Modify_date datetime,
	P_ID int,
	FOREIGN KEY (P_ID) REFERENCES Payment(P_ID)
)
--P_ID

CREATE TABLE Order_items
(
	OI_ID int,
	Add_date datetime,
	Quantity int,
	O_ID int,
	P_ID int,
	FOREIGN KEY (O_ID) REFERENCES Orders(O_ID),
	FOREIGN KEY (P_ID) REFERENCES Payment(P_ID)
)
--O_ID
--P_ID

CREATE TABLE Trans
(
	T_ID int PRIMARY KEY,
	T_type int,
	T_date datetime,
	O_ID int,
	O_state int,
	FOREIGN KEY (O_ID) REFERENCES Orders(O_ID)
)
--O_ID

CREATE TABLE Product
(
	Pro_ID int PRIMARY KEY,
	Sh_ID int,
	Sh_name char(20),
	Product_name char(20),
	Price  int
)

insert into Orders(O_ID)
values(1)
insert into Payment(P_ID)
values(1),(3),(5)

INSERT INTO Order_items
	(OI_ID, O_ID, Add_date, P_ID, Quantity)
VALUES
	(1,1,'2022-04-25',1,5),
	(1,1,'2022-04-25',3,2),
	(1,1,'2022-04-25',5,3)

INSERT INTO Product
	(Pro_ID, Sh_ID, Sh_name, Product_name, Price)
VALUES
	(1, 1, '阿財', '鍋貼', 7),
	(2, 2, '大三元', '招牌飯', 100),
	(3, 3, '派克', '超營養雞排', 80),
	(4, 2, '大三元', '雞排飯', 120),
	(5, 2, '大三元', '雞腿飯', 120)

SELECT 
Order_items.OI_ID AS ID,
Order_items.O_ID AS O_ID,
Order_items.Add_date AS Odate,
Order_items.P_ID AS P_ID,
Order_items.Quantity AS 數量
FROM Order_items

--RTRIM 去除字串末段空格
SELECT 
Product.Pro_ID AS ID,
(CONVERT(varchar, Product.Sh_ID) + '(' + RTRIM(Product.Sh_name) + ')') AS 店家名稱_ID,
Product.Product_name AS "NAME",
Product.Price
FROM Product
