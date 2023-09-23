DROP DATABASE HW2
CREATE DATABASE HW2
ON PRIMARY
(
 name='WH2',
 filename='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\�m��08.mdf'
)
FOR ATTACH
GO

USE HW2
--DELETE FROM �X�f�O�� WHERE �s��=0;
-- �H��m��1:�бN[�X�f�O��].[�s��]IDENTITY�����A�ä�ʷs�W�@�����
-- IDENTITY_INSERT ON
SET IDENTITY_INSERT �X�f�O�� ON
INSERT �X�f�O�� ( �s��,���,�Ȥ�W��,�ѦW,�ƶq)
VALUES ( 0, GETDATE(), '�ѤѮѧ�','Windows����',10)

-- IDENTITY_INSERT OFF
SET IDENTITY_INSERT �X�f�O�� OFF
SELECT *
FROM �X�f�O��

USE HW2
--�H��m��2:�зs�W[���u]���A¾�쬰 "��ƭ�"����Ʀ�[�ϮѫǭɥΰO��] 
INSERT �ϮѫǭɥΰO��(���u�s��,�ѦW)
SELECT ���u.�s��,'Word�ϥΤ�U'
FROM   ���u
WHERE  ¾�� = '��ƭ�';

-- �H��m��3:�бNSQL���w�q����ƫ��Aint, smallint, char, vchar��TYPE_NAME, PRECISION, DATA_TYPE����T���ۭq�Ȧs��ƪ�A����ܵ��G (10)
  -- ����1�G�ϥΡ@sp_datatype_info
  -- ����2�G�ۭq�Ȧs����ƫ��A�ݻPsp_datatype_info�d�ߵ��G������ƫ��A�۲�
  EXEC sp_datatype_info
--DROP TABLE #temp
CREATE TABLE #temp
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
go

INSERT  #temp
EXEC sp_datatype_info

CREATE TABLE #DATATYPEDB
(
	TYPE_NAME nvarchar(24) ,
 PRECISION int ,
 DATA_TYPE smallint,
)

--DROP TABLE #DATATYPEDB
INSERT #DATATYPEDB
SELECT TYPE_NAME,PRECISION ,DATA_TYPE
FROM #temp
WHERE TYPE_NAME='int' or TYPE_NAME='smallint' or TYPE_NAME='char' or TYPE_NAME='varchar'

USE HW2
--�H��m��4:���[�X�f�O��]�P[�Ȥ�]��ƪ��Ҧ�����ƪ�A��ܤ��୫�����A�N�p���H���m��'��'���p���H��ܥX�� (10)
-- ���ܡGWHERE���󤤪�LIKE�y�k 
SELECT  �Ȥ�.�Ȥ�s��,�Ȥ�.�Ȥ�W��,�Ȥ�.�p���H,�Ȥ�.�a�},�Ȥ�.�q��,�X�f�O��.�s��
as �q��s��,�X�f�O��.���,�X�f�O��.�ѦW,�X�f�O��.�ƶq
FROM �Ȥ� 
LEFT JOIN �X�f�O��
on �Ȥ�.�Ȥ�W�� = �X�f�O��.�Ȥ�W��
WHERE �Ȥ�.�p���H LIKE ('��%')

USE HW2
--DROP TABLE �ԲӭɥΰO��
--�H��m��5:�бN�H��m��4�����G���s�W��ƪ�[�ԲӭɥΰO��]��
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
SELECT �Ȥ�.�Ȥ�s��,�Ȥ�.�Ȥ�W��,�Ȥ�.�p���H,�Ȥ�.�a�},�Ȥ�.�q��,�X�f�O��.�s��
as �q��s��,�X�f�O��.���,�X�f�O��.�ѦW,�X�f�O��.�ƶq
FROM �Ȥ� 
LEFT JOIN �X�f�O��
on �Ȥ�.�Ȥ�W�� = �X�f�O��.�Ȥ�W��
WHERE �Ȥ�.�p���H LIKE ('��%')

SELECT * FROM �ԲӭɥΰO��


--�H��m��6 �Ϯ��]���o�{���e�g�z�ɪ��Ҧ����y���֬����@���A�бN���G��s��[�ϮѫǭɥΰO��]
SELECT* FROM ���u
SELECT* FROM �ϮѫǭɥΰO��

UPDATE  �ϮѫǭɥΰO��
SET     �ƶq = �ƶq + 1 ,
        ���� = '�g�z�ɪ����y�֬���'
WHERE   ���u�s�� = 2

SELECT* FROM �ϮѫǭɥΰO��
-----------------------------------------
-- 6.2 �ޥΨ�L��ƪ��Ȩӧ�s
UPDATE  �ϮѫǭɥΰO��
SET     ���� = '�ɮѤH��' + ���u.�m�W   
FROM    ���u                            
WHERE   �ϮѫǭɥΰO��.���u�s�� = ���u.�s��


/****** �m��7 (P8-23-25) - �R������ - DELETE, TRUNCATE  ******/
-- 7.1 �R�����w����
DELETE �ϮѫǭɥΰO��
WHERE  �ѦW = 'Word ��U'

SELECT * FROM �ϮѫǭɥΰO��

-- 7.1 �R�����w��L��ƪ����
DELETE  �ϮѫǭɥΰO��
FROM    ���u
WHERE   �ϮѫǭɥΰO��.���u�s�� = ���u.�s���@AND ���u.�m�W = '������'

SELECT * 
FROM �ϮѫǭɥΰO��
---------------------
SELECT * FROM ���x��

DELETE ���x��
WHERE �۶� IS NULL

SELECT * FROM ���x��


-- ### �H��m��7 �ЧR��[���x��]��ú��۶Ǫ����

/****** �m��8 (P8-23-25) - ��X��ʪ���� - OUTPUT  ******/
-- 8.1 �N�s�W��ƪ����G�ϥ�OUTPUT���(INSERTED)
INSERT �ϮѫǭɥΰO�� ( ���u�s��, �ѦW )
OUTPUT INSERTED.*
VALUES ( '12', 'SQL �y�k���' ),
       ( '25', 'Windows �ϥΤ�U' ),
       ( '13', 'Linux �[�����'),
       ( '12', 'VB �{���]�p')

GO

-- 8.2 �N��s��ƪ����G�ϥ�OUTPUT���(DELETED, INSERTED) - �����s�e�᪺�ƭ�
UPDATE �ϮѫǭɥΰO�� 
SET �ѦW = 'C# �{���]�p'
OUTPUT DELETED.�s��, DELETED.�ѦW �®ѦW, INSERTED.�ѦW �s�ѦW
WHERE �s�� = 5

-- 8.3 �N�R����ƪ����G�ϥ�OUTPUT���(DELETED)
DELETE �ϮѫǭɥΰO��
OUTPUT DELETED.*
WHERE �s�� = 3

GO

-- 8.4 �N��ʪ���ƿ�X�ܨ�L��ƪ��Table�ܼ�
CREATE TABLE #OUTPUT_TB
   ( �s��  int IDENTITY,
     ���u�s�� int, 
     �ѦW  nvarchar(16)
   )
GO

UPDATE �ϮѫǭɥΰO��
SET ���u�s�� = '57'
OUTPUT INSERTED.�s��, INSERTED.���u�s��, INSERTED.�ѦW INTO #OUTPUT_TB (�s��, ���u�s��, �ѦW)
WHERE ���u�s�� = '12'

SELECT * FROM #OUTPUT_TB

----------------------------------
SELECT* FROM �ϮѫǭɥΰO��

UPDATE �ϮѫǭɥΰO��
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
OUTPUT INSERTED.�s��, INSERTED.���u�s��, INSERTED.�ѦW, INSERTED.�ƶq, INSERTED.�k�٤��, INSERTED.���� INTO #BOOK (�s��, ���u�s��, �ѦW, �ƶq ,�k�٤��, ����)
WHERE ���u�s�� = '2'

SELECT* FROM #BOOK

-- ### �H��m��8 ��X�m�� 
-- 1. �g�z�ɤF���y���Ҧ��H�S���ɹL���ѡA�бN�O������T�s�W��[�ϮѫǭɥΰO��]
-- 2. �N��ʪ��������Ҧ����O���b�@�ӷs�W�Ȧs��ƪ�
