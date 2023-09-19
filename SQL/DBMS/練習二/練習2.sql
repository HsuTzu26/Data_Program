/*
### �m��2
�аѦҪ��ɮھ�Pokemon�C������ƮwER Model�]�p�ҫ��ϥ�T-SQL CREATE�y�k�ظm��ƪ�A
�åH�A��Primary Key�H��Foreign Key���p�]�p�Ϥ������
*/

USE master;

if DB_ID('Pokemon') is not null
	DROP DATABASE Pokemon
GO
CREATE DATABASE Pokemon
GO

USE Pokemon;

-- �D��
-- �I�]-�D��/ �����~-�D�]-���a����/ �ݩ�- �_�i�ڹ�Ų
-- �_�i�ڶ���-�_�i�ڭܮw

CREATE TABLE �D��
(
	�D��ID int PRIMARY KEY,
	money int,
	�I�]ID int,
	����ID int,
)

CREATE TABLE �I�]
(
	�I�]ID int PRIMARY KEY,	
	�D��ID int,
	�����~ID int
)

CREATE TABLE �D��
(
	�D��ID int PRIMARY KEY,
	�D��W�� char(20),
	�D��\�� char(20),
)

CREATE TABLE �����~
(
	�����~ID int PRIMARY KEY,
	�����~�W�� char(20),
	�D�]ID int,
)

CREATE TABLE �D�]
(
	�D�]ID int PRIMARY KEY,
	�D�]�W�� char(20),
	money int,
	���ⶤ�� int,
	�ݩ�ID int
)

CREATE TABLE ���a����
(
	���a����ID int PRIMARY KEY,
	���aID int,
)

CREATE TABLE �_�i�ڶ���
(
	����ID int PRIMARY KEY,
	�_�i��ID_1 int,
	�_�i��ID_2 int,
	�_�i��ID_3 int,
	�_�i��ID_4 int,
	�_�i��ID_5 int,
	�_�i��ID_6 int,
)

CREATE TABLE �ݩ�
(
	�ݩ�ID int PRIMARY KEY,
	�ݩʦW�� char(20)
)

CREATE TABLE �_�i�ڭܮw
(
	�_�i��ID int PRIMARY KEY,
	�_�i�ڽs�� int,
	�W�r char(20),
	HP int,
	�g��� int,
	level int,
	���\ int,
	�S�� int,
	���m int,
	�ӱ� int,
	�ޯ�1 char(10),
	�ޯ�2 char(10),
	�ޯ�3 char(10),
	�ޯ�4 char(10),
)

CREATE TABLE �_�i�ڹ�Ų
(
	�_�i�ڽs�� int PRIMARY KEY,
	�W�r char(20),
	Poke�ݩ�ID int,
)

ALTER TABLE �D�� ADD CONSTRAINT �I�]ID FOREIGN KEY (�I�]ID) REFERENCES �I�](�I�]ID)
ALTER TABLE �D�� ADD CONSTRAINT ����ID FOREIGN KEY (����ID) REFERENCES �_�i�ڶ���(����ID)

ALTER TABLE �I�] ADD CONSTRAINT �D��ID FOREIGN KEY (�D��ID) REFERENCES �D��(�D��ID)
ALTER TABLE �I�] ADD CONSTRAINT �����~ID FOREIGN KEY (�����~ID) REFERENCES �����~(�����~ID)

ALTER TABLE �����~ ADD CONSTRAINT �D�]ID FOREIGN KEY (�D�]ID) REFERENCES �D�](�D�]ID)

ALTER TABLE �D�] ADD CONSTRAINT ���ⶤ�� FOREIGN KEY (���ⶤ��) REFERENCES ���a����(���a����ID)
ALTER TABLE �D�] ADD CONSTRAINT �ݩ�ID FOREIGN KEY (�ݩ�ID) REFERENCES �ݩ�(�ݩ�ID)

ALTER TABLE ���a���� ADD CONSTRAINT ���aID FOREIGN KEY (���aID) REFERENCES �D��(�D��ID)

ALTER TABLE �_�i�ڶ��� ADD CONSTRAINT �_�i��ID_1 FOREIGN KEY (�_�i��ID_1) REFERENCES �_�i�ڭܮw(�_�i��ID)
ALTER TABLE �_�i�ڶ��� ADD CONSTRAINT �_�i��ID_2 FOREIGN KEY (�_�i��ID_2) REFERENCES �_�i�ڭܮw(�_�i��ID)
ALTER TABLE �_�i�ڶ��� ADD CONSTRAINT �_�i��ID_3 FOREIGN KEY (�_�i��ID_3) REFERENCES �_�i�ڭܮw(�_�i��ID)
ALTER TABLE �_�i�ڶ��� ADD CONSTRAINT �_�i��ID_4 FOREIGN KEY (�_�i��ID_4) REFERENCES �_�i�ڭܮw(�_�i��ID)
ALTER TABLE �_�i�ڶ��� ADD CONSTRAINT �_�i��ID_5 FOREIGN KEY (�_�i��ID_5) REFERENCES �_�i�ڭܮw(�_�i��ID)
ALTER TABLE �_�i�ڶ��� ADD CONSTRAINT �_�i��ID_6 FOREIGN KEY (�_�i��ID_6) REFERENCES �_�i�ڭܮw(�_�i��ID)

ALTER TABLE �_�i�ڭܮw ADD CONSTRAINT �_�i�ڽs�� FOREIGN KEY (�_�i�ڽs��) REFERENCES �_�i�ڹ�Ų(�_�i�ڽs��)

ALTER TABLE �_�i�ڹ�Ų ADD CONSTRAINT Poke�ݩ�ID FOREIGN KEY (Poke�ݩ�ID) REFERENCES �ݩ�(�ݩ�ID)