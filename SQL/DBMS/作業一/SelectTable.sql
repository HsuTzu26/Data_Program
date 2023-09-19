/*
	Select Table
 以SELECT語法查詢經過CreateDB.sql以及AlterDB.sql執行後的資料庫，，規則說明如下
 - 3.1 使用SELECT查詢語法進行跨資料表查詢，並顯示以下欄位 
 (1) "姓氏 + 名字" (姓與名中間要1個空白), (2) 生日與性別, (3)城市, 國籍 (4)帳號 (5) 分行名稱 (6) 餘額。
 其中(1), (2), (3)顯示結果,兩個欄位數值中間需要有一個','符號等作為區隔需分兩欄位的數值 
 (1:15分、2-3: 10分，4-6:  5分，合計: 15x1 + 10x3 + 5x3=50分)
 - 3.2 使用SELECT語法查詢所有使用者帳號一共交易的次數，
 並將結果以(1) "姓氏 + 名字", (2) 交易次數的結果顯示出來 (1:20分, 2:20分, 執行結果正確性: 20分，合計: 60分)
*/

/*
使用SELECT查詢語法進行跨資料表查詢，並顯示以下欄位 
 (1) "姓氏 + 名字" (姓與名中間要1個空白), (2) 生日與性別, (3)城市, 國籍 (4)帳號 (5) 分行名稱 (6) 餘額。
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
使用SELECT語法查詢所有使用者帳號一共交易的次數，
 並將結果以(1) "姓氏 + 名字", (2) 交易次數的結果顯示出來
*/
SELECT	(Personal.FName + SPACE(1) + Personal.LName) AS NAME,
		COUNT(Transac.Transac_ID) AS Count_number
FROM Personal, Account, Transac
WHERE Personal.Acc = Account.Acc AND Account.Acc_ID = Transac.Acc_ID
GROUP BY (Personal.FName + ' ' + Personal.LName)
