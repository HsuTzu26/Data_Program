USE �m��10

--#1. �ϥ�JOIN�y�k��g10-7�d��(25)
	-- 1. ����: �Шϥ�OUTER�@JOIN�y�k�N[�q��]�H��[�q�ʶ���]�X�֡A����X��ܵ��G���P�w�U�{���X���G�@�P
/*SELECT �q��s��, �U����, 
       �`�ƶq = (SELECT SUM(�ƶq) 
                 FROM  �q�ʶ��� 
                 WHERE �q��s�� = �q��.�q��s��)
FROM   �q��
GO*/

-- OUTER JOIN
SELECT A.�q��s��, A.�U����, SUM(B.�ƶq) AS �`�ƶq
FROM �q�� A
LEFT OUTER JOIN �q�ʶ��� B ON  A.�q��s��=B.�q��s��
GROUP BY A.�q��s��, A.�U����;
GO
-- 2. �d����줤���T�w�r���y�k(25)
	-- 1. ����: �Ьd�߸�ƪ�[�мФ��q]���A[���~�W��]���e�]�t "�Y�Y"��U�����G�A�Ҧp: ��ƪ��~�W�٦�Windows{�Y}{�Y}��U�A���d�ߪ̧ѰO�Y�Y�O���Ө�Ӧr�A�Шϥ�LIKE�y�k�������d�ߵ��G
SELECT *
FROM �мФ��q
WHERE ���~�W�� LIKE '%��U'

/*SELECT *
FROM �мФ��q
WHERE ���~�W�� LIKE 'Windows%��U'*/

--# 3. �d����줤���T�w�r���]�t�b�Y�ӽd��y�k(25)
	-- 1. ����: �j���O�o��ƪ�[�мФ��q]�����Y�����~��[���~�W��]�����e:  {�Y�r��}indows�A�o��{�Y�r��}�i��OS,T,U,V W,X,Y, Z���Y�Ӧr���A �Шϥ�LIKE�y�k��U�j���������d�ߵ��G

SELECT * 
FROM �мФ��q 
WHERE ���~�W�� LIKE '[s-z]indows%'

/*
### 4. ���N�d�ߵ��G�����r��(25)
 - 1. ����: �ө��Q�n��[�ݨ�]��ƪ������O�򺡷N�פ��O�ϥΤ�����N�쥻���ƭȡA�è̷Ӻ��N�ױƧǡA�Ш̪���(04_WISH.jpg)�����N�ױƧ���ܵ��G�C
 - 2. �ʧO:
     1-�k
     2-�k
 - 3 ���N��:
    - 3 ���N
    - 2: �|�i
    - 1: �t�l
*/
SELECT
    �ݨ��s��,
    IIF(�ʧO = 1, '�k', '�k') AS �ʧO,
    IIF(���N�� = 3, '���N', IIF(���N�� = 2, '�|�i', '�t�l')) AS ���N��
FROM
    �ݨ�
GROUP BY
    �ݨ��s��,
    �ʧO,
    ���N��
ORDER BY
	--���N�� DESC, --(�ƧǷ|�ܺ��N- �t�l-�|�i, ���ŦX�Ϥ��W�榡)
    --IIF(���N�� = 3, 1, IIF(���N�� = 2, 2, 3)), -- �k1. �Q��IIF�y�k�վ㶶��, �w�]��ASC, EX:��3�ܬ�1, �N��ƨ�̤W�h
	case when ���N��=3 then 1 when ���N��=2 then 2 else 3 end, -- �k2. �Q�� case when then �h����
	�ݨ��s�� ASC;

