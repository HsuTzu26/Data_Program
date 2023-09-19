--��Ʈw�إ��ɮ׸s�ճ]�w�Ѽ�
--1. ������Ʈw
EXEC sp_detach_db BANK
--2. ���[��Ʈw
CREATE DATABASE BANK
ON PRIMARY
  ( NAME='BANK_Primary',
    FILENAME=
       'D:\MSSQL_DB\Bank_Prm.mdf',
    SIZE=4MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB)
FOR ATTACH;
--3. ���[��Ʈw(�ϥ�SP)
EXEC sp_attach_db @dbname = N'BANK', @filename1 = N'D:\MSSQL_DB\Bank_Prm.mdf'
--4. �ƥ���Ʈw
BACKUP DATABASE BANK TO DISK = 'D:\backups\BANK.bak';
--5. �٭��Ʈw
RESTORE DATABASE BANK FROM DISK = 'D:\backups\BANK.bak'
--6.������Ʈw
EXEC sp_detach_db BANK
--7.���[��Ʈw
CREATE DATABASE BANK
ON PRIMARY
( NAME='BANK_Primary',
  FILENAME=
   'D:\DB\BANK.mdf'
)
LOG ON
  ( NAME='BANK_log',
    FILENAME =
        'D:\DB\BANK_log.ldf'
)
FOR ATTACH;
--8. �s�ظ�Ʈw�P�]�w�ѼơA�]�t: �ɮ׸s��(filegroup)�H�ΰO����(log)
CREATE DATABASE BANK
ON PRIMARY
  ( NAME='BANK_Primary',
    FILENAME=
       'D:\MSSQL_DB\Bank_Prm.mdf',
    SIZE=4MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
FILEGROUP Bank_FG1
  ( NAME = 'Bank_FG1_Dat1',
    FILENAME =
       'D:\MSSQL_DB\MyDB_FG1_1.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
  ( NAME = 'Bank_FG1_Dat2',
    FILENAME =
        'D:\MSSQL_DB\MyDB_FG1_2.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB)
LOG ON
  ( NAME='BANK_log',
    FILENAME =
        'D:\MSSQL_DB\BANK.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB);
GO