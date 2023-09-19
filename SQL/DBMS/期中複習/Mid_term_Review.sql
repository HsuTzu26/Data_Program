USE master
IF DB_ID ( 'NTUApp' ) IS NOT NULL
	DROP DATABASE NTUApp;
GO
CREATE DATABASE NTUApp
GO
USE NTUApp;
CREATE TABLE �ӤH���
(
	�Ǹ� char(9) Primary Key,
	�����Ҧr�� char(10) NOT NULL UNIQUE,
	�m�� varchar(10),
	�W�r varchar(20),
	�ͤ� date,
	�ʧO varchar(1),						--F�k/M�k/U����
	�b�Ǫ��A varchar(1),					--W�h��/X���/Y�b��/Z���~
	�q�T�a�} varchar(50),
	��s�ɶ� DateTime DEFAULT CONVERT(varchar, GETDATE(), 20)
);
CREATE TABLE �d��
(
	�d�� int IDENTITY(1000000001,1) Primary Key,
	�l�B int,
	�t�� varchar(20),
	�b������ varchar(1),					--A��X/L��/F�w
	�}�q���A varchar(1),					--Y/N
	�Ǹ� char(9),							--�M[�ӤH���]���p�ϥ�
	��s�ɶ� DateTime DEFAULT CONVERT(varchar, GETDATE(), 20)
);
CREATE TABLE �������
(
	�d�� int,
	����s�� UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL Primary Key, --�ϥ�UID/GUID�ӽs�X
	ñ�����a varchar(10),
	������� varchar(10),
	������B int,
	��s�ɶ� DateTime DEFAULT CONVERT(varchar, GETDATE(), 20) 
);

ALTER TABLE �������
ADD CONSTRAINT FK_CardTrans
FOREIGN KEY (�d��) REFERENCES �d��(�d��);

ALTER TABLE �d��
ADD CONSTRAINT FK_PersonalCard
FOREIGN KEY (�Ǹ�) REFERENCES �ӤH���(�Ǹ�);

--EXEC sp_helpconstraint �d��
--EXEC sp_helpconstraint �������

--�D��2 �`�N��ƪ��̩ۨ�, ���� �ӤH���-->�d��--->�������
INSERT INTO �ӤH���
	(�Ǹ�, �����Ҧr��, �m��, �W�r, �ͤ�, �ʧO, �b�Ǫ��A, �q�T�a�})
VALUES
	('100185741', 'A123456789', '��', '�p��', '20000101', 'M', 'Y', '�x�_���H�q�ϩ����F�����q7��'),
	('090174819', 'A234567890', '��', '�j�P', '19990315', 'M', 'N', '�x�_���j�w�Ϥ��R���|�q37��'),
	('345678901', 'A678105901', '�L', '�p��', '20010520', 'F', 'N', '�s�_���T�l�Ϥ��ظ�100��'),
	('906789012', 'A345234581', '��', '�j��', '20010520', 'M', 'N', '�s�_����L�ϾǶԸ�555��'),
	('745678901', 'A247821971', '��', '�d�d', '20010520', 'F', 'N', '�s�_���s���ϥ��͸�45��');

INSERT INTO �d��
	(�l�B, �t��, �b������, �}�q���A, �Ǹ�)
VALUES
	(50000,'��ިt','A','Y','100185741'),	--1000000001
	(60000,'��ިt','L','Y','090174819'),	--1000000002
	(5000,'��ިt','A','Y','345678901'),	--1000000003
	(7000,'��ިt','A','Y','906789012'),	--1000000004
	(10000,'��ިt','F','Y','745678901');	--1000000005

INSERT INTO �������
	(�d��,ñ�����a,�������,������B)
VALUES
	(1000000001,'7-11','��d',120),
	(1000000001,'�x�W���P','��d',499),
	(1000000001,'���\','���x�ȥd',220),
	(1000000002,'�����p�Y','���x�ȥd',150),
	(1000000002,'�̴̦�','��d',65),
	(1000000002,'���צn�Y��','���x�ȥd',220),
	(1000000003,'���]��K','���x�ȥd',310),
	(1000000003,'�_��','��d',168),
	(1000000003,'�ϳ���','���x�ȥd',79),
	(1000000004,'�d�O��','��d',85),
	(1000000004,'TNT&C','���x�ȥd',610),
	(1000000004,'�[�[�Y�@�M','��d',105),
	(1000000005,'���p','��d',240),
	(1000000005,'COSTCO','��d',1050),
	(1000000005,'STARBAKE','��d',890);

UPDATE �ӤH���
SET �q�T�a�}='�x�_���H�q�ϪQ����58��'
OUTPUT deleted.�q�T�a�} ��a�}, inserted.�q�T�a�} ��s��a�}
WHERE �Ǹ�='100185741'

SELECT T.*, C.�d�� AS �d��, (�m��+SPACE(1)+�W�r) AS �m�W, (U.�Ǹ�+'/'+CONVERT(varchar(100),�ͤ�,23)+'/'+�ʧO) AS �򥻸��
FROM ������� T
LEFT JOIN �d�� C ON C.�d��=T.�d��
LEFT JOIN �ӤH��� U ON U.�Ǹ�=C.�Ǹ�
WHERE C.�t��='��ިt'

SELECT U.�Ǹ�,COUNT(T.����s��) AS ����`����, SUM(T.������B) AS ����`���B 
FROM ������� T
LEFT JOIN �d�� C ON C.�d��=T.�d��
LEFT JOIN �ӤH��� U ON U.�Ǹ�=C.�Ǹ�
GROUP BY U.�Ǹ�
ORDER BY ����`���� DESC