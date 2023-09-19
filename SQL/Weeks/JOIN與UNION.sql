/****** �m��2 - JOIN ******/
SELECT ��.�Ȥ�W��, ��.�p���H, �ƶq, �ѦW
FROM   �Ȥ� AS �� JOIN �X�f�O�� AS �X ON ��.�Ȥ�W�� = �X.�Ȥ�W��

GO
-- JOIN ON - P9-12
SELECT �������y.�s��, �W��, ����
FROM   �������y JOIN �������y�w�w��  ON �������y.�s�� = �������y�w�w��.�s�� 

GO

-- ����JOIN �y�k(WHERE�����p) - P9-13
SELECT �������y.�s��, �W��, ����
FROM  �������y, �������y�w�w��
WHERE �������y.�s�� = �������y�w�w��.�s��
GO

-- �ϥΧO�W - P9-14a
SELECT * FROM   �мФ��q
SELECT * FROM   �X�X���q

SELECT �X.���~�W�� AS �X�X���q���~�W��, �X.���� ,  -- ���� �X�X���q
		��.���~�W�� AS �мФ��q���~�W��, ��.����   -- �k�� �мФ��q
FROM    �X�X���q AS �X  JOIN  �мФ��q AS ��  ON  �X.���~�W�� = ��.���~�W��
GO

-- LEFT JOIN - P9-14b
SELECT * FROM   �X�X���q
GO

SELECT �X.���~�W�� AS �X�X���q���~�W��, �X.���� ,		-- ���� �X�X���q
             ��.���~�W�� AS �мФ��q���~�W��, ��.����	-- �k�� �мФ��q
FROM   �X�X���q AS �X  LEFT JOIN  �мФ��q AS �� 
             ON  �X.���~�W�� = ��.���~�W��
GO

-- RIGHT JOIN - P9-15a
SELECT * FROM   �мФ��q
GO

SELECT �X.���~�W�� AS �X�X���q���~�W��, �X.���� ,		-- ���� �X�X���q
             ��.���~�W�� AS �мФ��q���~�W��, ��.����	-- �k�� �мФ��q
FROM    �X�X���q AS �X  RIGHT JOIN  �мФ��q AS ��
            ON  �X.���~�W�� = ��.���~�W��

GO

-- FULL JOIN - P9-15b
SELECT �X.���~�W�� AS �X�X���q���~�W��, �X.���� , 
             ��.���~�W�� AS �мФ��q���~�W��, ��.���� 
FROM   �X�X���q AS �X  FULL JOIN  �мФ��q AS �� 
            ON �X.���~�W�� = ��.���~�W�� 

GO

--  CROSS JOIN  - P9-15c
SELECT �X.���~�W�� AS �X�X���q���~�W��, �X.���� ,
             ��.���~�W�� AS �мФ��q���~�W��, ��.���� 
FROM   �X�X���q AS �X  CROSS JOIN  �мФ��q AS �� 

GO

-- SELF JOIN  - P9-17a
SELECT ���u.�m�W, ���u.¾��, ���x.�m�W AS �D��
FROM    ���u  LEFT JOIN  ���u AS ���x
             ON  ���u.�D�޽s�� = ���x.�s��

GO

/****** �m��3 - JOIN��X�m�� ******/

DECLARE @BookName nvarchar(30)
DECLARE @SearchCond nvarchar(50)
SET @BookName='Windows'
SET @SearchCond='%' + @BookName + '%'
select @SearchCond

SELECT �q��.�q��s��, �q��.�U����, ���y.���y�W��, �q�ʶ���.�ƶq, �Ȥ�.�Ȥ�W��, �Ȥ�.�p���H, �Ȥ�.�a�}, �Ȥ�.�q��
FROM �q�� LEFT JOIN �Ȥ� ON �Ȥ�.�Ȥ�s��=�q��.�Ȥ�s�� 
          LEFT JOIN �q�ʶ��� ON �q�ʶ���.�q��s��=�q��.�q��s��
          LEFT JOIN ���y ON ���y.���y�s�� = �q�ʶ���.���y�s��
--WHERE ���y.���y�W��='Windows Server �t�ι��' --��Ƿj�M
--WHERE ���y.���y�W�� like '%W%' -- keyword�j�M
--WHERE ���y.���y�W�� IN('Windows Server �t�ι��', 'Outlook �־ǧ֥�')
--WHERE ���y.���y�W�� like @SearchCond
--WHERE ���y.���y�W�� like '%Photoshop%'

/****** �m��4 - UNION��X�m�� ******/
--�����p��ϥ�UNION�X��2�Ӭd�ߵ��G 
SELECT �ѦW, SUM(����) AS �ɾ\�ƶq  -- INTO ##LinuxTable
FROM   �ɾ\�M��
WHERE �ѦW LIKE '%LINUX%'
GROUP BY �ѦW, ����

SELECT �ѦW, SUM(����) AS �ɾ\�ƶq  -- INTO #WinTable
FROM   �ɾ\�M��
WHERE �ѦW LIKE '%WINDOWS%'
GROUP BY �ѦW, ����

drop table #LinuxTable
drop table #WinTable

--�����p��ϥ�UNION�X��2�Ӭd�ߵ��G - ���ľާ@ - �ϥμȦs��ƪ�
SELECT �ѦW, SUM(����) AS �ɾ\�ƶq  INTO #Temp
FROM   �ɾ\�M��
WHERE �ѦW LIKE '%WINDOWS%' OR �ѦW LIKE '%LINUX%'
GROUP BY �ѦW, ����

DECLARE @Linux char(5)
SET @Linux='Linux'
DECLARE @Win char(7)
SET @Win='Windows'

SELECT @Linux AS ���O, * into #LinuxTable
FROM #Temp
WHERE �ѦW LIKE '%' + @Linux+ '%'
 
SELECT @Win AS ���O, * into #WinTable
FROM #Temp
WHERE �ѦW LIKE '%' + @Win+ '%' --'%Windows%'

SELECT * FROM #LinuxTable
SELECT * FROM #WinTable

SELECT * into #Result
FROM #WinTable
UNION
SELECT * FROM #LinuxTable

--�X�֦��@��SQL Statement
DECLARE @Linux char(5)
SET @Linux='Linux'
DECLARE @Win char(7)
SET @Win='Windows'

SELECT @Win, SUM(�ɾ\�ƶq) AS �`��
FROM #WinTable
UNION
SELECT @Linux, SUM(�ɾ\�ƶq) AS �`�� FROM #LinuxTable
GROUP BY ���O

-- ��L���k -�ϥ�IIF
SELECT IIF(�ѦW LIKE '%LINUX%', 'Linux', 'Windows') ���O,  ���� into #Result2
FROM   �ɾ\�M��
WHERE �ѦW LIKE '%LINUX%' OR �ѦW LIKE '%Windows%'

SELECT ���O, SUM(����) AS �ɾ\�ƶq 
FROM #Result2
GROUP BY ���O