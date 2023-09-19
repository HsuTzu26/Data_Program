/*
### 練習2
請參考附檔根據Pokemon遊戲的資料庫ER Model設計模型使用T-SQL CREATE語法建置資料表，
並以適當的Primary Key以及Foreign Key關聯設計圖中的表格
*/

USE master;

if DB_ID('Pokemon') is not null
	DROP DATABASE Pokemon
GO
CREATE DATABASE Pokemon
GO

USE Pokemon;

-- 主角
-- 背包-道具/ 紀念品-道館-玩家隊伍/ 屬性- 寶可夢圖鑑
-- 寶可夢隊伍-寶可夢倉庫

CREATE TABLE 主角
(
	主角ID int PRIMARY KEY,
	money int,
	背包ID int,
	隊伍ID int,
)

CREATE TABLE 背包
(
	背包ID int PRIMARY KEY,	
	道具ID int,
	紀念品ID int
)

CREATE TABLE 道具
(
	道具ID int PRIMARY KEY,
	道具名稱 char(20),
	道具功能 char(20),
)

CREATE TABLE 紀念品
(
	紀念品ID int PRIMARY KEY,
	紀念品名稱 char(20),
	道館ID int,
)

CREATE TABLE 道館
(
	道館ID int PRIMARY KEY,
	道館名稱 char(20),
	money int,
	佔領隊伍 int,
	屬性ID int
)

CREATE TABLE 玩家隊伍
(
	玩家隊伍ID int PRIMARY KEY,
	玩家ID int,
)

CREATE TABLE 寶可夢隊伍
(
	隊伍ID int PRIMARY KEY,
	寶可夢ID_1 int,
	寶可夢ID_2 int,
	寶可夢ID_3 int,
	寶可夢ID_4 int,
	寶可夢ID_5 int,
	寶可夢ID_6 int,
)

CREATE TABLE 屬性
(
	屬性ID int PRIMARY KEY,
	屬性名稱 char(20)
)

CREATE TABLE 寶可夢倉庫
(
	寶可夢ID int PRIMARY KEY,
	寶可夢編號 int,
	名字 char(20),
	HP int,
	經驗值 int,
	level int,
	物功 int,
	特攻 int,
	防禦 int,
	敏捷 int,
	技能1 char(10),
	技能2 char(10),
	技能3 char(10),
	技能4 char(10),
)

CREATE TABLE 寶可夢圖鑑
(
	寶可夢編號 int PRIMARY KEY,
	名字 char(20),
	Poke屬性ID int,
)

ALTER TABLE 主角 ADD CONSTRAINT 背包ID FOREIGN KEY (背包ID) REFERENCES 背包(背包ID)
ALTER TABLE 主角 ADD CONSTRAINT 隊伍ID FOREIGN KEY (隊伍ID) REFERENCES 寶可夢隊伍(隊伍ID)

ALTER TABLE 背包 ADD CONSTRAINT 道具ID FOREIGN KEY (道具ID) REFERENCES 道具(道具ID)
ALTER TABLE 背包 ADD CONSTRAINT 紀念品ID FOREIGN KEY (紀念品ID) REFERENCES 紀念品(紀念品ID)

ALTER TABLE 紀念品 ADD CONSTRAINT 道館ID FOREIGN KEY (道館ID) REFERENCES 道館(道館ID)

ALTER TABLE 道館 ADD CONSTRAINT 佔領隊伍 FOREIGN KEY (佔領隊伍) REFERENCES 玩家隊伍(玩家隊伍ID)
ALTER TABLE 道館 ADD CONSTRAINT 屬性ID FOREIGN KEY (屬性ID) REFERENCES 屬性(屬性ID)

ALTER TABLE 玩家隊伍 ADD CONSTRAINT 玩家ID FOREIGN KEY (玩家ID) REFERENCES 主角(主角ID)

ALTER TABLE 寶可夢隊伍 ADD CONSTRAINT 寶可夢ID_1 FOREIGN KEY (寶可夢ID_1) REFERENCES 寶可夢倉庫(寶可夢ID)
ALTER TABLE 寶可夢隊伍 ADD CONSTRAINT 寶可夢ID_2 FOREIGN KEY (寶可夢ID_2) REFERENCES 寶可夢倉庫(寶可夢ID)
ALTER TABLE 寶可夢隊伍 ADD CONSTRAINT 寶可夢ID_3 FOREIGN KEY (寶可夢ID_3) REFERENCES 寶可夢倉庫(寶可夢ID)
ALTER TABLE 寶可夢隊伍 ADD CONSTRAINT 寶可夢ID_4 FOREIGN KEY (寶可夢ID_4) REFERENCES 寶可夢倉庫(寶可夢ID)
ALTER TABLE 寶可夢隊伍 ADD CONSTRAINT 寶可夢ID_5 FOREIGN KEY (寶可夢ID_5) REFERENCES 寶可夢倉庫(寶可夢ID)
ALTER TABLE 寶可夢隊伍 ADD CONSTRAINT 寶可夢ID_6 FOREIGN KEY (寶可夢ID_6) REFERENCES 寶可夢倉庫(寶可夢ID)

ALTER TABLE 寶可夢倉庫 ADD CONSTRAINT 寶可夢編號 FOREIGN KEY (寶可夢編號) REFERENCES 寶可夢圖鑑(寶可夢編號)

ALTER TABLE 寶可夢圖鑑 ADD CONSTRAINT Poke屬性ID FOREIGN KEY (Poke屬性ID) REFERENCES 屬性(屬性ID)