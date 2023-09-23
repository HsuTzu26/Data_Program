
--卸離資料庫
alter database Bank set single_user with rollback immediate
use master
exec sp_detach_db Bank
--附加資料庫
CREATE DATABASE Bank
ON 
(
	filename='D:\MSSQL_DB\bank.mdf'
)
FOR ATTACH;

--修改在[個人資訊]的[性別]欄位中，將預設值改為'M'
USE Bank
Alter table Personal DROP CONSTRAINT D_Sex
Alter table Personal add CONSTRAINT D_Sex  DEFAULT 'M' for Sex

--將[帳號]以及[交易紀錄]以[帳號ID]欄位進行Foreigen Key 關聯，且不得破壞1.3所建立的關聯性
Alter table Trade add Acc int
Alter table Trade add CONSTRAINT FK_Personal foreign key (Acc) references Personal(Acc)

--修改 [個人資訊]資料表中超過18歲才能開戶的限制，並變更為國籍為Taiwan才能開戶
Alter table Personal DROP CONSTRAINT age
Alter table Personal add CONSTRAINT nationality check(Citizenship = 'Taiwan') 

--修改這三個資料表的[更新日期與時間]欄位，設定預設值為 "今天"
update Account set Modify_date = GETDATE()
update Personal set Modify_date = GETDATE()
update Trade set Modify_date = GETDATE()

--新增一資料表，為銀行[分行帳號資料表]內容包含: (1)分行帳號 (2)分行名稱
CREATE TABLE Branch
(
	分行代號 char(20) CONSTRAINT PK_Acc_ID  PRIMARY KEY,
	分行名稱 char(20),
	銀行代號 char(20)
)
insert into Branch
	(分行代號,分行名稱,銀行代號)
values
	('01','台北銀行','004'),
	('02','桃園銀行','001'),
	('03','中壢銀行','002')

--將上述2.3.5(1)分行帳號使用Alter語法使用Foreigen Key與[帳號資料表] 進行關聯，且不得破壞2.3.2 與1.3所建立的關聯性 
Alter table Account add CONSTRAINT FK_Branch_account  foreign key (Branch_ID) references Branch(分行代號)
