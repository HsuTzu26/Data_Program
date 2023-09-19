--https://www.tutorialspoint.com/sql/sql-primary-key.htm
CREATE DATABASE BANK;
GO
-- Primary Key�إߤ覡
-- 1. CREATE TABLE�ɡA��b���᭱
CREATE TABLE �ӤH���
(
    �ӤH�b�� int PRIMARY KEY,
    �m�� char(20),
    �W�r char(20),
    �ͤ� date,
    �ʧO int,
    �q�T�a�} char(50),
    ���� char(10),
    ���y char (10),
    ��s�ɶ���� datetime,
    ���ʤH char(20),
)
-- 2. CREATE TABLE�ɡA��b�̫᭱���w���W��
CREATE TABLE �ӤH���
(
    �ӤH�b�� int,
    �m�� char(20),
    �W�r char(20),
    �ͤ� date,
    �ʧO int,
    �q�T�a�} char(50),
    ���� char(10),
    ���y char (10),
    ��s�ɶ���� datetime,
    ���ʤH char(20),
    PRIMARY KEY (�ӤH�b��)
)
-- 3. �ϥ�ALTER TABLE�إ�(�e���n���إߦn��ƪ�)
ALTER TABLE �ӤH��� ADD PRIMARY KEY (�ӤH�b��);
-- 4. �ϥ�ALTER TABLE�إ�-�H�s�WCONSTRAINT�覡 (�e���n���إߦn��ƪ�)
ALTER TABLE �ӤH���
   ADD CONSTRAINT PK_CUSTID PRIMARY KEY (�ӤH�b��);
--���շs�W�ӤH���
INSERT INTO �ӤH���
    (�ӤH�b��, �m��, �W�r, �ʧO, �q�T�a�}, ����)
VALUES
    ('003', '�s', '�j��', '1', '���w��365��', '�x�_��');
INSERT INTO �ӤH���
    (�ӤH�b��, �m��, �W�r, �ͤ�, �ʧO, �q�T�a�}, ����)
VALUES
    ('002', '��  ', '�ּ�', '20020221', '1', '����Ϥ�����@�q737��', '�x�_��');