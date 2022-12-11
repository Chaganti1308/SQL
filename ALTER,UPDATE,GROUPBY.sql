CREATE DATABASE SALES_DATABASE;

USE SALES_DATABASE;

CREATE TABLE IF NOT EXISTS SALES
(
order_id varchar(30) NOT NULL,
order_date varchar(30) NOT NULL,
ship_date varchar(30) NOT NULL,
ship_mode varchar(30) NOT NULL,
customer_name varchar(30) NOT NULL,
segment varchar(30) NOT NULL,
state varchar(30) NOT NULL,
country varchar(30) NOT NULL, 
market varchar(30) NOT NULL,
region varchar(30) NOT NULL,
product_id varchar(30) NOT NULL,
category varchar(30) NOT NULL,
sub_category varchar(30) NOT NULL,
product_name varchar(100) NOT NULL,
sales VARCHAR(30) NOT NULL,
quantity VARCHAR(30) NOT NULL,
discount VARCHAR(30) NOT NULL,
profit VARCHAR(30) NOT NULL,
shipping_cost VARCHAR(30) NOT NULL,
order_priority varchar(30) NOT NULL,
`year` VARCHAR(38) NOT NULL 
);


CREATE TABLE sales_data (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15)  NOT NULL, 
	ship_date VARCHAR(15)  NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

SET SESSION sql_mode = '';

LOAD DATA INFILE
"D:/FSDA/SQL_datasets/sales_data_final.csv"
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM sales_data;

SELECT COUNT(*) FROM sales_data;

SELECT str_to_date(order_date,'%m/%d/%y') FROM sales_data;

SHOW COLUMNS IN sales_data;

ALTER TABLE sales_data
ADD COLUMN order_date_new date after order_date;

SELECT * FROM sales_data;

UPDATE sales_data
SET order_date_new = str_to_date(order_date,'%m/%d/%Y');

SELECT * FROM sales_data;

ALTER TABLE sales_data
ADD COLUMN ship_date_new date after ship_date;

SELECT * FROM sales_data;

UPDATE sales_data
SET ship_date_new = str_to_date(ship_date,'%m/%d/%Y');

select * from sales_data;

SHOW COLUMNS IN sales_data;

set SQL_SAFE_UPDATES = 0;

SELECT * from sales_data where ship_date_new = '2011-01-05';
SELECT count(*) from sales_data where ship_date_new = '2011-01-05';

SELECT * from sales_data where ship_date_new > '2011-01-05';
SELECT count(*) from sales_data where ship_date_new > '2011-01-05';

SELECT * from sales_data where ship_date_new < '2011-01-05';
SELECT count(*) from sales_data where ship_date_new < '2011-01-05';

SELECT * from sales_data where ship_date_new between '2011-01-05' and '2011-02-06';
SELECT count(*) from sales_data where ship_date_new between '2011-01-05' and '2011-02-06';

SELECT date_sub(now() , interval 1 week);
select * from sales_data where ship_date_new < date_sub(now() , interval 1 week);

select date_sub(now() , interval 1 week);
select date_sub(now() , interval 30 day);
select date_sub(now() , interval 30 year);
select year(now());
select dayname('2022-09-20 21:10:30');

SELECT * FROM sales_data;

ALTER TABLE sales_data
ADD COLUMN flag DATE AFTER order_id;

UPDATE sales_data
SET flag = now();

ALTER TABLE sales_data
MODIFY COLUMN `year` datetime;

ALTER TABLE sales_data
ADD COLUMN year_new year after order_date_new;

ALTER TABLE sales_data
MODIFY COLUMN year_new INT;

ALTER TABLE sales_data
ADD COLUMN month_new int after year_new;

ALTER TABLE sales_data
ADD COLUMN day_new int after month_new;

select * from sales_data;

select month(order_date_new) from sales_data;

update sales_data set year_new = year(order_date_new);
update sales_data set month_new = month(order_date_new);
update sales_data set day_new = day(order_date_new);

-- segregating by years using aggregation functions sales
SELECT year_new , avg(sales) from sales_data group by year_new; 
SELECT year_new , sum(sales) from sales_data group by year_new;
SELECT year_new , min(sales) from sales_data group by year_new;  
SELECT year_new , max(sales) from sales_data group by year_new; 


select (sales*discount+shipping_cost) AS CTC FROM sales_data;

SELECT order_id, discount, if(discount > 0 , 'yes','no') as discount_flag from sales_data;
 
ALTER TABLE sales_data 
ADD COLUMN discount_flag varchar(20) after discount;

ALTER TABLE sales_data 
ADD COLUMN CTC VARCHAR(20) after quantity;

UPDATE sales_data 
set CTC = sales*discount+shipping_cost;

select * from sales_data;

UPDATE sales_data 
set discount_flag = if(discount > 0 ,'yes' , 'no');

