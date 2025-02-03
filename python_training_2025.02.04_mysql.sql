"""
Title:  : 第5章 Python-數據的整合、清理與轉換(MySQL)
File    : python_training_2025.02.04_mysql.sql
Author  : Ming-Chang Lee
Date    : 2025.02.04
YouTube : https://www.youtube.com/@alan9956
RWEPA   : http://rwepa.blogspot.tw/
GitHub  : https://github.com/rwepa
Email   : alan9956@gmail.com
"""

/*
大綱:
1.資料庫正規化簡介與MySQL安裝
2.MySQL Workbench-使用sakila資料庫
3.建立資料庫與資料表新增、查詢語法
4.案例實作練習
5.Python與MySQL應用
*/

-- ##############################
-- 1.資料庫正規化簡介與MySQL安裝
-- ##############################

-- ##############################
-- 資料庫的正規化 (Normalization)簡介
-- ##############################

/*
資料庫管理系統:
+ 資料庫 (database): 數位化的檔案櫃, 儲存電子檔案的處所，使用者可以對檔案中的資料執行新增、擷取、更新、刪除等操作.
+ 資料庫管理系統 (database management system): 提供資料庫定義, 資料處理, 資料安全, 資料備份等管理功能.

+ 資料庫 <--管理-- 資料庫管理系統 
+ MySQL <-- MySQL Workbench
+ Microsoft SQL Server <-- SQL Server Management Studio (SSMS)
+ PostgreSQL <-- pgAdmin
+ SQLite <-- SQLiteStudio # https://github.com/rwepa/teaching-sqlite

+ 資料表中每一個直行資料稱為欄位 (field).
+ 資料表中由多個欄位形成一筆記錄 (record), 一般以橫列表示.
+ 由多筆記錄形成一個資料表 (table).
+ 由多個資料表形成一個資料庫 (database).
+ 資料庫包括資料表 (tables), 檢視表 (views), 預存程序 (stored procedures), 函數 (functions)等物件.

+ 資料庫正規化(標準化, database normalization)是資料庫設計的一系列原理和技術, 其目的是減少資料庫中冗餘與錯誤資料, 增加資料的一致性.
+ 關聯式資料庫發明者-埃德加·科德(Edgar Frank Codd, IBM, 英國)最早提出資料庫正規化, 並於1970年定義第一階正規化, 第二階正規化, 第三階正規化.
+ 正規化結果會分解為多個資料表, 可使用 SQL - INNER JOIN 合併查詢為原始資料.

1.第一階正規化 (First Normal Form, 1NF): 每個資料表中的每一列的欄位資料都應該只有儲存一個值, 資料表中沒有意義相同的多個欄位.
2.第二階正規化 (Second Normal Form, 2NF): 除了1NF之外, 各欄位與 Primary Key間沒有『部分相依』的關係.
3.第三階正規化 (Third Normal Form, 3NF): 除了1NF, 2NF之外, 各欄位與 Primary Key間沒有『間接相依』的關係.

資料庫的關聯:
一對一關聯 (one-to-one): 一般關聯式資料庫會將1個資料表分解為2個資料表, 例:第2個資料表儲存機密性資料.
一對多關聯 (one-to-many): 一般關聯式資料庫主要支援一對多關聯.
多對多關聯 (many-to-many): 一般關聯式資料庫須將1個『多對多』分解為2個『一對多關聯』.

+ 下載並理解一對多關聯: https://github.com/rwepa/DataDemo/blob/master/%E5%8C%97%E9%A2%A8.xlsx
*/

-- ##############################
-- MySQL安裝
-- ##############################

-- 1.MySQL下載並練習安裝
-- Google --> MySQL Community Download
-- https://dev.mysql.com/downloads/
-- https://dev.mysql.com/downloads/installer/
-- https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-community-8.0.41.0.msi
-- file: mysql-installer-community-8.0.41.0.msi
-- size: 352.2MB

-- 2. Choosing a Setup Type --> 選取 [Full]

-- 3. root 密碼: 123456

-- Connect to server \ Password 輸入 123456 \ Check \ 綠底黑字 [Connection succeeded.] \ Next \ Execute \ Finish
-- Product Configuration 視窗 \ Next \ Finish
-- 安裝完成後自動開啟 MySQL Shell, MySQL Workbench 8.0 CE, 先按加上角關閉此二個視窗.

-- macOS - MySQL安裝, Select Operating System: macOS
-- https://dev.mysql.com/downloads/mysql/

-- macOS - MySQL Workbench
-- https://dev.mysql.com/downloads/workbench/

-- macOS – MySQL Example Database
-- https://dev.mysql.com/doc/index-other.html

-- Q: 如何完整移除 MySQL 所有產品
-- A: 程式集 \ MySQL \ MySQL Installer - Community \ Remove... \ 選取所有 Products \ Next \ Next \ Execute 
--    \ 最後步驟 [Yes, uninstall MySQL Installer] 打勾 \ Finish
-- 檔案總管 C:\Program Files\MySQL \ 手動刪除此目錄

-- ##############################
-- 2.MySQL Workbench-使用sakila資料庫
-- ##############################

-- MySQL Workbench - SQL Editor 視窗
-- 步驟1. 先選取執行的SQL程式
-- 步驟2. 按閃電按鈕 [Execute the selected portion of the script or everying, if there is no selection]
-- 或按 CTRL + Enter

-- 顯示資料庫版本, 今天日期
SELECT VERSION(), CURRENT_DATE;

-- 現在日期與時間
SELECT NOW();

-- 2的3次方, 與 Excel: =2^3 結果相同
SELECT power(2, 3);

-- 顯示所有資料庫
SHOW DATABASES;

-- 使用 sakila 資料庫
USE sakila;

-- 目前使用資料庫
SELECT DATABASE();

-- 顯示使用中資料庫的所有資料表
SHOW TABLES;

-- 資料表綱要
-- 欄位名稱,資料型態, NULL值,鍵,預設值,額外資訊(auto_increment自動編號)
DESCRIBE rental;

-- 查詢資料
SELECT * FROM rental;

-- 筆數總計 16044
SELECT count(*) FROM rental;

-- GROUP BY, 類似 Excel 樞紐分析
SELECT customer_id, count(customer_id) AS rental_count
FROM rental
GROUP BY customer_id;

-- 選取 rental_date 欄位
SELECT rental_date FROM rental;

-- 使用 DATE 函數取出日期資料
SELECT DATE(rental_date) FROM rental;
-- end

-- ##############################
-- 3.建立資料庫與資料表新增、查詢語法
-- ##############################

-- 建立資料庫 CREATE DATABASE
/*
方法1.
CREATE DATABASE IF NOT EXISTS 資料庫名稱
[CHARACTER SET 字元集名稱]
[COLLATE 定序名稱]

方法2.
MySQL Workbench 工具列 \ Create a new schema in the connected server
*/

-- 修改資料庫 ALTER DATABASE
/*
方法1.
ALTER DATABASE 資料庫名稱
[CHARACTER SET 字元集名稱]
[COLLATE 定序名稱]

方法2.
資料庫 \ 右鍵 \ Alter Schema…
*/

-- 刪除資料庫 DROP DATABASE
/*
方法1.
DROP DATABASE IF EXISTS 資料庫名稱
方法2.
資料庫 \ 右鍵 \ DROP Schema…
*/

-- SQL -資料庫操作

-- 建立資料庫 CREATE DATABASE
CREATE DATABASE IF NOT EXISTS mydbtest;

-- 修改資料庫 ALTER DATABASE
ALTER DATABASE mydbtest
COLLATE utf8mb4_unicode_ci;

-- 刪除資料庫 DROP DATABASE
-- 【注意】系統直接刪除資料庫,沒有詢問視窗.
DROP DATABASE IF EXISTS mydbtest;

-- 所有資料庫名稱
SHOW DATABASES;
SHOW SCHEMAS; -- same as above.

-- 系統資料庫的相關資訊
SELECT * FROM  information_schema.SCHEMATA;

-- 資料庫詳細資訊
-- 實作練習
-- Navigator \ 選取資料庫 \ 按 [i] 按鈕

-- MySQL 資料庫引擎

-- 資料庫版本-命令提示字元
-- CD C:\Program Files\MySQL\MySQL Server 8.0\bin
-- mysql -V

-- 資料庫版本-SQL語法
SHOW variables like 'version';

-- 顯示 MySQL 建立資料庫所使用引擎, 預設值 InnoDB

SHOW engines;

-- 資料庫字元集與定序

-- 使用 sakila 資料庫
USE sakila;

-- 顯示所有的字元集
SHOW CHARACTER SET;
 
-- 顯示所有的定序,包括排序與規則
SHOW COLLATION;

-- utf8mb4_unicode_ci
-- ci : case insensitive 不區分大小寫
-- cs : case sensitive   區分大小寫

-- 篩選符合 utf8mb4 開頭的定序
SHOW COLLATION LIKE 'utf8mb4%';

-- 查詢資料庫的字元集,定序
SELECT @@character_set_DATABASE, @@collation_DATABASE;
-- @@character_set_DATABASE, @@collation_DATABASE
-- 'utf8mb4', 'utf8mb4_0900_ai_ci'

-- MySQL 預設使用 CHARACTER SET : utf8mb4
-- MySQL 預設使用 collations    : utf8mb4_0900_ai_ci

-- 資料庫預設存放目錄
SHOW VARIABLES LIKE 'datadir';
-- C:\ProgramData\MySQL\MySQL Server 8.0\Data
-- ProgramData 是隱藏資料夾

-- 建立資料庫
CREATE DATABASE IF NOT EXISTS mydb
COLLATE utf8mb4_unicode_ci;

-- 按左側 [Refresh All] 按鈕
USE mydb;

SELECT @@character_set_DATABASE, @@collation_DATABASE;

-- 刪除資料庫
DROP DATABASE IF EXISTS mydb;

-- MySQL資料型態
-- https://dev.mysql.com/doc/refman/8.0/en/data-types.html 

-- 數值(整數 INT, 小數點 DECIMAL)
-- 日期,時間,時區
-- 字串: CHAR(10):不足10個字元會使用空格填滿, VARCHAR(10): 不會填補至10個字元.
-- 地理資料
-- JSON

-- 建立資料表 CREATE TABLE

CREATE DATABASE mydb;
USE mydb;

-- 建立 numericdata 資料表
CREATE TABLE IF NOT EXISTS numericdata (
	myname 		varchar(20),
    tinyintval 	tinyint(3) unsigned,
    intval  	smallint(6),    
    doubleval	double,
    decimalval 	decimal(10, 2)
);

-- 2 warning(s): 1681 Integer display width is deprecated and will be removed in a future release. 
-- 1681 Integer display width is deprecated and will be removed in a future release.
-- 有 warning, 但仍可建立 numericdata 資料表, 未來不再使用 () 寬度表示

-- 刪除 numericdata 資料表
DROP TABLE IF EXISTS numericdata;

-- 將 tinyint(3) 改為 tinyint unsigned, smallint(6) 改為 smallint
-- unsigned 表示只能儲存正數, 本例為 0 ~ 255
-- 以下 tinyint, smallint 已經不會有warning

CREATE table IF NOT EXISTS numericdata (
	myname 		varchar(20),
    tinyintval 	tinyint unsigned, -- 0 ~ 255
    intval  	smallint,         -- -32768 ~ 32767
    doubleval	double,
    decimalval 	decimal(10, 2)
);

-- 新增1筆資料
-- decimalval 欄位只可以儲存2個小數點位數, 使用 123.789 , 儲存為123.79
INSERT INTO numericdata VALUES ('mysql', 255, 32767, 123.456, 123.789);
-- 1 row(s) affected, 1 warning(s): 1265 Data truncated for column 'decimalval' at row 1

SELECT * FROM numericdata;

-- 新增2筆資料, 因為第2筆資料 intval 值為65535是不合法範圍,因此2筆都沒有新增.
INSERT INTO numericdata 
VALUES ('alan', 255, 32767, 1.23, 0.789),  -- 合法
('python', 255, 65535, 0.123456, 0.12);    -- 不合法
-- Error Code: 1264. Out of range value for column 'intval' at row 2

-- 全部記錄只有1筆
SELECT * FROM numericdata;
SELECT * FROM mydb.numericdata;

-- DECIMAL – 使用LPAD或RPAD。
SELECT LPAD("RWEPA", 10, "#") AS LeftPadCustomerName;

SELECT RPAD("RWEPA", 10, "#") AS RightPadCustomerName;

-- 建立 stringdata 資料表
CREATE TABLE IF NOT EXISTS stringdata (
	s1 varchar(6) CHARACTER SET latin1 COLLATE latin1_general_ci, -- 掛序不大小寫
    s2 varchar(6) CHARACTER SET latin1 COLLATE latin1_general_cs  -- 掛序有區分大小寫
);

INSERT INTO stringdata VALUES
('apple', 'Apple'),
('CHERRY', 'cherry'),
('aaa', 'aaa'),
('AAA', 'AAA'),
('bbb', 'bbb'),
('bbb', 'BBB');

SELECT * FROM stringdata;

-- 排序不區分大小寫
SELECT * FROM stringdata ORDER BY s1;

-- 排序先大寫,再小寫
SELECT * FROM stringdata ORDER BY s2;

-- NOW() 現在日期時間
SELECT NOW();

SELECT NOW(), SLEEP(3), NOW();

SELECT SYSDATE(), SLEEP(2) AS 延後2秒, SYSDATE();

-- 建立暫存表格 TEMPORARY
-- TEMPORARY 資料表名稱可以與資料庫中的資料表名稱一樣，
-- 不過在 TEMPORARY 表格存在的時候，資料庫中的表格會被隱藏起來，建議不要命同相同名稱。
CREATE TEMPORARY TABLE CityPopulation (
SELECT Name, Population 
FROM world.city 
WHERE CountryCode = 'TWN' AND Name = 'Taipei');

SELECT * FROM CityPopulation;

/* MySQL 多行註解
-- 建立資料表 CREATE TABLE

CREATE TABLE table_name (
	column1 datatype constraint,
	column2 datatype constraint,
	column3 datatype constraint,
	… 
);
*/

/*
限制式 constraint:
NOT NULL	– 不可以沒有輸入資料 (NULL 值)
UNIQUE		– 唯一性, 不重複
PRIMARY KEY – 主索引鍵, 結合 NOT NULL and UNIQUE, 區別每一列記錄
FOREIGN KEY	– 外來鍵 (參考其他資料表)
CHECK		– 條件檢查
DEFAULT		– 預設值
CREATE INDEX – 建立索引
*/

-- 外來鍵 https://dev.mysql.com/doc/refman/8.4/en/create-table-foreign-keys.html

-- ALTER TABLE 舊表格名稱 RENAME 新表格名稱
-- RENAME TABLE 舊表格名稱 TO 新表格名稱

-- 刪除表格
-- DROP TABLE [IF EXISTS] 表格名稱

-- SELECT 查詢
-- https://dev.mysql.com/doc/refman/8.4/en/select.html

/*
SELECT 欄位1, 欄位2, ... 
FROM 資料表
WHERE 條件式
GROUP BY 群組 
HAVING 群組條件
*/

-- WHERE 條件式
/*
= <> < <= > >=
*/

USE world;

-- 第2個 SELECT 表示子查詢
-- 找出最大 GNP 的國家
SELECT Name, GNP
FROM   country
WHERE  GNP = (SELECT MAX(GNP)
              FROM country);

-- 找出人口數大於 900萬的國家代碼
SELECT CountryCode
FROM   city
WHERE  Population > 9000000;

-- 使用 IN 運算
SELECT Name
FROM   country
WHERE  Code IN ('BRA','IDN','IND',
                'CHN','KOR','PAK');

-- 使用子查詢, IN運算子
SELECT Name
FROM   country
WHERE  Code IN ( SELECT CountryCode
                 FROM   city
                 WHERE  Population > 9000000 );

-- 子查詢結果超過1筆以上, WHERE "=" 等號條件式會有錯誤
SELECT Name
FROM   country
WHERE  Code = ( SELECT CountryCode
                FROM   city
                WHERE  Population > 9000000 );

-- 子查詢結果超過1筆以上, WHERE NOT IN條件式可執行
SELECT Name
FROM   country
WHERE  Code NOT IN ( SELECT CountryCode
                     FROM   city
                     WHERE  Population > 9000000 );

-- AND 運算子
SELECT Name, GNP
FROM   country
WHERE  Continent = 'Asia' AND GovernmentForm = 'Republic';

-- 多欄位查詢
SELECT Name, GNP
FROM   country
WHERE  (Continent, GovernmentForm) = ('Asia', 'Republic');

-- 找出與 Iraq 同一個地區,且政府型式相同者
SELECT Name
FROM   country
WHERE  (Region, GovernmentForm) = ( SELECT Region, GovernmentForm
                                    FROM   country
                                    WHERE  Name = 'Iraq' );

-- GROUP BY 群組
SELECT   Continent, MAX(GNP) AS MaxGNP
FROM     country
GROUP BY Continent;

-- GROUP BY 群組 + HAVING 條件式
SELECT   Continent, MAX(GNP) AS MaxGNP
FROM     country
GROUP BY Continent
HAVING MaxGNP >= 1000000;

-- ##############################
-- 4.案例實作練習
-- ##############################

/*
classicmodels 範例資料庫
https://github.com/rwepa/DataDemo/blob/master/mysqlsampledatabase.zip 
解壓縮為 mysqlsampledatabase.sql
執行 mysqlsampledatabase.sql
*/

-- 使用 SQL 理解顧客, 訂單, 訂單明細, 產品的資料摘要

USE classicmodels;
SHOW TABLES;
/*
'customers'
'employees'
'offices'
'orderdetails'
'orders'
'payments'
'productlines'
'products'
*/

-- 顧客
SELECT * FROM customers;
SELECT COUNT(*) FROM customers; -- 122

-- 次數統計表
SELECT country, count(*) as quantity
FROM customers
GROUP BY country
ORDER BY quantity DESC, country ASC; -- quantity 遞減排序, country 遞增排序

-- 產品
SELECT * FROM products;
SELECT COUNT(*) FROM products; -- 110

-- 數值資料轉換為類別型資料
SELECT productCode, productName, buyPrice,
CASE
	WHEN buyPrice >= 100 THEN 'High'
	WHEN buyPrice >= 50 AND buyPrice < 100 THEN 'Middle'
	ELSE 'Low'
END AS PriceType
FROM products;

-- NTILE 函數, 將資料平均分配到N個容器(bins)
-- 依照 buyPrice 由小至大, 平均分配到N個bins
SELECT buyPrice, 
	NTILE(3) OVER (
		ORDER BY buyPrice
        ) AS Ntile_UnitPrice
FROM products;

-- 訂單
SELECT * FROM orders;
SELECT COUNT(*) FROM orders; -- 326

-- 訂單明細
SELECT * FROM orderdetails;
SELECT COUNT(*) FROM orderdetails; -- 2996

-- 訂單明細統計指標
SELECT MIN(priceEach) Minimum, 
	MAX(priceEach) Maximum, 
    AVG(priceEach) Mean, 
    SUM(priceEach) Total,
    STDDEV(priceEach) 'Population standard deviation',
    STDDEV_SAMP(priceEach) 'Sample standard deviation',
    STDDEV_POP(priceEach) 'Population standard deviation'
FROM orderdetails;

-- INNER JOIN
-- LEFT  : orders
-- RIGHT : customers

SELECT * FROM orders;
SELECT * FROM customers;

SELECT orderNumber, orderDate, status, orders.customerNumber, customerName, country
FROM orders 
INNER JOIN customers 
ON orders.customerNumber = customers.customerNumber;

-- Q: 如何匯入外部資料
-- A: 參考 Table Data Export and Import Wizard: https://dev.mysql.com/doc/workbench/en/wb-admin-export-import-table.html

-- ##############################
-- 5.Python與MySQL應用
-- ##############################

/*
# 安裝 mysql-connector-python

# 方法1: 使用 conda 
# conda install -c conda-forge mysql-connector-python

# 方法2: 使用 pip【推薦使用pip】
# pip install mysql-connector-python
 
import mysql.connector as connection
import pandas as pd

try:
    mydb = connection.connect(host="localhost", 
                              database='sakila',
                              user="root", 
                              passwd="123456")
    
    query = "SELECT * FROM rental;"
    df = pd.read_sql(query, mydb)
    print(df.head())
    mydb.close() # close the connection
except Exception as e:
    mydb.close()
    print(str(e))
*/
-- end

-- 參考資料
-- RWEPA: http://rwepa.blogspot.com/
-- MySQL: https://www.w3schools.com/mysql/mysql_select.asp 
-- Stored routines (procedures and functions): https://dev.mysql.com/doc/refman/8.0/en/stored-routines.html 
-- Prepared Statements: https://dev.mysql.com/doc/refman/8.0/en/sql-prepared-statements.html 
-- https://dev.mysql.com/doc/connector-python/en/connector-python-introduction.html

/*
# 參考資料 -----

# RWEPA
# http://rwepa.blogspot.com/

# R資料科學家
# https://github.com/rwepa/r_data_scientist

# R入門資料分析與視覺化(付費,字幕)
# https://mastertalks.tw/products/r?ref=MCLEE

# R商業預測與應用(付費,字幕)
# https://mastertalks.tw/products/r-2?ref=MCLEE

# Python資料科學家
# https://github.com/rwepa/python_data_scientist

# Python 程式設計-李明昌 <免費電子書>
# http://rwepa.blogspot.com/2020/02/pythonprogramminglee.html

# SQL實作班
# https://erp.mgt.ncu.edu.tw/sql-practical-course/

# Streamlit互動式資料應用班
# https://erp.mgt.ncu.edu.tw/streamlit-application-course/
# end
