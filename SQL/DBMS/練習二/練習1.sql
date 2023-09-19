/*
### �m��1
����:�y�_�@�ǥͷ|�z����s�@�@�M�y�@�D�F(WhoPanda)�d�z�t�ΡA���ѷ|���P�ɿ�ܦh�ӯS�����a�ӫ~���u�W�q�\�P�~�e�A�ȡA
�Ҧp: �|���i�P�ɿ�ܭq�ʡu�j�T�����۵P���v�H�Ρu���]��K��10����K�v�A�M��A�~�e����w�e�\�a�I�F�i�ϥβ{���x�ȻP�q�l�I�ڨt�ΡA
�i�����x�Ȫ��B�y�C�d�BLINE Pay�B�H�Υd���h�إI�ڥ\��F�i�d�ߥثe�q����v�����A�Ҧp: �w����B�t�e���B�w�e�F�B�w�������h�ت��A�C
 
�г]�p�ܤ֤��Ӹ�ƪ�A�ϥ�CREATE TABLE�y�k�إ߸�ƪ�A���w�D��(Primary Key)�åH�X�A�����i����ƪ����p�A
�]�t: (1) �|�����(Member)�B(2)�I�ڤ覡(Payment)�B(3)�ӫ~(Product)�B(4) �q��(Order)�B�H��(5)���(Trans)
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

CREATE TABLE Payment --�d��
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
	(1, 1, '���]', '��K', 7),
	(2, 2, '�j�T��', '�۵P��', 100),
	(3, 3, '���J', '�W��i����', 80),
	(4, 2, '�j�T��', '���ƶ�', 120),
	(5, 2, '�j�T��', '���L��', 120)

SELECT 
Order_items.OI_ID AS ID,
Order_items.O_ID AS O_ID,
Order_items.Add_date AS Odate,
Order_items.P_ID AS P_ID,
Order_items.Quantity AS �ƶq
FROM Order_items

--RTRIM �h���r�꥽�q�Ů�
SELECT 
Product.Pro_ID AS ID,
(CONVERT(varchar, Product.Sh_ID) + '(' + RTRIM(Product.Sh_name) + ')') AS ���a�W��_ID,
Product.Product_name AS "NAME",
Product.Price
FROM Product
