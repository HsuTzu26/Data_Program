use master;
IF DB_ID ('WhoPanda') IS NOT NULL
	DROP DATABASE WhoPanda
GO
CREATE DATABASE WhoPanda
GO
USE WhoPanda
--�D��1
-- �|�����: �Ǹ� �����Ҧr�� �m�� �W�r �ͤ� �ʧO
--	 �����Ҧr�� ���o����, �B�ߤ@, ���o��PK; �ʧO�w�]�Ȭ�'U'
CREATE TABLE �|�����
(
	�Ǹ� varchar(9) Primary Key,
	�����Ҧr�� varchar(10) NOT NULL UNIQUE,
	�m�� varchar(10),
	�W�r varchar(20),
	�ͤ� date,
	�ʧO varchar(1) DEFAULT 'U', -- F�k M�k U����
	��s�ɶ� datetime DEFAULT CONVERT(varchar, GETDATE(), 20)
)
--�ӫ~: �ӫ~�s�� �ӫ~�W�� ���a�s�� ���a�W�� ���
CREATE TABLE �ӫ~
(
	�ӫ~�s�� int IDENTITY(1,1) Primary Key,
	�ӫ~�W�� varchar(50),
	���a�s�� int,
	���a�W�� varchar(50),
	��� int,
	��s�ɶ� datetime DEFAULT CONVERT(varchar, GETDATE(), 20)
)
--�q��: �q��s�� �q�ʮɶ�
CREATE TABLE �q��
(
	�q��s�� int IDENTITY(1,1) Primary Key,
	�q�ʮɶ� datetime,
	��s�ɶ� datetime DEFAULT CONVERT(varchar, GETDATE(), 20),
	���a�W�� varchar(50),
	�ӫ~�W�� varchar(50),
	�ӫ~�s�� int,
	��� int
	FOREIGN KEY (�ӫ~�s��) REFERENCES �ӫ~(�ӫ~�s��)
)
--�I�ڤ覡: �d�� ����
CREATE TABLE �I�ڤ覡
(
	�d�� int IDENTITY(1000000001,1) Primary Key,
	���� int, -- 0�x�Ȫ� 1�y�C�d 2LINE Pay 3�H�Υd
	��s�ɶ� datetime DEFAULT CONVERT(varchar, GETDATE(), 20),
	�Ǹ� varchar(9),
	FOREIGN KEY (�Ǹ�) REFERENCES �|�����(�Ǹ�)
)
--�������: ��������s��(GUID) �q�檬�A
CREATE TABLE �������
(
	��������s�� UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL Primary Key, --GUID
	�q�檬�A int, -- 0�w���� 1�t�e�� 2�w�e�F 3�w����
	��s�ɶ� datetime DEFAULT CONVERT(varchar, GETDATE(), 20),
	�d�� int,
	���a�W�� varchar(50),
	�ӫ~�W�� varchar(50),
	�ӫ~�s�� int,
	��� int,
	FOREIGN KEY (�d��) REFERENCES �I�ڤ覡(�d��),
)
--�q�����:
CREATE TABLE �q�����
(
	�q��s�� int IDENTITY(1,1) Primary Key,
	�q�ʮɶ� datetime,
	�d�� int,
	�I�ڤ覡 int, -- 0�x�Ȫ� 1�y�C�d 2LINE Pay 3�H�Υd
	��������s�� UNIQUEIDENTIFIER,
	�ӫ~�s�� int,
	�ӫ~�W�� varchar(50),
	���a�s�� int,
	���a�W�� varchar(50),
	��� int,
	�Ǹ� varchar(9),
	FOREIGN KEY (�d��) REFERENCES �I�ڤ覡(�d��),
	FOREIGN KEY (�Ǹ�) REFERENCES �|�����(�Ǹ�),
	FOREIGN KEY (��������s��) REFERENCES �������(��������s��),
	FOREIGN KEY (�ӫ~�s��) REFERENCES �ӫ~(�ӫ~�s��)
)

--�D��2
INSERT INTO �|�����
	(�Ǹ�, �����Ҧr��, �m��, �W�r, �ͤ�, �ʧO)
VALUES
	('097758135', 'A123456789', '��', '�ӱ�', '19990610', 'F'),
	('107945876', 'A234567890', '�\', '�K��', '20001013', 'M'),
	('118542367', 'A345678912', '��', '����', '20020915', 'M');

INSERT INTO �I�ڤ覡
	(����, �Ǹ�)
VALUES
	(2, '097758135'), -- 1000000001 
	(3, '107945876'), -- 1000000002
	(0, '118542367'); -- 1000000003


INSERT INTO �������
	(�q�檬�A, �d��, �ӫ~�W��, ���a�W��, ���, �ӫ~�s��)
VALUES
	(1,1000000001,'�۵P��','�j�T��', 90,1), --1000000001
	(0,1000000001,'�۵P��K','���]��K', 70,2),
	(2,1000000001,'�Ϧ�ü��','�Ϧѧ�', 95,3),
	(2,1000000001,'�n�j������','���J����', 75,4),
	(0,1000000001,'���Υ]','�B�������Υ]', 100,5),
	(2,1000000002,'�Ϧ�ü��','�Ϧѧ�', 95,3), --1000000002
	(3,1000000002,'�n�j������','���J����', 75,4),
	(1,1000000002,'���Υ]','�B�������Υ]', 100,5),
	(2,1000000002,'�۵P��K','���]��K', 70,2),
	(3,1000000002,'���Υ]','�B�������Υ]', 100,5),
	(1,1000000003,'���Υ]','�B�������Υ]', 100,5), --1000000003
	(1,1000000003,'�۵P��','�j�T��', 90,1),
	(2,1000000003,'���Υ]','�B�������Υ]', 100,5),
	(1,1000000003,'�۵P��K','���]��K', 70,2),
	(0,1000000003,'�۵P��','�j�T��', 90,1);

INSERT INTO �ӫ~
	(�ӫ~�W��, ���a�s��, ���a�W��, ���)
VALUES
	('�۵P��',1,'�j�T��', 90),
	('�۵P��K',2,'���]��K', 70),
	('�Ϧ�ü��',3,'�Ϧѧ�', 95),
	('�n�j������',4,'���J����', 75),
	('���Υ]',5,'�B�������Υ]', 100);

INSERT INTO �q��
	(�q�ʮɶ�, �ӫ~�W��, �ӫ~�s��)
VALUES
	('2023-04-01', '�۵P��',1),
	('2023-04-06', '�۵P��K',2),
	('2023-04-11', '�n�j������',4),
	('2023-04-16', '�Ϧ�ü��',3),
	('2023-04-21', '���Υ]',5),
	('2023-04-21', '�۵P��',1);

--�D��3
ALTER TABLE ������� ADD ���O�� varchar(20)

--�D��4 �N�|���m�W��J�� ���O��
UPDATE �������
SET ���O�� = '���ӱ�'
WHERE �d��='1000000001'

UPDATE �������
SET ���O�� = '�\�K��'
WHERE �d��='1000000002'

UPDATE �������
SET ���O�� = '������'
WHERE �d��='1000000003'

--�D��5
UPDATE �|�����
SET �m��='�\', �W�r='�ѬP'
OUTPUT deleted.�m�� ��m, deleted.�W�r ��W, inserted.�m�� �s�m, inserted.�W�r �s�W 
WHERE �Ǹ�='118542367'

--�D��6
SELECT T.*, T.�d�� AS �I�ڥd��, (�m��+SPACE(1)+�W�r) AS �m�W, (M.�Ǹ�+'/'+CONVERT(varchar(100),�ͤ�,23)+'/'+�ʧO) AS �򥻸��
FROM ������� T
	LEFT JOIN �I�ڤ覡 P ON P.�d��=T.�d�� 
	LEFT JOIN �|����� M ON M.�Ǹ�=P.�Ǹ�
	LEFT JOIN �ӫ~ S ON S.�ӫ~�s��=T.�ӫ~�s��
WHERE M.�Ǹ�='097758135'

--�D��7
INSERT INTO �������
	(�q�檬�A, �d��, �ӫ~�W��, ���a�W��, ���, �ӫ~�s��)
VALUES
	(2, 1000000003, '�n�j������','���J����',75,4),
	(1, 1000000003, '�Ϧ�ü��','�Ϧѧ�',95,3);
UPDATE �������

SET ���O�� = '�\�ѬP'
WHERE ���O�� IS NULL AND �d��='1000000003'

SELECT T.*, T.�d�� AS �I�ڥd��, (�m��+SPACE(1)+�W�r) AS �m�W, (M.�Ǹ�+'/'+CONVERT(varchar(100),�ͤ�,23)+'/'+�ʧO) AS �򥻸��
FROM ������� T
	LEFT JOIN �I�ڤ覡 P ON P.�d��=T.�d�� 
	LEFT JOIN �|����� M ON M.�Ǹ�=P.�Ǹ�
	LEFT JOIN �ӫ~ S ON S.�ӫ~�s��=T.�ӫ~�s��
WHERE M.�Ǹ�='118542367'

--�D��8
SELECT M.�Ǹ�, COUNT(T.�q�檬�A) AS �q���`����, SUM(T.���) AS �q��X�p�`���B
FROM ������� T
	LEFT JOIN �I�ڤ覡 P ON P.�d��=T.�d��  
	LEFT JOIN �|����� M ON M.�Ǹ�=P.�Ǹ�
	LEFT JOIN �ӫ~ S ON S.�ӫ~�s��=T.�ӫ~�s��
GROUP BY M.�Ǹ�
ORDER BY �q���`���� DESC

