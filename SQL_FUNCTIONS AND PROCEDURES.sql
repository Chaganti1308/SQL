-- 1MB = 1048576
-- 200 MB = 200 * 1048576
SET GLOBAL MAX_ALLOWED_PACKET = 209715200;

USE sales_database;

CREATE TABLE IF NOT EXISTS online_retail (
	`InvoiceNo` VARCHAR(7) NOT NULL, 
	`StockCode` VARCHAR(12) NOT NULL, 
	`Description` VARCHAR(35) NULL, 
	`Quantity` DECIMAL(38, 0) NOT NULL, 
	`InvoiceDate` VARCHAR(30), 
	`UnitPrice` DECIMAL(38, 3) NOT NULL, 
	`CustomerID` DECIMAL(38, 0) NULL, 
	`Country` VARCHAR(20) NOT NULL
);

DROP TABLE online_retail;

SELECT * FROM online_retail;

LOAD DATA INFILE
"D:/FSDA/SQL_datasets/Online_Retail.csv"
INTO TABLE online_retail
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT COUNT(*) FROM online_retail;

SELECT * FROM sales_data;

SELECT count(*) FROM sales_data;

DELIMITER $$
CREATE FUNCTION ADD_TO_COL_QUANTITY(a INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE b int;
    SET b = a + 10;
    return b;
END $$

SELECT * FROM sales_data;

SELECT quantity AS Original_Quantity,ADD_TO_COL_QUANTITY(quantity) FROM sales_data;

DELIMITER &&
CREATE FUNCTION FINAL_PROFIT(PROFIT INT, DISCOUNT INT)
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE final_profit INT;
    SET final_profit = profit - discount;
    RETURN final_profit;
END &&

SELECT profit,discount, FINAL_PROFIT(profit,discount) from sales_data;

DELIMITER &&
CREATE FUNCTION FINAL_PROFIT_REAL(PROFIT DECIMAL(20,6), DISCOUNT DECIMAL(20,6), SALES DECIMAL(20,6))
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE final_profit INT;
    SET final_profit = profit - sales *  discount;
    RETURN final_profit;
END &&

SELECT profit,discount,sales,FINAL_PROFIT_REAL(profit,discount,sales) from sales_data;


DELIMITER &&
CREATE FUNCTION int_to_str(a INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE b varchar(10);
    SET b = a;
    return b;
end &&

select int_to_str(50);

SELECT quantity,int_to_str(quantity) FROM sales_data;

SELECT sales from sales_data;

SELECT MAX(sales) , MIN(sales) FROM sales_data;

-- 1 - 100 - super affordable product
-- 100 - 300 - affordable
-- 300 - 600 - moderate price
-- 600 + -   - Expensive


DELIMITER &&
CREATE FUNCTION mark_sales(sales INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE flag_sales varchar(30);
    if sales <= 100 then
		set flag_sales = "Super Affordable Product";
	elseif sales > 100 and sales < 300 then
		set flag_sales = "Affordable Product";
	elseif sales > 300 and sales < 600 then
		set flag_sales = "Moderate Price";
	else
		set flag_sales = "Expensive";
	end if;
    RETURN flag_sales;
END &&

SELECT sales, mark_sales(sales) FROM sales_data;


CREATE TABLE loop_table(val int);

-- LOOPS --
DELIMITER &&
CREATE PROCEDURE insert_data()
BEGIN
set @var = 10;     -- global variable
generate_data : loop  -- generate_data is loop name
insert into loop_table values (@var);
set @var = @var + 1;
if @var = 100 then
	leave generate_data;
end if ;
end loop generate_data;
END &&

SELECT * FROM loop_table;

CALL insert_data;


-- divisible by 3
CREATE TABLE divisible_by_three(var INT);

DELIMITER &&
CREATE PROCEDURE divisible_by_three()
BEGIN
set @var = 1;
divisible_by_3 : loop 
set @var = @var + 1;
if @var % 3 = 0 then
	insert into divisible_by_three values (@var);
    set @var = @var + 1;
if @var = 100 then 
	leave divisible_by_3;
end if;
end if;
END LOOP divisible_by_3;
END &&

SELECT * FROM divisible_by_three;

CALL divisible_by_three;

    