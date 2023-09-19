USE master
IF DB_ID ( 'Ex3' ) IS NOT NULL
  DROP DATABASE Ex3;
GO
CREATE DATABASE Ex3
GO
USE Ex3;

/* - 1. �D�D1: �]�p�@�Ӧ۰ʲ��ͥ������ID���\��, �W�h�����p�U:
   - 1.1 �C�����������[���ID]�e8�X���H�t�Τ���R�W�A��6�X����������Ǹ��A�榡: �t�Τ��(8�X)_�Ǹ�(6�X)�C
   - 1.2 �y������1�}�l�s�X�A�y���������h�����0�C
   - 1.3 �Ѧҽd��: 20190507_000001
 */
DECLARE @TS varchar(8)		--�t�Τ��(8�X)
DECLARE @No varchar(6)		--�榡: �Ǹ�(6�X)
DECLARE @TranID varchar(15)	--�榡: �t�Τ��(8�X)_�Ǹ�(6�X)
DECLARE @LogCount int		--�]�w�p��

SET @LogCount=000001
--PRINT @LogCount 

/*1. �ഫdate --> yyyymmdd */
SET @TS=CONVERT(varchar, GETDATE(), 112)	--�Ndate�ରvarchar
--PRINT '���(yyyymmdd)= ' + @TS

/* 2. ���ͥ����0���Ǹ� */
--PRINT REPLICATE('0', 6)					--(1)���ͪ���=6���r��(varchar)
--PRINT CAST(@LogCount as varchar)	    --(2)�Ǹ����A�ഫ int-->varchar

/* ��k1: �ϥΪ�����000000 */
SET @No = RIGHT('000000'+CAST(@LogCount as varchar),6)
/* ��k2: �ϥ�REPLICATE */
/*SET @No = RIGHT(REPLICATE('0', 6) + CAST(@LogCount as varchar),6)
PRINT @No*/

/* 3. ���ͨt�Τ��(8�X)_�Ǹ�(6�X) */
SET @TranID = @TS + '_' + @No
PRINT 'TranID= ' + @TranID

-----------------------------------------------------------------------------------------------------------------
/* 2. �D�D2: �]�p�@�Ӧ۰ʭp�ⲣ�ͥ����������ƪ�A�O���C�鲣�ͦh�ֵ�ID
      ����: �s�W�@�Ӹ�ƪ�LOG_SEQ�A����ƪ��O���C�Ѥ@�@���h�ֵ�log���͡A�H���yyyymmdd�@��primary key 
	  Schema�W�h�p�U 
*/
-- �إ߬������X�P�έp���
CREATE TABLE LOG_SEQ(
  SDATE varchar(8) NOT NULL PRIMARY KEY, 	-- ��Ѫ�log����
  LOG_COUNT varchar(6) NOT NULL 			-- ��Ѥ@�@���h�ֵ�log
) 

-- �إߥ���������
CREATE TABLE Trans (
	ID  char(15),		  /* �榡: �t�Τ��(8�X)_�Ǹ�(6�X) */    
    TransDate   datetime
);
GO
/* 2.1 �м��gSQL Script�p�G��ѲĤ@��log���ͮɡA�BLOG_SEQ�L��Ʈ�, �s�W��Ѫ������A�õ�����l�ơASDATE�ƭȫ��w����ѡA�BLOG_COUNT���w��0 (30)
   2.2 �e2.1, �Y�C�s�W�@��log�ɡALOG_COUNT�۰ʥ[1 (10)
   ����: 2�ϥΤl�d��(Subquery)����EXISTS�y�k 
 */

-- (1) �d��LOG_SEG��X���LOG_COUNTG��
SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = CONVERT(varchar, GETDATE(), 112)

-- (2) �p�G�w����-->�hLOG_COUNT+1�A��Update LOG_COUNT�F 
--     �p�G�S��-->��ܤ����٨S�������������---> Insert�Ĥ@����ơALOG_COUNT=1

DECLARE @No varchar(6)		--�榡: �Ǹ�(6�X)
DECLARE @TS varchar(8)		--�榡: �t�Τ��(8�X)

--SET @TS = CONVERT(varchar, GETDATE(), 112)
SET @TS = '20220509' /* ��ʿ�J���(���ե�) */

SET @No=(SELECT LOG_COUNT FROM LOG_SEQ WHERE SDATE = @TS)

IF @No IS NULL	/* �p�G�S��-->��ܤ����٨S������������� */
	BEGIN
		SET @No = '000001'
		INSERT INTO LOG_SEQ VALUES(@TS ,'000001') /* Insert�Ĥ@����ơALOG_COUNT=0 */
	END
ELSE			/* �p�G�w����-->�hLOG_COUNT+1�A��Update LOG_COUNT�F */
	BEGIN
		SET @No=RIGHT('000000'+ CAST( (CAST(@No as int) + 1) as varchar),6)
		UPDATE LOG_SEQ SET LOG_COUNT=@No WHERE SDATE = @TS	--��sLOG_COUNT		
	END

--SELECT * FROM LOG_SEQ

/* ����TransID: �t�Τ��(8�X)_�Ǹ�(6�X)*/
DECLARE @TranID varchar(15)		--�榡: �t�Τ��(8�X)_�Ǹ�(6�X)
SET @TranID = @TS + '_' + @No

--TRUNCATE TABLE LOG_SEQ
-----------------------------------------------------------------------------------------------
/* 3.�D�D3: ��X1�P2�y�k�A�åB�NSDATE�H��LOG_COUNT�����G�a�J�s�W[�������]�y�k(INSERT)�� */
INSERT INTO Trans VALUES(@TranID, GETDATE())
SELECT * FROM LOG_SEQ
SELECT * FROM Trans

-----------------------------------------------------------------------------------------------
/* 4. �Эק�[�ӤH��T]��ƪ�A�÷s�W[�ӤH�K�X]���A�ϥ��ܼƫŧi�覡���gSQL Script��J�b���P�K�X�A�Y�b�K���T�A���"�K�X���T"�F�K�X���~���"�K�X���~" (20)-*/ 
CREATE TABLE Customer (
    ID  char (10) PRIMARY KEY,
    PWD varbinary(500)	
);

CREATE TABLE CustomerWithPWDPlainText (
    ID  char (10) PRIMARY KEY,
    PWD varchar(100)	
);

INSERT INTO CustomerWithPWDPlainText
VALUES('cym','123');
SELECT * FROM CustomerWithPWDPlainText

/* �K�X�O�@ */
-- ��k1: �ϥ�PWDENCRYPT�[�K
INSERT INTO Customer
VALUES('cy',PWDENCRYPT('123'));
SELECT * FROM Customer

-- ���ұK�X
DECLARE @gID varchar(10) 
DECLARE @gPWD varchar(20)
SET @gID='cy' 
SET @gPWD='123' 

SELECT pwdcompare(@gPWD,PWD)
FROM Customer
WHERE ID=@gID

GO

--��k2: �ϥ�HASHBYTES
/*
  HASHBYTES ( '<algorithm>', { @input | 'input' } )  
  <algorithm>::= MD2 | MD4 | MD5 | SHA | SHA1 | SHA2_256 | SHA2_512   
*/

INSERT INTO Customer
VALUES('cy15',HASHBYTES('SHA2_512','123'));
SELECT * FROM Customer

DECLARE @gID varchar(16) 
DECLARE @gPWD varchar(20)
SET @gID='cy15' 
SET @gPWD='123' 

SELECT * FROM Customer WHERE ID=@gID AND PWD= HASHBYTES('SHA2_512',@gPWD)

/*�D�D4: �b���K�X���ҥ\��
* ����: �����@��[�ӤH��T]��ƪ�A�s�W[�ӤH�K�X]���A�ϥ��ܼƫŧi�覡���gSQL Script��J�b���P�K�X
        �Y�b�K���T�A���"�K�X���T"�F�K�X���~���"�K�X���~"
		�Y�b�����s�b�A���"�b�����s�b"
*/

/* SQL Injection �Hphp��@�b���K�X�n�J���d�� */
/* ���PHP ���檺 SQL �y�k: 
   
     SELECT * FROM Customer  WHERE ID='$name' AND PWD='$password'
   
   �p�G�b�ȿ�J���S��r�����b��ID�G�u'' or 1=1 -- �v�A�K�X�G�u���N��(I love SQL)�v  
�o��SQL�y�k�N�|�ܦ��G

     SELECT * FROM Customer  WHERE ID='' or 1=1 -- AND PWD='I love SQL'
*/

DECLARE @DangerSQL varchar(100)	
SET @DangerSQL='SELECT * FROM Customer WHERE ID='''' OR 1=1 -- AND PWD=''I love SQL'''
PRINT @DangerSQL
EXEC (@DangerSQL)   --����@DangerSQL����r���O
