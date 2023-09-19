USE MASTER
IF DB_ID('WHOPANDA') IS NOT NULL
	DROP DATABASE WHOPANDA
GO
CREATE DATABASE WHOPANDA
GO

USE WHOPANDA

CREATE TABLE �|�����
(
	�Ǹ� INT ,
	�����Ҧr�� VARCHAR(30) UNIQUE NOT NULL,
	�m�� VARCHAR(20),
	�W�r VARCHAR(20),
	�ͤ� DATETIME,
	�ʧO CHAR(2) DEFAULT 'U',
	��s�ɶ� DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(�Ǹ�)
)

CREATE TABLE �I�ڤ覡
(
	�d�� INT IDENTITY(1000000001,1),
	���� VARCHAR(20),
	�Ǹ� INT ,
	��s�ɶ� DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(�d��),
	FOREIGN KEY (�Ǹ�) REFERENCES �|�����(�Ǹ�)
)

CREATE TABLE �ӫ~
(
	�ӫ~�s�� INT,
	�ӫ~�W�� VARCHAR(20),
	���a�s�� INT,
	���a�W�� VARCHAR(20),
	��� INT,
	��s�ɶ� DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(�ӫ~�s��)
)

CREATE TABLE �q��
(
	�q��s�� INT,
	�q�ʮɶ� DATETIME,
	�Ǹ� INT,
	��s�ɶ� DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(�q��s��),
	FOREIGN KEY (�Ǹ�) REFERENCES �|�����(�Ǹ�)
)

CREATE TABLE �q�����
(
	���ӽs�� INT,
	�ӫ~�s�� INT,
	�ӫ~�W�� varchar(20),
	�q��s�� INT,
	��s�ɶ� DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(���ӽs��),
	FOREIGN KEY (�q��s��) REFERENCES �q��(�q��s��),
	FOREIGN KEY (�ӫ~�s��) REFERENCES �ӫ~(�ӫ~�s��)
	
)

CREATE TABLE �������
(
	��������s�� UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL,
	�q�檬�A VARCHAR(50),
	�d�� INT,
	�Ǹ� int,
	�q��s�� INT,
	��s�ɶ� DATETIME DEFAULT CONVERT(VARCHAR,GETDATE(),20),
	PRIMARY KEY(��������s��),
	FOREIGN KEY (�d��) REFERENCES �I�ڤ覡(�d��),
	FOREIGN KEY (�Ǹ�) REFERENCES �|�����(�Ǹ�),
	FOREIGN KEY (�q��s��) REFERENCES �q��(�q��s��)

)
ALTER AUTHORIZATION ON DATABASE :: WHOPANDA TO [SA]

INSERT INTO �|�����
	(�Ǹ�,�����Ҧr��,�m��,�W�r,�ͤ� ,�ʧO)
VALUES
	(102214120,'A111111111','�L','���','20021120','�k'),
	(102214121,'A222222222','�i','�}��','20021220','�k'),
	(102214122,'A333333333','��','�k��','20001020','�k')

INSERT INTO �I�ڤ覡
	(����,�Ǹ�)
VALUES
	('�y�C�d',102214120),
	('�H�Υd',102214121),
	('LINEPAY',102214122)

INSERT INTO �q��
	(�q��s��,�q�ʮɶ�,�Ǹ�)
VALUES
	(1,'20230421',102214120),
	(2,'20230422',102214121),
	(3,'20230422',102214122),
	(4,'20230423',102214120),
	(5,'20230423',102214120),
	(6,'20230423',102214121),
	(7,'20230424',102214121),
	(8,'20230424',102214122),
	(9,'20230424',102214122),
	(10,'20230424',102214120),
	(11,'20230425',102214120),
	(12,'20230425',102214121),
	(13,'20230425',102214121),
	(14,'20230425',102214122),
	(15,'20230425',102214122)


INSERT INTO �������
	(�q�檬�A,�d��,�q��s��,�Ǹ�)
VALUES
	('�w����',1000000001,1,102214120),
	('�t�e��',1000000002,2,102214121),
	('�w�e�F',1000000003,3,102214122),
	('�w����',1000000001,4,102214120),
	('�w����',1000000002,5,102214121),
	('�t�e��',1000000003,6,102214122),
	('�w�e�F',1000000001,7,102214120),
	('�w����',1000000002,8,102214121),
	('�w����',1000000003,9,102214122),
	('�t�e��',1000000001,10,102214120),
	('�w�e�F',1000000002,11,102214121),
	('�w����',1000000003,12,102214122),
	('�w����',1000000001,13,102214120),
	('�t�e��',1000000002,14,102214121),
	('�w����',1000000003,15,102214122)


INSERT INTO �ӫ~
	(�ӫ~�s��,�ӫ~�W��,���a�s��,���a�W��,���)
VALUES
	(1,'�۵P��',1,'�j�T��',100),
	(2,'10����K',2,'���]',60),
	(3,'����',3,'���J',80),
	(4,'�å�',4,'COCO',50)

INSERT INTO �q�����
	(���ӽs��,�ӫ~�s��,�q��s��)
VALUES
	(1,1,1),
	(2,2,1),
	(3,2,2),
	(4,3,2),
	(5,3,3),
	(6,4,3)


--3.
alter table ������� add ���O�� varchar(25) DEFAULT '�L'

--SELECT * FROM �������
--4.
UPDATE ������� 
SET ���O�� = �|�����.�m�� + �|�����.�W�r
from �|�����,�������,�I�ڤ覡
WHERE �������.�Ǹ� = �|�����.�Ǹ� and �I�ڤ覡.�d�� = �������.�d��


--select * from �������
--select * from �|�����
--select * from �I�ڤ覡

--5.

update �|�����
set �W�r = '����'
output deleted.�W�r as  ��W�r,inserted.�W�r as  ��s��W�r
where �W�r = '���'

--6.
DECLARE @TEXT INT
SET @TEXT = 102214120
SELECT DISTINCT �������.��������s��,�������.�q�檬�A, �I�ڤ覡.�d��,�ӫ~.���a�W��,�ӫ~.�ӫ~�W��,�ӫ~.���,�|�����.�m��+SPACE(1)+�|�����.�W�r AS �m�W ,CONVERT(VARCHAR,�|�����.�Ǹ�,20)+'/'+CONVERT(VARCHAR,�|�����.�ͤ�,23)+'/'+�|�����.�ʧO AS �򥻸�T 
FROM ������� JOIN �I�ڤ覡 ON �������.�d�� = �I�ڤ覡.�d��
			  JOIN �|�����  ON �������.�Ǹ� = �|�����.�Ǹ�,
	 �q����� JOIN �q�� ON �q��.�q��s�� = �q�����.�q��s��
			  JOIN �ӫ~ ON �ӫ~.�ӫ~�s�� = �q�����.�ӫ~�s��
WHERE �|�����.�Ǹ� = @TEXT

--7.
INSERT INTO �q��
	(�q��s��,�q�ʮɶ�,�Ǹ�)
VALUES
	(16,'20230909',102214120)

INSERT INTO �q�����
	(���ӽs��,�ӫ~�s��,�q��s��)
VALUES
	(7,3,16),
	(8,4,16)

INSERT INTO �������
	(�q�檬�A,�d��,�q��s��,�Ǹ�,���O��)
VALUES
	('�w����',1000000001,16,102214120,'�L����')

--SELECT * FROM �������
SELECT DISTINCT �������.��������s��,�������.�q�檬�A, �������.���O��,CONVERT(VARCHAR,�|�����.�Ǹ�,20)+'/'+CONVERT(VARCHAR,�|�����.�ͤ�,23)+'/'+�|�����.�ʧO AS �򥻸�T 
FROM ������� JOIN �I�ڤ覡 ON �������.�d�� = �I�ڤ覡.�d��
			  JOIN �|�����  ON �������.�Ǹ� = �|�����.�Ǹ�,
	 �q����� JOIN �q��  ON �q��.�q��s�� = �q�����.�q��s��
			  JOIN �ӫ~ ON �ӫ~.�ӫ~�s�� = �q�����.�ӫ~�s��
WHERE �|�����.�Ǹ� = 102214120

--8.
SELECT �|�����.�Ǹ�,COUNT(�q��.�q��s��) AS �q���`����,SUM(�ӫ~.���)�q��X�p�`���B
FROM �|�����,�q��,�ӫ~,�q�����
WHERE �q��.�q��s�� = �q�����.�q��s��  AND �q��.�Ǹ� = �|�����.�Ǹ� AND �ӫ~.�ӫ~�s�� = �q�����.�ӫ~�s��
GROUP BY �|�����.�Ǹ�
ORDER BY �q���`���� DESC


