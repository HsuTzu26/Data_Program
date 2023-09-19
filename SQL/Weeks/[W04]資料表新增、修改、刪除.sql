/*****�m��1 (P8-14 ) - IDENTITY���� ******/
-- 1.1 IDENTITY
-- �d��[�ϮѫǭɥΰO��]Table
-- 1.2 IDENTITY_INSERT ON
use HW_2
SET IDENTITY_INSERT �ϮѫǭɥΰO�� ON
INSERT �ϮѫǭɥΰO�� ( �s��, ���u�s��, �ѦW )
VALUES ( 0, 5, 'Word ��U')
-- 3. IDENTITY_INSERT OFF
SET IDENTITY_INSERT �ϮѫǭɥΰO�� OFF
SELECT *
FROM �ϮѫǭɥΰO��
-- ### �H��m��1:�бN[�X�f�O��].[�s��]IDENTITY�����A�ä�ʷs�W�@�����
/****** �m��2 (P8-16) - �qTABLE A���X��ƫ��JTABLE B  ******/
-- 2.1 �d��[���y]Table
SELECT *
FROM ���y
-- 2.2 �N[���y]�����w��ơA�s�W��[�ϮѫǭɥΰO��]
INSERT  �ϮѫǭɥΰO�� ( ���u�s��, �ѦW )
SELECT 3, ���y�W��
FROM   ���y
WHERE  ���y�s�� < 4
SELECT *
FROM �ϮѫǭɥΰO��
-- 2.3 [���D]�ЦC�X�@�Ҧ�[���y].[���y�s��]<4���Ѥ��t��[���u]Table��¾�Ȭ��ץD�����M��
SELECT *
FROM ���u
SELECT ���y�W��
FROM ���y
-- ����
SELECT B.�s��, A.���y�W��
FROM   ���y AS A, ���u AS B
WHERE  B.¾�� ='�D��' AND A.���y�s�� < 4
-- ### �H��m��2:�зs�W[���u]���A¾�쬰 "��ƭ�"����Ʀ�[�ϮѫǭɥΰO��]
/****** �m��3 (P8-16) - �NEXEC���檺���G�s�J�Ȧs��ƪ�  ******/
--3.1 ����sp_helpdb�ñN���G�x�s�ܼȦs��ƪ�#HELPDB
EXEC sp_helpdb
CREATE TABLE #HELPDB
(
    �W�� nvarchar(24) ,
    �Ŷ��j�p nvarchar(13) ,
    �֦��� varchar(24) ,
    DBID smallint ,
    �إߤ�� smalldatetime ,
    ���A text ,
    �ۮe�ʼh�� tinyint
)
INSERT #HELPDB
EXEC sp_helpdb
SELECT *
FROM #HELPDB
-- ### �H��m��3:�бNSQL���w�q����ƫ��Aint, smallint, char, vchar
-- ### ��TYPE_NAME, PRECISION, DATA_TYPE����T���ۭq�Ȧs��ƪ�A����ܵ��G
-- ����1�G�ϥΡ@sp_datatype_info
-- ����2�G�ۭq�Ȧs����ƫ��A�ݻPsp_datatype_info�d�ߵ��G������ƫ��A�۲�
/****** �m��4 (P8-18~21) - WHERE�d�߱���  ******/
-- 4.1�@��@���d�߱���
SELECT  �ѦW, �ƶq, �k�٤��, �q��
FROM    �ϮѫǭɥΰO��, ���u
WHERE   �m�W = '�B�Ѥ�' �С�AND �ϮѫǭɥΰO��.���u�s�� = ���u.�s��
GO
-- 4.2�@�h�����P�P�h�Ӹ�ƪ�d�߱���AND, OR
SELECT  �ѦW, �ƶq, �k�٤��, �q�� AS �ɥΪ̹q��
FROM    �ϮѫǭɥΰO�� AS A, ���u AS B
WHERE   �m�W = '�B�Ѥ�' AND A.���u�s�� = B.�s��
-- 4.3�@�d�߱���ŦX�h�Ӹ�ƪ�
SELECT �m�W AS �ɾ\��, �ѦW, �ƶq AS ����
INTO   �ɾ\�M��
FROM   �ϮѫǭɥΰO��, ���u
WHERE  �ϮѫǭɥΰO��.���u�s�� = ���u.�s��
SELECT *
FROM �ɾ\�M��
-- ### �H��m��4�@���[�X�f�O��]�P[�Ȥ�]��ƪ��Ҧ������A��ܤ��୫�����
--               �N�p���H���m��'��'���p���H��ܥX��
-- ���ܡGWHERE���󤤪�LIKE�y�k
/****** �m��5 (P8-22-24) - �d�ߵ��G�إ߷s��ƪ�(SELECT INTO)  ******/
-- 5.1 �s�W�@��[�p���W�U]�A�ñN[���u]���Ҧ���ƽƻs�L�h
SELECT * INTO  �p���W�U
FROM ���u
WHERE  1 = 0
-- �NWHERE����]�w��false
SELECT *
FROM ���u
GO
--�ΨӰϤ���q�{��
SELECT *
FROM �p���W�U
-- 5.2 �s�W�@��[�p���W�U]�A�ñN[���u]¾�쬰'��ƭ�'���Ҧ���ƽƻs�L�h
SELECT * INTO  �p���W�U
FROM  ���u
WHERE ¾��='��ƭ�'
-- ### �H��m��5 �бN�H��m��4�����G���s�W��ƪ�[�ԲӰO��]��
/****** �m��6 (P8-23-25) - ��s��ƪ�- update  ******/
-- 6.1 ��s���w���󪺸��
SELECT *
FROM �ϮѫǭɥΰO��
GO
UPDATE  �ϮѫǭɥΰO��
SET     ���u�s�� = 6 ,�@���� = NULL
WHERE   ���u�s�� = 3
SELECT *
FROM �ϮѫǭɥΰO��
GO
-- 6.2 ��s���w���󪺸��-2
UPDATE  �ϮѫǭɥΰO��
SET     �ƶq = �ƶq + 5 ,
        ���� = '�~�ȤH���ɾ\'
WHERE   ���u�s�� = 6
-- 6.2 �ޥΨ�L��ƪ��Ȩӧ�s
UPDATE  �ϮѫǭɥΰO��
SET     ���� = '�ɮѤH��' + ���u.�m�W   
FROM    ���u                            
WHERE   �ϮѫǭɥΰO��.���u�s�� = ���u.�s��
-- ### �H��m��6 �Ϯ��]���o�{���e�g�z�ɪ��Ҧ����y���֬����@���A�бN���G��s��[�ϮѫǭɥΰO��]
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
-- ### �H��m��8 ��X�m��
-- 1. �g�z�ɤF���y���Ҧ��H�S���ɹL���ѡA�бN�O������T�s�W��[�ϮѫǭɥΰO��]
-- 2. �N��ʪ��������Ҧ����O���b�@�ӷs�W�Ȧs��ƪ�