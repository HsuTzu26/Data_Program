CREATE DATABASE myBank
GO
--�妸�B�z�A�Ϥ�CREATE DATABASE�PUSE myBank:
--�n��CREATE DATABASE myBank������~�|�i��U�@���קK���~
USE myBank

-- �ӤH�b���B�m��B�W�r�B�ͤ�B�ʧO�B�q�T�a�}�B�����B���y�B��s�ɶ�����B���ʤH
CREATE TABLE �ӤH���
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

--�b���T
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

--�s�W�ӤH���
INSERT INTO �ӤH���
    (�ӤH�b��, �m��, �W�r, �ʧO, �q�T�a�}, ����)
VALUES
    ('001', '�s', '�p��', '1', '���w��365��', '�x�_��');
INSERT INTO �ӤH���
    (�ӤH�b��, �m��, �W�r, �ͤ�, �ʧO, �q�T�a�}, ����)
VALUES
    ('002', '��  ', '�ּ�', '20020221', '1', '����Ϥ�����@�q737��', '�x�_��');

--�s�W�Ȧ�b�����
INSERT INTO Account
    (AccID, BankID, UserID, Balance, Branch_ID, AccType)
VALUES
    ('Acc001', '01  ', '001', 1000, '00', 1);
INSERT INTO Account
    (AccID, BankID, UserID, Balance, Branch_ID, AccType)
VALUES
    ('Acc003', '01  ', '002', 5000, '00', 1);

INSERT INTO Account
    (AccID, BankID, UserID, Balance, Branch_ID, AccType)
VALUES
    ('Acc002', '01  ', '001', 10000000, '00', 2);

SELECT *
FROM Account

SELECT *
FROM �ӤH���

SELECT Account.*, �ӤH���.�m��, �ӤH���.�W�r
FROM �ӤH���, Account
WHERE �ӤH���.�ӤH�b��=Account.UserID

SELECT Account.AccID, Account.BankID, (�ӤH���.�m�� + �ӤH���.�W�r) AS �W�r, Account.Balance, AccID
FROM �ӤH���, Account
WHERE �ӤH���.�ӤH�b��=Account.UserID

DELETE FROM �ӤH���
WHERE �ӤH�b��='002'

UPDATE �ӤH���
SET ���y='�����'
WHERE �ӤH�b��='002'

SELECT *
FROM �ӤH���

use myDB
drop table �ӤH���