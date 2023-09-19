/*## ����
1. �N����mdf���[��MSSQL��
2. �бN�Ҧ��H��m�ߪ��y�k�A�x�s�b�P�@�ɮסA�W��HW2.sql
 
### 1. �s�W��ƪ�(insert)
- �H��m��1:�бN[�X�f�O��].[�s��]IDENTITY�����A�ä�ʷs�W�@����� (10)
- �H��m��2:�зs�W[���u]���A¾�쬰 "��ƭ�"����Ʀ�[�ϮѫǭɥΰO��] (10)
- �H��m��3:�бNSQL���w�q����ƫ��Aint, smallint, char, vchar��TYPE_NAME, PRECISION, DATA_TYPE����T���ۭq�Ȧs��ƪ�A����ܵ��G (10)
  -- ����1�G�ϥΡ@sp_datatype_info
  -- ����2�G�ۭq�Ȧs����ƫ��A�ݻPsp_datatype_info�d�ߵ��G������ƫ��A�۲�
- �H��m��4:���[�X�f�O��]�P[�Ȥ�]��ƪ��Ҧ�����ƪ�A��ܤ��୫�����A�N�p���H���m��'��'���p���H��ܥX�� (10)
- �H��m��5:�бN�H��m��4�����G���s�W��ƪ�[�ԲӭɥΰO��]�� (10)
 
### 2. �ק��ƪ�(update)
- �H��m��6 �Ϯ��]���o�{���e�g�z�ɪ��Ҧ����y���֬����@���A�бN���G��s��[�ϮѫǭɥΰO��] (10)
- �H��m��7 �ЧR��[���x��]��ú��۶Ǫ���� (10)
 
### ��X�m��
- �H��m��8 (30)
 - 1. �g�z�ɤF���y���Ҧ��H�S���ɹL���ѡA�бN�O������T�s�W��[�ϮѫǭɥΰO��]
 - 2. �N��ʪ��������Ҧ����O���b�@�ӷs�W�Ȧs��ƪ� */
 
use master;
DROP DATABASE HW_2

 --���[��Ʈw
USE master;
IF DB_ID ( 'HW_2' ) IS NOT NULL
	DROP DATABASE HW_2
GO
CREATE DATABASE HW_2
ON PRIMARY
(
	NAME = 'HOMEWORK2_Primary',
	FILENAME='C:\Data_Program\SQL\DBMS\�@�~�G\record�m��08.mdf'
)
FOR ATTACH
GO
/*
### 1. �s�W��ƪ�(insert)
- �H��m��1:�бN[�X�f�O��].[�s��]IDENTITY�����A�ä�ʷs�W�@����� (10)
- �H��m��2:�зs�W[���u]���A¾�쬰 "��ƭ�"����Ʀ�[�ϮѫǭɥΰO��] (10)
- �H��m��3:�бNSQL���w�q����ƫ��Aint, smallint, char, vchar��TYPE_NAME, PRECISION, DATA_TYPE����T���ۭq�Ȧs��ƪ�A����ܵ��G (10)
  -- ����1�G�ϥΡ@sp_datatype_info
  -- ����2�G�ۭq�Ȧs����ƫ��A�ݻPsp_datatype_info�d�ߵ��G������ƫ��A�۲�
- �H��m��4:���[�X�f�O��]�P[�Ȥ�]��ƪ��Ҧ�����ƪ�A��ܤ��୫�����A�N�p���H���m��'��'���p���H��ܥX�� (10)
- �H��m��5:�бN�H��m��4�����G���s�W��ƪ�[�ԲӭɥΰO��]�� (10)
*/

USE HW_2;

-- �H��m��1:�бN[�X�f�O��].[�s��]IDENTITY�����A�ä�ʷs�W�@����� (10)
SELECT * FROM �X�f�O��

SET IDENTITY_INSERT �X�f�O�� ON

INSERT INTO �X�f�O��
	(�s��, ���, �Ȥ�W��, �ѦW, �ƶq)
VALUES
	(9, GETDATE(), '�@�@�ѧ�', '�ڤ��ѫܶ}��99', 11)

SET IDENTITY_INSERT �X�f�O�� OFF
SELECT * FROM �X�f�O��

-- �H��m��2:�зs�W[���u]���A¾�쬰 "��ƭ�"����Ʀ�[�ϮѫǭɥΰO��] (10)
SET IDENTITY_INSERT �ϮѫǭɥΰO�� OFF

SELECT * FROM ���u
SELECT * FROM �ϮѫǭɥΰO��

INSERT INTO �ϮѫǭɥΰO��
			(���u�s��, �ѦW)
SELECT A.�s��, B.�ѦW
FROM ���u AS A, �ϮѫǭɥΰO�� AS B
WHERE A.�s�� = B.���u�s�� AND A.¾�� = '��ƭ�'


SELECT * FROM ���u
SELECT * FROM �ϮѫǭɥΰO��

-- �H��m��3:�бNSQL���w�q����ƫ��Aint, smallint, char, vchar��TYPE_NAME, PRECISION, DATA_TYPE����T���ۭq�Ȧs��ƪ�A����ܵ��G (10)
  -- ����1�G�ϥΡ@sp_datatype_info
  -- ����2�G�ۭq�Ȧs����ƫ��A�ݻPsp_datatype_info�d�ߵ��G������ƫ��A�۲�
EXEC sp_datatype_info

CREATE TABLE #TEMP
(
    TYPE_NAME nvarchar(24) ,
	DATA_TYPE smallint,
    PRECISION int ,
    LITERAL_PREFIX varchar(24),
	 LITERAL_SUFFIX varchar(24),
	 CREATE_PARAMS varchar(24),
	 NULLABLE bit,
	 CASE_SENSITIVE bit,
	 SEARCHABLE smallint,
	 UNSIGNED_ATTRIBUTE bit,
	 MONEY bit,
	 AUTO_INCREMENT bit,
	 LOCAL_TYPE_NAME nvarchar(24) ,
	 MINIMUM_SCALE smallint,
	 MAXIMUM_SCALE smallint,
	 SQL_DATA_TYPE smallint,
	 SQL_DATETIME_SUB smallint,
	 NUM_PREC_RADIX smallint,
	 INTERVAL_PRECISION smallint,
	 USERTYPE smallint
)
GO

INSERT #TEMP
EXEC sp_datatype_info

SELECT * FROM #TEMP

CREATE TABLE #DATATYPEDB
(
	TYPE_NAME nvarchar(24) ,
	PRECISION int ,
	DATA_TYPE smallint,
)

INSERT #DATATYPEDB
SELECT TYPE_NAME, PRECISION, DATA_TYPE
FROM #TEMP
WHERE TYPE_NAME='int' OR TYPE_NAME='smallint' OR TYPE_NAME='char' OR TYPE_NAME='varchar'

SELECT * FROM #DATATYPEDB

-- �H��m��4:���[�X�f�O��]�P[�Ȥ�]��ƪ��Ҧ�����ƪ�A��ܤ��୫�����A�N�p���H���m��'��'���p���H��ܥX�� (10)
-- WHERE���󤤪�LIKE�y�k 
SELECT  �Ȥ�.�Ȥ�s��, �Ȥ�.�Ȥ�W��, �Ȥ�.�p���H, �Ȥ�.�a�}, �Ȥ�.�q��, �X�f�O��.�s��
AS �q��s��, �X�f�O��.���, �X�f�O��.�ѦW, �X�f�O��.�ƶq
FROM �Ȥ� 
LEFT JOIN �X�f�O��
ON �Ȥ�.�Ȥ�W�� = �X�f�O��.�Ȥ�W��
WHERE �Ȥ�.�p���H LIKE ('��%')

--DROP TABLE �ԲӭɥΰO��
-- �H��m��5:�бN�H��m��4�����G���s�W��ƪ�[�ԲӭɥΰO��]�� (10)
CREATE TABLE �ԲӭɥΰO��
(
	 �Ȥ�s�� int,
	 �Ȥ�W�� varchar(20),
	 �p���H varchar(20),
	 �a�} nvarchar(50),
	 �q�� int,
	 �q��s�� int,
	 ��� datetime,
	 �ѦW varchar(20),
	 �ƶq int
)
SELECT * FROM �ԲӭɥΰO��

INSERT �ԲӭɥΰO��
SELECT �Ȥ�.�Ȥ�s��, �Ȥ�.�Ȥ�W��, �Ȥ�.�p���H, �Ȥ�.�a�}, �Ȥ�.�q��, �X�f�O��.�s��
AS �q��s��,�X�f�O��.���,�X�f�O��.�ѦW,�X�f�O��.�ƶq
FROM �Ȥ� 
LEFT JOIN �X�f�O��
on �Ȥ�.�Ȥ�W�� = �X�f�O��.�Ȥ�W��
WHERE �Ȥ�.�p���H LIKE ('��%')

SELECT * FROM �ԲӭɥΰO��


-----------------------------------------
/*
### 2. �ק��ƪ�(update)
- �H��m��6 �Ϯ��]���o�{���e�g�z�ɪ��Ҧ����y���֬����@���A�бN���G��s��[�ϮѫǭɥΰO��] (10)
- �H��m��7 �ЧR��[���x��]��ú��۶Ǫ���� (10)
*/

--�H��m��6 �Ϯ��]���o�{���e�g�z�ɪ��Ҧ����y���֬����@���A�бN���G��s��[�ϮѫǭɥΰO��]
SELECT* FROM ���u
SELECT* FROM �ϮѫǭɥΰO��

UPDATE  �ϮѫǭɥΰO��
SET     �ƶq = �ƶq + 1 ,
        ���� = '�g�z�ɪ����y�֬���'
WHERE   ���u�s�� = 2

SELECT* FROM �ϮѫǭɥΰO��

-- �H��m��7 �ЧR��[���x��]��ú��۶Ǫ���� (10)
SELECT * FROM ���x��

DELETE ���x��
WHERE �۶� IS NULL

SELECT * FROM ���x��

----------------------------------------
-- ### �H��m��8 ��X�m�� 
-- 1. �g�z�ɤF���y���Ҧ��H�S���ɹL���ѡA�бN�O������T�s�W��[�ϮѫǭɥΰO��]
-- 2. �N��ʪ��������Ҧ����O���b�@�ӷs�W�Ȧs��ƪ�
SELECT * FROM �ϮѫǭɥΰO��
SELECT * FROM ���y

SELECT DISTINCT �ѦW
FROM �ϮѫǭɥΰO�� AS A
JOIN ���y AS B on (A.�ѦW != B.���y�W��)
WHERE B.���y�W�� NOT IN(SELECT �ѦW FROM �ϮѫǭɥΰO��)

CREATE TABLE #BOOK
(
�s�� int,
���u�s�� int,
�ѦW varchar(20),
�ƶq int,
�k�٤�� datetime,
���� varchar(50)
)
SELECT* FROM #BOOK

INSERT �ϮѫǭɥΰO��(���u�s��, �ѦW)
output inserted.���u�s��, inserted.�ѦW into #BOOK(���u�s��,�ѦW)
SELECT DISTINCT '2',�ѦW
FROM �ϮѫǭɥΰO�� AS A
JOIN ���y AS B on (A.�ѦW != B.���y�W��)
WHERE B.���y�W�� NOT IN(SELECT �ѦW FROM �ϮѫǭɥΰO��)



/*UPDATE �ϮѫǭɥΰO��
SET     ���� = '�g�z�ɤF�Ҧ��H�S���ɹL����'
WHERE   ���u�s�� = 2

SELECT* FROM �ϮѫǭɥΰO��

--DROP TABLE #BOOK
CREATE TABLE #BOOK
(
�s�� int,
���u�s�� int,
�ѦW varchar(20),
�ƶq int,
�k�٤�� datetime,
���� varchar(50)
)
SELECT* FROM #BOOK

UPDATE �ϮѫǭɥΰO��
SET ���u�s�� = '2'
OUTPUT INSERTED.�s��, INSERTED.���u�s��, INSERTED.�ѦW,
	   INSERTED.�ƶq, INSERTED.�k�٤��, INSERTED.���� 
INTO #BOOK (�s��, ���u�s��, �ѦW, �ƶq ,�k�٤��, ����)
WHERE ���u�s�� = '2'

SELECT* FROM #BOOK*/
