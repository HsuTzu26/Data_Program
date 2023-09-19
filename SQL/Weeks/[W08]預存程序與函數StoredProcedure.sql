-- ������Ʈw
USE �m��14
GO 
-- �s�WStored Procedure
------------�W�h-------------
-- CREATE PROCEDURE {�w�s�{�ǦW��}
-- AS
-- {�{���X}

-- P14-9a
CREATE PROCEDURE MyProc1
AS
SELECT * FROM �мФ��q WHERE ���� > 400
GO 

-- ����SP
EXEC MyProc1

GO 
------------�W�h(�޼ƳW�h)-------------
-- CREATE PROCEDURE {�w�s�{�ǦW��}
-- @param1 {��ƫ��A}, @param2 {��ƫ��A}
-- {�ﶵ}
-- AS
-- {�{���X}

-- {�ﶵ}--
-- RECOMPILE : ����ɷ|���s�sĶ�@��
-- ENCRYPTION : �NSP�ʸˡA�ݤ���{���X

-- P14-9b
CREATE PROCEDURE MyProc2 
@param1 char(10), @param2 money 
WITH ENCRYPTION 
AS INSERT �мФ��q (���~�W��, ����) 
     VALUES (@param1, @param2) 
GO 

-- ����SP �a�J��J�޼�
EXEC MyProc2 '�զX�y��', 520
GO
SELECT * FROM �мФ��q 
GO 

-- P14-10
-- ����SP �a�J��J�޼� �H�� ��X(Output)
CREATE PROCEDURE MyProc3 
@param1 char(10), @param2 money, @param3 money OUTPUT 
AS INSERT �мФ��q (���~�W��, ����) 
     VALUES (@param1, @param2) 
     SELECT @param3 = SUM(����)
     FROM �мФ��q 
GO 

CREATE PROCEDURE MyProc4
@param1 money 
AS PRINT '�ثe���`����: ' + CONVERT(varchar, @param1) 
GO 

-- ����A��ܦ^�ǿ�X���G�A�ϥΫŧi�ܼƧ@������SP��X��
DECLARE @sum money
EXEC MyProc3 'MATHLAB ��U',320,@sum OUTPUT

PRINT @sum

EXEC MyProc4 @sum 

GO 

-- P14-11a
-- �[�J�^��(RETURN)
-- Note: SP�̭��d�ߵ��G���浧��h�����t��
CREATE PROCEDURE ���o�Ȥ�a�} 
@�Ȥ�s�� int, 
@�a�} varchar(100) OUTPUT 
AS SELECT @�a�} = �a�} 
     FROM �Ȥ� 
	 ORDER BY �Ȥ�s�� DESC
     WHERE �Ȥ�s�� = @�Ȥ�s�� 
IF @@rowcount > 0 
     RETURN 0   /* �p�G�d�ߨ�h�Ǧ^ 0 */ 
ELSE 
     RETURN 1   /* �S���d��N�Ǧ^ 1 */ 
GO 
-- DROP PROCEDURE ���o�Ȥ�a�}
-- SELECT * FROM �Ȥ�

DECLARE @ret int, @�a�} varchar(100) 
EXEC @ret = ���o�Ȥ�a�} 4, @�a�} OUTPUT  /* �� @ret �����Ǧ^�� */ 
IF @ret = 0 
     PRINT @�a�} 
ELSE 
     PRINT '�䤣��I' 

GO 


-- SP�s�յ{��
-- P14-11b
/* �إ� MyProc5 �w�s�{�Ǹs�ժ��� 1 �ӵ{�� */ 
CREATE PROCEDURE MyProc5;1 
AS SELECT * 
     FROM �X�X���q 
GO

/* �إ� MyProc5 �w�s�{�Ǹs�ժ��� 2 �ӵ{�� */ 
CREATE PROCEDURE MyProc5;2 
AS 
SELECT * 
     FROM �мФ��q 
GO 
MyProc5;1
EXEC MyProc5;2

GO 

-- P14-14

CREATE PROCEDURE MyProc6 
AS SELECT ���~�W��, ����
     FROM �мФ��q
     WHERE ���~�W�� LIKE '%SQL%'

GO 

-- �ק�(��s)�w�s�{��
-- �`�N�v��
-- P14-16
ALTER PROCEDURE MyProc2
AS SELECT * 
   FROM �мФ��q 

GO 

-- �i�[�J�޼ƹw�]�ȡA���w�]�ȮɡA����i���ݭn��J�޼ơA�����ǭn���T
-- P14-21
CREATE PROCEDURE test 
@a int, 
@b int = NULL, 
@c int = 3 
AS 
SELECT @a, @b, @c 
GO 

EXEC test     /* ���~, �Ĥ@�ӰѼƤ��i�� */ 
GO 
EXEC test 1  /* OK, �� 2�B3 �Ѽƥιw�]�� */ 
GO 
EXEC test 1, DEFAULT      /* OK, �i�� DEFAULT ��ܨϥιw�]�� */ 
GO
EXEC test 1, DEFAULT, 5  /* OK */ 
GO 
EXEC test 1, 2, 5                 /* OK */ 
GO 

GO 

-- �i��J�޼ơA�i�ϥ�DEFULALT��ܨϥ�SP���ت��w�]��
-- P14-22a
EXEC test @c = 5, @b = DEFAULT, @a = 1

GO 

-- P14-22b
EXEC test 1, @c = 2
GO
EXEC test @c = 2, 1
GO
EXEC test @c = 5
GO 


-- P14-23
CREATE PROCEDURE TestRetVal 
@TableName varchar(30) OUTPUT 
AS 
DECLARE @sqlstr varchar(100) 
SET @sqlstr = 'SELECT * FROM ' + @TableName 
--EXEC (@sqlstr)     /* ����r�ꤤ�� SQL �ԭz */ 
SELECT * FROM �X�X���q
IF @@ERROR = 0 
     BEGIN 
          SET @TableName = 'Hello' 
          RETURN 0 
     END 
ELSE 
     RETURN 1
GO
 
DECLARE @ret int, @name varchar(30) 
SET @name = '�X�X���q' 
EXEC @ret = TestRetVal @name OUTPUT 
SELECT @name + ', RETURN = ' + CAST(@ret AS CHAR) 

--- NOTE:������ܵ��G���� - �H��r�覡���
GO 

-- P14-24
CREATE PROCEDURE testWithResultSet     -- �إ߹w�s�{��
AS SELECT * FROM �X�X���q
GO

EXEC testWithResultSet

-- �ۭqSP�^�Ǹ�Ʈ榡
-- �y�k: 
-- EXEC
-- WITH RESULT SETS

EXEC testWithResultSet
WITH RESULT SETS
( (���~ nvarchar(20), 
   ���� int)
)

GO 

-- P14-26
CREATE PROCEDURE testWithResultSet2     -- �إ߹w�s�{��
AS 
SELECT * FROM �X�X���q
SELECT * FROM �мФ��q
GO

EXEC testWithResultSet2
WITH RESULT SETS
( (�X�X���~ nvarchar(20), ���� int),
  (�мв��~ nvarchar(20), ���� int)
)

GO 


-- SP�I�sSP --nested call
-- P14-29b
CREATE PROCEDURE proc3 
AS PRINT 'Proc3: at level ' + CAST(@@NESTLEVEL AS CHAR) 
GO 
CREATE PROCEDURE proc2 
AS PRINT 'Proc2 start: at level ' + CAST(@@NESTLEVEL AS CHAR) 
EXEC proc3 
PRINT 'Proc2 end: at level ' + CAST(@@NESTLEVEL AS CHAR) 
GO 
CREATE PROCEDURE proc1 
AS PRINT 'Proc1 start: at level ' + CAST(@@NESTLEVEL AS CHAR) 
EXEC proc2 
PRINT 'Proc1 end: at level ' + CAST(@@NESTLEVEL AS CHAR) 
GO 

EXEC proc1 
-- NOTE:�@SP Recursive call
GO 

-- �ϥ�TABLE���O�@���޼�
-- P14-33
CREATE TYPE IntTableType AS TABLE 
(�W�� VARCHAR(20), �ƭ� INT )
GO

CREATE PROC ��X�̤j��
@title varchar(30), 
@tab IntTableType READONLY
AS
DECLARE @maxv INT
SELECT @maxv = MAX(�ƭ�) FROM @tab

SELECT @title ����, �W�� �̤j��, @maxv �ƶq
FROM @tab
WHERE �ƭ� = @maxv
GO

-- P14-34
DECLARE @tab IntTableType
INSERT @tab
SELECT �Ȥ�W��, sum(�ƶq)
FROM �X�f�O��
GROUP BY �Ȥ�W��

EXEC ��X�̤j�� '�X�f�q�̤j���Ȥ�', @tab

--DELETE @tab

DECLARE @tab IntTableType
INSERT @tab
SELECT �Ѳ��W��, sum(�ʶR�i��)
FROM �Ѳ�����O��
GROUP BY �Ѳ��W��

EXEC ��X�̤j�� '�w�s�̦h���Ѳ�', @tab
GO