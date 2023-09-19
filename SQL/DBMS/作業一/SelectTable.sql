/*
	Select Table
 �HSELECT�y�k�d�߸g�LCreateDB.sql�H��AlterDB.sql����᪺��Ʈw�A�A�W�h�����p�U
 - 3.1 �ϥ�SELECT�d�߻y�k�i����ƪ�d�ߡA����ܥH�U��� 
 (1) "�m�� + �W�r" (�m�P�W�����n1�Ӫť�), (2) �ͤ�P�ʧO, (3)����, ���y (4)�b�� (5) ����W�� (6) �l�B�C
 �䤤(1), (2), (3)��ܵ��G,������ƭȤ����ݭn���@��','�Ÿ����@���Ϲj�ݤ�����쪺�ƭ� 
 (1:15���B2-3: 10���A4-6:  5���A�X�p: 15x1 + 10x3 + 5x3=50��)
 - 3.2 �ϥ�SELECT�y�k�d�ߩҦ��ϥΪ̱b���@�@��������ơA
 �ñN���G�H(1) "�m�� + �W�r", (2) ������ƪ����G��ܥX�� (1:20��, 2:20��, ���浲�G���T��: 20���A�X�p: 60��)
*/

/*
�ϥ�SELECT�d�߻y�k�i����ƪ�d�ߡA����ܥH�U��� 
 (1) "�m�� + �W�r" (�m�P�W�����n1�Ӫť�), (2) �ͤ�P�ʧO, (3)����, ���y (4)�b�� (5) ����W�� (6) �l�B�C
*/
USE Bank;
GO
-- CONVERT(data_type, date, style)
SELECT	(Personal.FName + SPACE(1) + Personal.LName) AS NAME,
		(CONVERT(varchar, Personal.BDate) + '  ,' + Personal.Gender) AS Birth_and_Gender,
		(Personal.City + '' + Personal.Citizenship) AS City_Citizenship,
		Personal.Acc,
		Branch.Branch_ID,
		Account.Balance
From Personal, Branch, Account
WHERE Personal.Acc= Account.Acc AND Branch.Branch_ID = Account.Branch_ID

/*
�ϥ�SELECT�y�k�d�ߩҦ��ϥΪ̱b���@�@��������ơA
 �ñN���G�H(1) "�m�� + �W�r", (2) ������ƪ����G��ܥX��
*/
SELECT	(Personal.FName + SPACE(1) + Personal.LName) AS NAME,
		COUNT(Transac.Transac_ID) AS Count_number
FROM Personal, Account, Transac
WHERE Personal.Acc = Account.Acc AND Account.Acc_ID = Transac.Acc_ID
GROUP BY (Personal.FName + ' ' + Personal.LName)
