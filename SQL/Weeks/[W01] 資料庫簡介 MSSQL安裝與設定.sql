/*
### �H��m�� 1
1. �w��SQL Server Express - ���I: https://www.microsoft.com/zh-TW/download/details.aspx?id=56840
2. �w��SQL Servert Management Studio (SSMS) - ���I:https://docs.microsoft.com/zh-tw/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15
 
### �H��m�� 2
1. �зs�W�@�Ӹ�ƮwNTUNHS_IM
2. �ö}��SSMS�A�s�W�ӤH�Ǹ����b���ó]�w�K�XILoveNTUNHS�A���w����s��NTUNHS_IM��Ʈw
3. �s�W�@�����ҼҦ��u SQL Server ���ҡv ��SQL�b���A�ö}�ҳ]�w�}��TCP/IP �~���s�� (�^�a�ۦ��s)
4. �ϥΫ��w�b���A�}�Ҩϥ�SSMS�A�å�IP�s�u�i�����(�^�a�ۦ��s)
 
### �H��m�� 3
1. �إ�NTUNHS_IM��Ʈw��A�s�W�@�Ӫ��A�ô��J�@����ƫ�A����ܥX��
*/
 
### �d�ҵ{��
--1. �s�W��Ʈw
CREATE DATABASE NTUNHS_IM;
--2. �s�W��Ʈw-�ˬd�O�_�s�b
IF DB_ID ( 'NTUNHS_IM' ) IS NOT NULL
  DROP DATABASE NTUNHS_IM;
GO
CREATE DATABASE NTUNHS_IM;  
GO
--3. �s�WTable
USE NTUNHS_IM;
CREATE TABLE Customer
(
    FName char(50),
    LName char(50),
    Address char(50),
    City char(50),
    Country char(25),
    BDate datetime
);
--4. ���J5����Ʀ�Table
-- �Ĥ@��
INSERT INTO Customer
    (FName, LName, Address, City, Country, BDate)
VALUES
    ('CY', 'Lien', 'NTUNHS', 'Taiepi', 'Taiwan', '19800101');
-- �ĤG��
INSERT INTO Customer
    (FName, LName, Address, City, Country, BDate)
VALUES
    ('AAA', 'Fu', 'NTU', 'Taipei', 'Taiwan', '20010301');
-- �ĤT��
INSERT INTO Customer
    (FName, LName, Address, City, Country, BDate)
VALUES
    ('GY', 'Chen', 'FJU', 'New Taipei City', 'Taiwan', '20010801');
-- �ĥ|��
INSERT INTO Customer
    (FName, LName, Address, City, Country, BDate)
VALUES
    ('KK', 'Wang', 'NCKU', 'Tainan', 'Taiwan', '19950630');
-- �Ĥ���
INSERT INTO Customer
    (FName, LName, Address, City, Country, BDate)
VALUES
    ('NC', 'Lin', 'NUTC', 'Taichung', 'Taiwan', '19970515');
--5. �d�ߩҦ����
SELECT *
FROM Customer
--6. �d�ߦb�x�_�����Ҧ����
SELECT *
FROM Customer
WHERE City ='Taipei'
--7. �d�ߦb�x�_���B�ͤ�j��1997�~���Ҧ����
SELECT *
FROM Customer
WHERE City ='Taipei' AND BDate >'19970101'
--8. ��s�@�����
UPDATE Customer
SET BDate='19980515'
WHERE City ='NC' AND LName='Lin'
--9. �R���@�����
DELETE FROM Customer
WHERE City ='NC' AND LName='Lin'
--10. �W�[���&�]�w�w�]��
ALTER TABLE Customer ADD Sex CHAR(1) DEFAULT 'U'
--11. �R�����
ALTER TABLE Products DROP COLUMN ProductName
--12. �ק�
--12.1 ���j�p���A
USE NTUHNS_IM;
IF DB_ID ( N'NTUHNS_IM' ) IS NOT NULL
ALTER TABLE Customer ALTER COLUMN FName char(30);
GO
--12.2 �ק����W��
USE NTUHNS_IM;
IF DB_ID ( N'NTUHNS_IM' ) IS NOT NULL
EXEC sp_RENAME 'Customer.FName', 'FirstName', 'COLUMN'
GO
--12.3. �ק����w�]��
--12.3.1 �ˬd���L���ƪ�����(Constraint):
--NULL ([���\�ŭ�)�BNOT NULL  (�D�ŭ�)
--UNIQUE  (�ߤ@��)
--CHECK (�Ҧp: �u��j��0):  CHECK (ID > 0),  ( MySQL�S��CHECK)
--��L:
--Primary key
--Foreign key
--DEFAULT
--�d�ߪ���(�q�`��Table)�����������
EXEC sp_helpconstraint @objname = 'Customer'
--12.3.2  �����ƭ���ݭn���R��
ALTER TABLE Customer DROP CONSTRAINT Sex
ALTER TABLE Customer DROP CONSTRAINT DF__Customer__Sex__49C3F6B7
--12.3.3 ���s�إ�Constraint
ALTER TABLE Customer ADD CONSTRAINT Sex DEFAULT 'F' FOR Sex
--13. �M����ƪ�
TRUNCATE TABLE Customer
--14. UPDATE���(���w����)
UPDATE Customer SET BDate='19980515' WHERE ID ='001'
--15. DELETE���(���w����)
DELETE FROM Customer
WHERE  ID ='001'
--16. �d�ߨ�Ӫ��ÿ�X�{�@�ӵ��G
SELECT A.ID, B.BDate
FROM IDTable AS A, Customer AS B
WHERE A.ID=B.ID