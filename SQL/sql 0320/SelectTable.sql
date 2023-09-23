GO 
USE Bank

--使用SELECT查詢語法進行跨資料表查詢，並顯示以下欄位 (1) "姓氏 + 名字" (姓與名中間要1個空白), (2) 生日與性別, (3)城市, 國籍 (4)帳號 (5) 分行名稱 (6) 餘額。其中(1), (2), (3)顯示結果,兩個欄位數值中間需要有一個','符號等作為區隔需分兩欄位的數值
SELECT(Personal.First_name+' ,'+Personal.Last_name) AS Name,
	  (CONVERT(Varchar,Personal.Birth_date)+','+Personal.Sex) AS Birth_date_Sex,
	  (Personal.City+','+Personal.Citizenship) AS City_Citizenship,
	  Personal.Acc,
	  Branch.分行名稱,
	  Account.Balance
FROM Personal,Branch,Account
WHERE Personal.Acc=Account.Acc AND Account.Branch_ID=Branch.分行代號

 --使用SELECT語法查詢所有使用者帳號一共交易的次數，並將結果以(1) "姓氏 + 名字", (2) 交易次數的結果顯示出來
SELECT (Personal.First_name+''+Personal.Last_name) AS Name,
		COUNT(Trade.Trade_ID) AS count_number
FROM Personal,Account,Trade
WHERE Personal.Acc=Account.Acc AND Account.Acc_ID=Trade.Acc_ID
GROUP BY (Personal.First_name+''+Personal.Last_name)
