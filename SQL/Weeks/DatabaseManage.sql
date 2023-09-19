--資料庫建立檔案群組設定參數
--1. 卸離資料庫
EXEC sp_detach_db BANKQ

ALTER DATABASE BANKQ SET SINGLE_USER WITH ROLLBACK IMMEDIATE
USE master
EXEC sp_detach_db BANKQ
USE master DROP database BANKQ

--管理者操作
USE master;
GO

--將資料庫BANKQ更改為單一使用者模式
--當指定 SINGLE_USER 時，每次只有一個使用者可以連接到資料庫。所有其他的使用者連接都會中斷。
ALTER DATABASE BANKQ
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--將資料庫BANKQ更改為唯獨
ALTER DATABASE BANKQ
SET READ_ONLY;
GO

--將資料庫BANKQ更改為非單一使用者模式
ALTER DATABASE BANKQ
SET MULTI_USER;
GO

--2. 附加資料庫
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

--練習
CREATE TABLE Customer
(
    個人帳號 char(20),
    姓氏 char(20),
    名字 char(20),
    生日 date,
    -- 0: female, 1: male, 2: others
    性別 int,
    通訊地址 char(50),
    城市 char(10),
    國籍 char (10),
    更新時間日期 datetime,
    異動人 char(20)
)
ON [PRIMARY]

CREATE TABLE Account
(
    --銀行帳號
    AccID char(20),
    --銀行代號
    BankID char(20),
    --個人帳戶  
    UserID char(20),
    --餘額 
    Balance int,
    --分行帳號  
    Branch_ID char(20),
    --帳戶類型: 1:活存, 2: 定存 
    AccType int,
    -- 更新時間日期 
    UpDateTime datetime,
    -- 異動人
    UPDateID char(20)
)
ON [Bank_FG1] --儲存體看有無變更

CREATE TABLE Test1
(
	UserName char(20) Primary Key,
	UserType int
)
GO

--3. 附加資料庫(使用Stored Procedure: sp_attach_db)
EXEC sp_attach_db @dbname = N'BANKQ', @filename1 = N'D:\MSSQL_DB\BANKQ_Prm.mdf'

--4. 備份資料庫
BACKUP DATABASE BANKQ TO DISK = 'D:\MSSQL_DB\backups\BANKQ.bak';

--5. 還原資料庫
RESTORE DATABASE BANKQ FROM DISK = 'D:\MSSQL_DB\backups\BANKQ.bak'

--6.卸離資料庫
EXEC sp_detach_db BANKQ

--7.附加資料庫(FOR ATTACH)，包含:指定DB檔與LOG檔
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

--8. 新建資料庫與設定參數，包含: 檔案群組(FILEGROUP)以及記錄檔(LOG)
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