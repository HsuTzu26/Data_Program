--��Ʈw�إ��ɮ׸s�ճ]�w�Ѽ�
--1. ������Ʈw
EXEC sp_detach_db BANKQ

ALTER DATABASE BANKQ SET SINGLE_USER WITH ROLLBACK IMMEDIATE
USE master
EXEC sp_detach_db BANKQ
USE master DROP database BANKQ

--�޲z�̾ާ@
USE master;
GO

--�N��ƮwBANKQ��אּ��@�ϥΪ̼Ҧ�
--����w SINGLE_USER �ɡA�C���u���@�ӨϥΪ̥i�H�s�����Ʈw�C�Ҧ���L���ϥΪ̳s�����|���_�C
ALTER DATABASE BANKQ
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--�N��ƮwBANKQ��אּ�߿W
ALTER DATABASE BANKQ
SET READ_ONLY;
GO

--�N��ƮwBANKQ��אּ�D��@�ϥΪ̼Ҧ�
ALTER DATABASE BANKQ
SET MULTI_USER;
GO

--2. ���[��Ʈw
CREATE DATABASE BANKQ
ON PRIMARY
  ( NAME='BANKQ_Primary',
    FILENAME=
       'D:\MSSQL_DB\BANKQ_Prm.mdf',
    SIZE=24MB,
    MAXSIZE=64MB,
    FILEGROWTH=1MB)
FOR ATTACH;

USE BANKQ

--�m��
CREATE TABLE Customer
(
    �ӤH�b�� char(20),
    �m�� char(20),
    �W�r char(20),
    �ͤ� date,
    -- 0: female, 1: male, 2: others
    �ʧO int,
    �q�T�a�} char(50),
    ���� char(10),
    ���y char (10),
    ��s�ɶ���� datetime,
    ���ʤH char(20)
)
ON [PRIMARY]

CREATE TABLE Account
(
    --�Ȧ�b��
    AccID char(20),
    --�Ȧ�N��
    BankID char(20),
    --�ӤH�b��  
    UserID char(20),
    --�l�B 
    Balance int,
    --����b��  
    Branch_ID char(20),
    --�b������: 1:���s, 2: �w�s 
    AccType int,
    -- ��s�ɶ���� 
    UpDateTime datetime,
    -- ���ʤH
    UPDateID char(20)
)
ON [Bank_FG1] --�x�s��ݦ��L�ܧ�

CREATE TABLE Test1
(
	UserName char(20) Primary Key,
	UserType int
)
GO

--3. ���[��Ʈw(�ϥ�Stored Procedure: sp_attach_db)
EXEC sp_attach_db @dbname = N'BANKQ', @filename1 = N'D:\MSSQL_DB\BANKQ_Prm.mdf'

--4. �ƥ���Ʈw
BACKUP DATABASE BANKQ TO DISK = 'D:\MSSQL_DB\backups\BANKQ.bak';

--5. �٭��Ʈw
RESTORE DATABASE BANKQ FROM DISK = 'D:\MSSQL_DB\backups\BANKQ.bak'

--6.������Ʈw
EXEC sp_detach_db BANKQ

--7.���[��Ʈw(FOR ATTACH)�A�]�t:���wDB�ɻPLOG��
CREATE DATABASE BANKQ
ON PRIMARY
( NAME='BANKQ_Primary',
  FILENAME=
   'D:\DB\BANKQ.mdf'
)
LOG ON
  ( NAME='BANKQ_log',
    FILENAME =
        'D:\DB\BANKQ_log.ldf'
)
FOR ATTACH;

--8. �s�ظ�Ʈw�P�]�w�ѼơA�]�t: �ɮ׸s��(FILEGROUP)�H�ΰO����(LOG)
CREATE DATABASE BANKQ
ON PRIMARY
  ( NAME='BANKQ_Primary',
    FILENAME=
       'D:\MSSQL_DB\BANKQ_Prm.mdf',
    SIZE=24MB,
    MAXSIZE=64MB,
    FILEGROWTH=1MB),
FILEGROUP Bank_FG1
  ( NAME = 'Bank_FG1_Dat1',
    FILENAME =
       'D:\MSSQL_DB\MyDB_FG1_1.ndf',
    SIZE=24MB,
    MAXSIZE=64MB,
    FILEGROWTH=1MB),
  ( NAME = 'Bank_FG1_Dat2',
    FILENAME =
        'D:\MSSQL_DB\MyDB_FG1_2.ndf',
    SIZE=24MB,
    MAXSIZE=64MB,
    FILEGROWTH=1MB)
LOG ON
  ( NAME='BANK_log',
    FILENAME =
        'D:\MSSQL_DB\BANKQ.ldf',
    SIZE=24MB,
    MAXSIZE=64MB,
    FILEGROWTH=1MB);
GO