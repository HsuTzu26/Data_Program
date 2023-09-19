/*
����: �Шϥ�Ĳ�o(Trigger)�ק�[W09] ��X�y�k�m�� �A�W�h�p�U:
 
1.�Шϥ�AFTERĲ�o�{�ǡA��g�쥻�{���A�b�s�W���������A�۰ʧ�sLOG_SEG�y����
 
2.�Шϥ�INSTEAD OFĲ�o�{�ǡA�b�ާ@�s�W��������ɡA���ݭn��JTranID(�d�Ү榡: 20210524_000001)�C�NTranID�s�W�ܥ���������N�쥻�s�W��������ʧ@�C�æ۰ʧ�sLOG_SEG�y����
*/
USE master
IF DB_ID ( 'Ex3' ) IS NOT NULL
  DROP DATABASE Ex3;
GO
CREATE DATABASE Ex3
GO
USE Ex3;

/*
TRUNCATE TABLE LOG_SEQ
TRUNCATE TABLE Trans
DROP TRIGGER Update_LOG_SEQ
*/

-- 1.�Шϥ�AFTERĲ�o�{�ǡA��g�쥻�{���A�b�s�W���������A�۰ʧ�sLOG_SEG�y����
-- �Ыج������X�P�έp���
-- �Ыإ���������
CREATE TABLE Trans (
	ID          char(15),      -- �榡: �t�Τ��(8�X)_�Ǹ�(6�X)
	TransDate   datetime
);
GO

-- �Ыج������X�P�έp���
CREATE TABLE LOG_SEQ(
  SDATE varchar(8) NOT NULL PRIMARY KEY,     -- ��Ѫ�log����
  LOG_COUNT varchar(6) NOT NULL              -- ��Ѥ@�@���h�ֵ�log
);
GO

-- �Ы�Ĳ�o��
CREATE TRIGGER Update_LOG_SEQ
ON Trans
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
	--�ϥ�SET NOCOUNT ON�O���F�����bĲ�o�������ͪ�"xx ����v�T"���������

    DECLARE @TS varchar(8)     -- �t�Τ��(8�X)
    DECLARE @No int     -- �Ǹ�
    DECLARE @TranID varchar(15)     -- �榡: �t�Τ��(8�X)_�Ǹ�(6�X)

    SET @TS = CONVERT(varchar, GETDATE(), 112) -- �����e���

    -- �d�߷��LOG_COUNT��
    SELECT @No = LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS

    -- �p�G��ѨS���O���A�h�NLOG_COUNT��l�Ƭ�0
    IF @No IS NULL
    BEGIN
        SET @No = 0;
        INSERT INTO LOG_SEQ (SDATE, LOG_COUNT) VALUES (@TS, @No);
    END

    -- LOG_COUNT�[1�A�ç�sLOG_COUNT
    SET @No = @No + 1
    UPDATE LOG_SEQ SET LOG_COUNT = @No WHERE SDATE = @TS -- ��sLOG_COUNT

    -- �ͦ�TransID: �t�Τ��(8�X)_�Ǹ�(6�X)
    SET @TranID = @TS + '_' + RIGHT('000000' + CAST(@No AS varchar), 6)

    -- ��s���J�O����ID�r�q���ͦ���ID
    UPDATE T SET ID = @TranID
    FROM Trans AS T
    INNER JOIN inserted AS I ON T.TransDate = I.TransDate;
END
GO

-- ���J���ռƾ�
INSERT INTO Trans (TransDate)
VALUES (GETDATE());

-- �d�ߧ�s�᪺Trans��
SELECT * FROM Trans;
SELECT * FROM LOG_SEQ

/************************************/
/*
TRUNCATE TABLE Trans_INSTEAD
TRUNCATE TABLE LOG_SEQ_INSTEAD
DROP TRIGGER Insert_Trans
*/

/* 
2.�Шϥ�INSTEAD OFĲ�o�{�ǡA�b�ާ@�s�W��������ɡA���ݭn��JTranID(�d�Ү榡: 20210524_000001)�C
�NTranID�s�W�ܥ���������N�쥻�s�W��������ʧ@�C�æ۰ʧ�sLOG_SEG�y����
*/
-- �Ыإ���������
CREATE TABLE Trans_INSTEAD (
    ID          char(15),      -- �榡: �t�Τ��(8�X)_�Ǹ�(6�X)
    TransDate   datetime
);
GO

-- �Ыج������X�P�έp���
CREATE TABLE LOG_SEQ_INSTEAD(
    SDATE varchar(8) NOT NULL PRIMARY KEY,     -- ��Ѫ�log����
    LOG_COUNT int NOT NULL              -- ��Ѥ@�@���h�ֵ�log
);
GO

-- �Ы�Ĳ�o��
CREATE TRIGGER Insert_Trans
ON Trans_INSTEAD
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TS varchar(8)     -- �t�Τ��(8�X)
    DECLARE @No int     -- �Ǹ�
    DECLARE @TranID varchar(15)     -- �榡: �t�Τ��(8�X)_�Ǹ�(6�X)

    SET @TS = CONVERT(varchar, GETDATE(), 112) -- �����e���

    -- �d�߷��LOG_COUNT��
    SELECT @No = LOG_COUNT FROM LOG_SEQ_INSTEAD WHERE SDATE = @TS

    -- �p�G��ѨS���O���A�h�NLOG_COUNT��l�Ƭ�0
    IF @No IS NULL
    BEGIN
        SET @No = 0;
        INSERT INTO LOG_SEQ_INSTEAD(SDATE, LOG_COUNT) VALUES (@TS, @No);
    END

    -- LOG_COUNT�[1�A�ç�sLOG_COUNT
    SET @No = @No + 1
    UPDATE LOG_SEQ_INSTEAD SET LOG_COUNT = @No WHERE SDATE = @TS -- ��sLOG_COUNT

    -- �ͦ�TransID: �t�Τ��(8�X)_�Ǹ�(6�X)
    SET @TranID = @TS + '_' + RIGHT('000000' + CAST(@No AS varchar), 6)

    -- ���J��������æ۰ʥͦ�ID
    INSERT INTO Trans_INSTEAD(ID, TransDate)
    SELECT @TranID, TransDate
    FROM inserted;
END
GO

-- ���J���ռƾ�
INSERT INTO Trans_INSTEAD(TransDate)
VALUES (GETDATE());

-- �d�ߧ�s�᪺Trans��
SELECT * FROM Trans_INSTEAD;
SELECT * FROM LOG_SEQ_INSTEAD
