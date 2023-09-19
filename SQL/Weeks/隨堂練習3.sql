/*
### �H��m�� 3
1. �إ�NTUNHS_IM��Ʈw��A�s�W�@�Ӫ��A�ô��J�@����ƫ�A����ܥX��
*/
-- 01�s�W��Ʈw
CREATE DATABASE NTUNHS_IM

-- 02�s�W��Ʈw���ˬd�O�_�s�b
IF DB_ID('NTUNHS_IM') IS NOT NULL
	DROP DATABASE NTUNHS_IM;
GO
CREATE DATABASE NTUNHS_IM;
GO

-- 03�s�WTABLE
USE NTUNHS_IM
DROP TABLE Customer
CREATE TABLE Customer
(
    First_Name char(50),
    Last_Name char(50),
    Address char(50),
    City char(50),
    Country char(25),
    Birth_Date datetime	
);

-- 04���J�@�����
-- �s�W��k1
/*
INSERT INTO Customer
	(First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES
	('HSUTZU', 'HSU', 'NewTaipei', 'Taiwan', '20021126');
INSERT INTO Customer
	(First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES
	('LAND', 'LALA', 'Taipei', 'TaiNan', '20010106');
*/

-- �s�W��k2
INSERT INTO Customer
	(First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES 
	('HSUTZU', 'HSU', 'NewTaipei', 'NewTaipei', 'Taiwan', '2002-11-26'),
	('LAND', 'LALA', 'Taipei', 'Taipei', 'Taiwan', '2001-01-06'),
	('GAGA', 'WU', 'Taichung', 'Taichung', 'Taiwan', '1999-07-07'),
	('TRAIN', 'HEAD', 'Xinchu', 'Xinchu', 'Taiwan', '2011-10-07'),
	('LUXI', 'Lien', 'Hualien', 'Hualien', 'Taiwan', '1997-06-07')

-- 05�d�ߩҦ����
SELECT *
FROM Customer

-- 06�d�ߦb�x�_�����Ҧ����
SELECT *
FROM Customer
WHERE City = 'Taipei'

-- 07�d�ߦb�x�_���B�ͤ�j��1997�~���Ҧ����
SELECT *
FROM Customer
WHERE City = 'Taipei' AND Birth_Date > '1997-01-01'

-- 08��s�@�����
UPDATE Customer
SET Birth_Date = '1998-06-16'
WHERE City = 'Taipei' AND Last_Name = 'LALA'

-- 09�R���@�����
DELETE FROM Customer
WHERE City = 'Taipei' AND Last_Name = 'LALA'

-- 10�W�[��� & �]�w�w�]��
ALTER TABLE Customer ADD Gender char(1) DEFAULT 'U'
-- 11�R�����
ALTER TABLE Products DROP COLUMN ProductName

-- 12�ק�
-- 12.1 ���j�p���A
USE NTUNHS_IM;
IF DB_ID('NTUNHS_IM') IS NOT NULL
ALTER TABLE Customer ALTER COLUMN First_Name char(30);
GO
-- 12.2 �ק����W��
USE NTUNHS_IM;
IF DB_ID('NTUNHS_IM') IS NOT NULL
EXEC sp_rename 'Customer.First_Name', 'FirstName', 'COLUMN'
GO
-- 12.3 �ק����w�]��
-- 12.3.1 �ˬd���L���ƪ�����(Constraint):
--NULL ([���\�ŭ�)�BNOT NULL  (�D�ŭ�)
--UNIQUE  (�ߤ@��)
--CHECK (�Ҧp: �u��j��0):  CHECK (ID > 0),  ( MySQL�S��CHECK)
--��L:
--Primary key
--Foreign key
--DEFAULT
--�d�ߪ���(�q�`��Table)�����������
EXEC sp_helpconstraint @objname = 'Customer'
-- 12.3.2 �����ƭ���ݭn���R��
ALTER TABLE Customer DROP CONSTRAINT Gender --�Y���w�]��,�|������������D
ALTER TABLE Customer DROP CONSTRAINT DF__Customer__Gender__49C3F6B7
-- 12.3.3 ���s�إ�Constraint
ALTER TABLE Customer ADD CONSTRAINT Gender DEFAULT 'F' FOR Gender
-- 13 �M����ƪ�
TRUNCATE TABLE Customer
-- 14 UPDATE���(���w����)
UPDATE Customer SET Birth_Date = '1999-07-07' WHERE ID = '001'
-- 15 DELETE���(���w����)
DELETE FROM Customer
WHERE ID = '001'
--16 �d�ߨ�Ӫ��ÿ�X���@�ӵ��G
SELECT A.ID, B.Birth_Date
FROM IDTABLE AS A, Customer AS B
WHER A.ID = B.ID