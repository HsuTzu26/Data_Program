GO 
USE Bank

--�ϥ�SELECT�d�߻y�k�i����ƪ�d�ߡA����ܥH�U��� (1) "�m�� + �W�r" (�m�P�W�����n1�Ӫť�), (2) �ͤ�P�ʧO, (3)����, ���y (4)�b�� (5) ����W�� (6) �l�B�C�䤤(1), (2), (3)��ܵ��G,������ƭȤ����ݭn���@��','�Ÿ����@���Ϲj�ݤ�����쪺�ƭ�
SELECT(Personal.First_name+' ,'+Personal.Last_name) AS Name,
	  (CONVERT(Varchar,Personal.Birth_date)+','+Personal.Sex) AS Birth_date_Sex,
	  (Personal.City+','+Personal.Citizenship) AS City_Citizenship,
	  Personal.Acc,
	  Branch.����W��,
	  Account.Balance
FROM Personal,Branch,Account
WHERE Personal.Acc=Account.Acc AND Account.Branch_ID=Branch.����N��

 --�ϥ�SELECT�y�k�d�ߩҦ��ϥΪ̱b���@�@��������ơA�ñN���G�H(1) "�m�� + �W�r", (2) ������ƪ����G��ܥX��
SELECT (Personal.First_name+''+Personal.Last_name) AS Name,
		COUNT(Trade.Trade_ID) AS count_number
FROM Personal,Account,Trade
WHERE Personal.Acc=Account.Acc AND Account.Acc_ID=Trade.Acc_ID
GROUP BY (Personal.First_name+''+Personal.Last_name)
