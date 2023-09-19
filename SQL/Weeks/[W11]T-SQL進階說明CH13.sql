USE �m��13
GO 

-- P13-10
-- Table���O���ܼ�
DECLARE @mybook TABLE ( ���y�s�� int PRIMARY KEY, ���y�W�� varchar(50) )

INSERT @mybook
SELECT ���y�s��, ���y�W��
FROM ���y
WHERE ��� >= 460

UPDATE @mybook
SET ���y�W�� += '(��CD)'

DELETE @mybook
WHERE ���y�s�� = 7

SELECT * FROM @mybook

-- �����ϥθ�ƪ�O�W�ӫ������
DECLARE @mybook TABLE ( ���y�s�� int PRIMARY KEY, ���y�W�� varchar(50) )

INSERT @mybook
SELECT ���y�s��, ���y�W��
FROM ���y
WHERE ��� >= 400

PRINT @@ROWCOUNT

--SELECT * FROM @mybook
--SELECT * FROM ���y

-- �����ϥθ�ƪ�O�W�ӫ������
--SELECT m.���y�s��, m.���y�W��, ��� 
--FROM @mybook m JOIN ���y 
 --    ON m.���y�s�� = ���y.���y�s��
--GO

--table�ܼƥi�Φb SELECT�BINSERT�BUPDATE�BDELETE�A
SELECT ���y�s��, ���y�W��
INTO @mybook             -- �y�k���~�I���i�Φb INTO ��
FROM ���y

GO

-- SQL��������P�_�P�y�{����
/** (1) IF...ELSE
 ** (2) BEGIN...END
 ** (3) WHILE
 ** (4) CASE-->�f�tWHEN...THEN
 ** (5) GOTO
 **/

/* (2) IF...ELSE�y�k*/
-- P13-13a

IF (SELECT SUM(����) FROM �мФ��q) > 1500 
   PRINT '�мФ��q�@���겣�j�� 1100 ��' 
ELSE 
   PRINT '�мФ��q�@���겣�p�� 1100 ��' 
GO

-- P13-13b
DECLARE @avg_price int 
SET @avg_price = (SELECT AVG(���) FROM ���y) 
IF @avg_price > 600 
   PRINT '���y��������Ӱ�' 
ELSE 
   IF @avg_price > 400  -- �b ELSE ���� IF...ELSE 
      PRINT '���y��������A��' 
   ELSE 
      PRINT '���y��������ӧC' 
GO
-- P13-14a
IF 'Linux �ϥΤ�U' IN (SELECT ���y�W�� FROM ���y) 
   PRINT '��Linux �ϥΤ�U' 
ELSE 
   PRINT '�LLinux �ϥΤ�U'
GO

-- P13-14b
IF 1000 > ALL (SELECT ��� FROM ���y) 
   PRINT '�S��������y�W�L 1000 ��' 
GO

-- P13-15a
IF (SELECT ���y�W�� FROM ���y WHERE ���y�s�� = '1001') IS NULL 
   PRINT '1001 ���W�٥���J' 
ELSE 
   PRINT '1001 ���W�٤w��J' 
GO

-- P13-15b
IF EXISTS (SELECT * FROM ���y) 
   PRINT '1001 ���W�٤w��J' 
ELSE 
   PRINT '1001 ���W�٥���J'
GO

-- @@ROWCOUNT�Ϊk
SELECT * FROM ���y
WHERE ��� > 400
/*
-- ����@@ROWCOUNT
UPDATE ���y
SET ���=���-10
WHERE ��� > 400
PRINT @@ROWCOUNT

SELECT * FROM ���y
*/

/* (3) WHILE�y�k  */
-- P13-16

DECLARE @id int, @name varchar(50), @price int, @count int 
SET @id = 0 
SET @count = 1

WHILE @id < 500 
   BEGIN 
      SET @id = @id + 1 
      SELECT @name = ���y�W��, @price = ���
         FROM ���y WHERE ���y�s�� = @id
      IF @@ROWCOUNT = 0 /* @@ ROWCOUNT ���|�x�s�� */
         BEGIN          /* SELECT �Ǧ^���O������ */
             PRINT '*** The End ***'
             BREAK 
         END 
      IF @price >= 400 CONTINUE
      PRINT CAST(@price AS CHAR(4)) + ' -- ' +@name
      IF @count % 3 = 0 PRINT '......'
      SET @count = @count + 1
   END
GO

/* (4) CASE�y�k  */ 
-- P13-18
DECLARE @a INT, @answer CHAR(10) 
SET @a = 1 
SET @answer = CASE @a 
   WHEN 1 THEN 'A' 
   WHEN 2 THEN 'B' 
   WHEN 3 THEN 'C' 
   WHEN 4 THEN 'D' 
   ELSE 'OTHERS' 
END 
PRINT 'IS ' + @answer 
GO

-- P13-19
SELECT '<' + 
             CASE RIGHT(���y�W��, 2)   
                WHEN '��U' THEN '1�J��' 
                WHEN '���' THEN '2���' 
                WHEN '����' THEN '3�ޥ�' 
                WHEN '���D' THEN '4�޳N' 
                ELSE '5����' 
             END + '��>' AS ���O 
            , ���y�W�� 
FROM ���y 
ORDER BY ���O 

GO
/* (5) GOTO�y�k  */
-- P13-21 -- GOTO
DECLARE @number smallint 
SET @number = 99 
IF (@number % 3) = 0 
   GOTO Three 
ELSE 
   GOTO NotThree 
Three: 
   PRINT '�T������' 
   GOTO TheEnd 
NotThree: 
   PRINT '���O�T������' 
TheEnd: 

GO

/** �S��{������
 ** (1) WAITFOR ---wait for ���ݬY�Ӯɶ���A���� (������檺����)
  *    - �y�k���c: 
            WAITFOR {DELAY | TIME} 'time'
 ** (2) RETURN (�Ω�Stored Procedure�PFUNCTION)
 **/
-- P13-22
DECLARE @count INT 
SET @count = 0 
WHILE @count < 5  /* ���j��̦h�� 5 �� */
  BEGIN 
	INSERT ���u�O�� (���ʤ��, ���u�s��, �~��) 
	VALUES ('2012/10/6', 15, 30000) 
	IF @@error = 0 BREAK  /* �p�G���\�Y���X�j�� */
	SET @count = @count + 1 
	WAITFOR DELAY '00:00:05'  /* ���� 5 �� */
  END 
GO

--P13-23a
WAITFOR TIME '12:39'
SELECT * INTO �q��ƥ� 
FROM �q�� 

GO

/* ���~�B�z
 * (1) RAISERROR 
 *  - �T���s���ݤj��50000
 *  - �n���إ߭^�媩���A�~��b�إߨ�L�y������
 *  - ���~�T����bview sys.message�̭�
 */
-- P13-27
/****** SSMS �� SelectTopNRows �R�O�����O�X  ******/
SELECT * FROM sys.messages WHERE message_id=66666
DELETE FROM sys.messages WHERE message_id=66666
EXEC sp_dropmessage 66666
EXEC sp_dropmessage @msgnum = 66666, @lang = 'all'; 

EXEC sp_addmessage  66666, 7, 'Monsters!', @lang = 'us_english'
GO
EXEC sp_addmessage 66666, 7, '�����~!�����~!', @lang = '�c�餤��'
GO
RAISERROR (66666, 7, 1)

GO
-- P13-28a
RAISERROR ('���Ѭ����\����', 9, 1)
GO

/*  severity: LOG������
 *   - 0-9: ��ܪ��A��T�Τ��Y�������~�T��
 *   - 10: �ϥΪ̿�J����T�����D�Τ����T
 *   - 11-16: �ΨϥΪ̾ާ@�W�����~
 *   - 17-25: ���n��εw��W�����~ (17�H�W�n�q���t�κ޲z��
 *   - >19: �n���sysadmin�v���~��ϥΡA�B���f�tWITH LOG�ﶵ
 * state: �N����~�����A�A0~255�A�i�ѨϥΪ̦ۭq
 */
-- P13-28b
RAISERROR ('�o���Y�����~�I', 20, 1) WITH LOG 

GO
-- P13-29a

RAISERROR ('���T���� RAISERROR ����', 0, 1)
PRINT '���T���� PRINT ����'

GO
-- P13-29b

SELECT '���T���� SELECT ����'

GO

-- P13-30
BEGIN TRANSACTION
INSERT �X�X���q (���~�W��, ����)
  VALUES ('PHP�{���y��', 500)

UPDATE �q��
  SET    �O�_�I�� = 1
  WHERE  �q��Ǹ� = 3

IF @@ERROR !=0 OR @@ROWCOUNT = 0
   ROLLBACK TRANSACTION
ELSE
   COMMIT TRANSACTION

GO


/**************************************/
/* TRY-...CATCH 
 * �y�k: 
 * BEGIN TRY
 *   sql_statement
 * END TRY
 *
 * BEGIN CATCH
 *   sql_statement
 * END CATCH
 */
-- P13-32
BEGIN TRY
    RAISERROR (66666, 10, 1) WITH LOG  
    PRINT '�S���o�ͭ��j���~'                   
END TRY                                        
BEGIN CATCH  
    IF ERROR_SEVERITY() > 16   
      PRINT '�o���Y�����~�I�гq���޲z��, ���~�s����:' + 
			CAST(ERROR_NUMBER() AS CHAR)
    ELSE 
	  PRINT '�o�Ϳ��~�I���~�T����:' + ERROR_MESSAGE()
END CATCH

GO

/* TRY-...CATCH �L�k�B�z�����~ */
-- P13-33
BEGIN TRY
    SELECT * FROM ��ƪ�ABC
END TRY
BEGIN CATCH
    PRINT 'TRY�KCATCH �o�{�@�ӿ��~�G' + ERROR_MESSAGE()
END CATCH

GO

/* TRY-...CATCH �L�k�B�z�����~���ѨM��k --�Ҧp:�bSP�o�Ϳ��~ */
-- P13-34
CREATE PROCEDURE testTRYCATCHProc
AS
    SELECT * FROM ��ƪ�ABC
GO

BEGIN TRY
    EXECUTE testTRYCATCHProc 
END TRY                          
BEGIN CATCH
    PRINT 'TRY�KCATCH �o�{�@�ӿ��~�G' + ERROR_MESSAGE()
END CATCH

GO

-- P13-36a
THROW 51000, '�o�O�� THROW ���ͪ��ۭq���~.', 1
GO

-- P13-36b
BEGIN TRY
	THROW 51000, '�o�O�� THROW ���ͪ��ۭq���~.', 1
END TRY                                        
BEGIN CATCH  
    PRINT '���i�J CATCH �϶�';
	THROW
    PRINT '�����`���� CATCH �϶�'
END CATCH
PRINT '���妸����'

GO

-- P13-37
-- �إߥi�Ǧ^�q�浧�ƪ��w�s�{��
CREATE PROCEDURE CountOrder 
AS
    DECLARE @cnt INT
	SELECT @cnt = COUNT(*) FROM �q��		
    RETURN @cnt   -- �Ǧ^�q�浧��      
GO

-- P13-38
DECLARE @value int, @msg varchar(30)
SET @msg = '�q�浧�Ƭ��G'

EXEC @value = CountOrder       /* ����w�s�{�� */
IF @value > 0
	SET @msg += CAST(@value AS varchar)
ELSE
	SET @msg += '�S���q��'
PRINT @msg 
GO

-- P13-46
CREATE VIEW �U��O��_VIEW  
AS 
SELECT  ���, �Ȥ�W��, �a�}
FROM    �q��, �Ȥ�
WHERE   �q��.�Ȥ�s�� = �Ȥ�.�Ȥ�s��
GO

SELECT * FROM �U��O��_VIEW

GO

-- P13-47
WITH �U��O��_CTE         
AS (
   SELECT  ���, �Ȥ�W��, �a�}
   FROM    �q��, �Ȥ�
   WHERE   �q��.�Ȥ�s�� = �Ȥ�.�Ȥ�s��
)

SELECT * FROM �U��O��_CTE

GO

-- P13-50
WITH ���u���h_CTE (���u�s��, �m�W, �D�ޭ��u�s��, level, sort)
AS (                                            
    /* ���I��������X�� 1 �h���D�� */
    SELECT ���u�s��, 
           �m�W, 
           �D�ޭ��u�s��, 
           1,  
           CONVERT(varchar(255), �m�W)  
    FROM ���u                            
    WHERE �D�ޭ��u�s�� = 0 

    UNION ALL

    /* ���j�������ۥH�ۧکI�s���覡, ��X�U�D�ު����u */
    SELECT ���u.���u�s��,
           ���u.�m�W,
           ���u.�D�ޭ��u�s��,
           level+1, 
           CONVERT (varchar(255), sort + '-' + ���u.�m�W)  
    FROM ���u
    JOIN ���u���h_CTE ON ���u.�D�ޭ��u�s�� = ���u���h_CTE.���u�s��
                         
)

SELECT '|' + REPLICATE('-', level*2) + �m�W AS ���u�h��, ���u�s��, �D�ޭ��u�s��, level, sort
FROM ���u���h_CTE
ORDER BY sort

GO
���� -- P13-51

SELECT ���u�s��, �m�W, �D�ޭ��u�s��, 1, CONVERT(varchar(255), �m�W)
FROM ���u
WHERE �D�ޭ��u�s�� = 0

GO
���� -- P13-55

SELECT * FROM ���� 

MERGE ���� t             -- �ت���ƪ� (�n�Q��s����ƪ�)
USING ������� s         -- �ӷ����
ON t.ID = s.ID           -- ���w�G�Ӹ�ƪ����X (JOIN) ����
WHEN MATCHED AND t.�D�� <> s.�D�� THEN  -- ����ŦX�B�D�ޤ��P��, �N�ק�D��
     UPDATE 
     SET t.�D�� = s.�D��
WHEN NOT MATCHED BY TARGET THEN  -- ���b�ت���Ƥ���(���b�ӷ���Ƥ�), �N�s�W
     INSERT (ID, �����W��, �D��)
     VALUES (s.ID, s.�����W��, s.�D��)
WHEN NOT MATCHED BY SOURCE THEN  -- ���b�ӷ���Ƥ���(���b�ت���Ƥ�), �N�R��
     DELETE
OUTPUT $action, 
	deleted.ID, deleted.�����W��, deleted.�D��,
	inserted.ID, inserted.�����W��, inserted.�D��;

SELECT * FROM ����

GO
���� -- P13-56

MERGE �Ѳ��w�s t
USING (SELECT * FROM �Ѳ�����O�� WHERE �w�B�z = 0) s
ON t.�Ѳ��W�� = s.�Ѳ��W��
WHEN MATCHED AND t.�i�� + s.�ʶR�i�� = 0 THEN
	DELETE
WHEN MATCHED THEN
	UPDATE SET t.�i�� = t.�i�� + s.�ʶR�i��
WHEN NOT MATCHED THEN
	INSERT (�Ѳ��W��, �i��)
	VALUES (s.�Ѳ��W��, s.�ʶR�i��)
OUTPUT $action, 
	deleted.�Ѳ��W��, deleted.�i��,
	inserted.�Ѳ��W��, inserted.�i��;

SELECT * FROM �Ѳ��w�s

GO
���� -- P13-57

MERGE �Ѳ��w�s t
USING (	SELECT �Ѳ��W��, SUM(�ʶR�i��) AS �ʶR�i��
		FROM �Ѳ�����O�� 
		WHERE �w�B�z = 0
		GROUP BY �Ѳ��W��) s
ON t.�Ѳ��W�� = s.�Ѳ��W��
WHEN MATCHED AND t.�i�� + s.�ʶR�i�� = 0 THEN
	DELETE
WHEN MATCHED THEN
	UPDATE SET t.�i�� = t.�i�� + s.�ʶR�i��
WHEN NOT MATCHED THEN
	INSERT (�Ѳ��W��, �i��)
	VALUES (s.�Ѳ��W��, s.�ʶR�i��)
OUTPUT $action, 
	deleted.�Ѳ��W��, deleted.�i��,
	inserted.�Ѳ��W��, inserted.�i��;


GO
���� -- P13-58

-- ���妸�Ω�m���x�s���G��ܤ����ѳ�.sql
SELECT '<' + 
             CASE RIGHT(���y�W��, 2)   
                WHEN '��U' THEN '1�J��' 
                WHEN '���' THEN '2���' 
                WHEN '����' THEN '3�ޥ�' 
                WHEN '���D' THEN '4�޳N' 
                ELSE '5����' 
             END + '��>' AS ���O 
            , ���y�W�� 
FROM ���y 
ORDER BY ���O 

GO
