-- 資料庫新增Table語法

CREATE TABLE Customer
(
    First_Name char(50),
    Last_Name char(50),
    Address char(50),
    City char(50),
    Country char(25),
    Birth_Date datetime
);

-- 插入1筆資料至Table
INSERT INTO Customer
    (First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES
    ('CY', 'Lien', 'NTUNHS', 'Taipei', 'Taiwan', '19900101');

-- 查詢所有資料
SELECT *
FROM Customer