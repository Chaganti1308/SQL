-- will get the current time stamp
SELECT NOW();  -- 2022-12-09 17:39:17

-- will get the current date
SELECT CURRENT_DATE();  -- 2022-12-09 
SELECT CURDATE(); -- 2022-12-09

-- will get the current time
SELECT CURRENT_TIME();  -- 17:38:07
SELECT CURTIME(); -- 21:58:28

-- get the current timestamp
SELECT CURRENT_TIMESTAMP(); -- 2022-12-09 17:39:46

-- current users details
SELECT CURRENT_USER();  -- root@localhost

-- using date() function
SELECT DATE(ship_date_new) as date from sales_data;

-- extract
-- extracting the day
SELECT NOW(); -- 2022-12-09 22:21:32
SELECT EXTRACT(DAY FROM NOW()); -- 9
SELECT EXTRACT(MONTH FROM NOW()); -- 12
SELECT EXTRACT(YEAR FROM NOW()); -- 2022


-- DATE_ADD(DATE,INTERVAL EXPRESSION TYPE)
SELECT DATE_ADD(NOW(),INTERVAL 1 YEAR) AS FORWARD_YEAR; -- 2023-12-09 22:09:58

SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) AS FORWARD_MONTH; -- 2023-01-09 22:10:58

SELECT DATE_ADD(NOW(), INTERVAL 1 WEEK) AS FORWARD_WEEK; -- 2022-12-16 22:11:56

SELECT DATE_ADD(NOW(), INTERVAL  4 HOUR) AS FORWARD_HOURS; -- 2022-12-10 02:12:52


-- DATE SUB(DATE,INTERVAL EXPRESSION TYPE)
SELECT DATE_SUB(NOW(),INTERVAL 1 YEAR) AS BACKWARD_YEAR; -- 2021-12-09 22:15:11

SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH) AS BACKWARD_MONTH; -- 2022-11-09 22:15:34

SELECT DATE_SUB(NOW(), INTERVAL 1 WEEK) AS BACKWARD_WEEK; -- 2022-12-02 22:15:49

SELECT DATE_SUB(NOW(), INTERVAL  4 HOUR) AS BACKWARD_HOURS; -- 2022-12-09 18:16:09


-- DATEDIFF()
SELECT DATEDIFF('2022-08-13','1997-08-13') AS NO_OF_DAYS_FROM_BORN_DATE;

-- TIMEDIFF()
SELECT TIMEDIFF("09:16:10", "09:16:04") AS TIME_DIFFERENCE; -- 00:00:06



-- DATE_FORMAT()
SELECT DATE_FORMAT(NOW(),'%d %b %y');  -- 09 Dec 22
SELECT DATE_FORMAT(NOW(),'%d %m %y'); -- 09 12 22
SELECT DATE_FORMAT(NOW(),'%d--%m--%y'); -- 09--12--22
SELECT DATE_FORMAT(NOW(),'%d-%m-%Y'); -- 09-12-2022
SELECT DATE_FORMAT(NOW(),'%D-%M-%Y'); -- 9th-December-2022
SELECT DATE_FORMAT(NOW(),'%d-%m-%y--%a'); -- 09-12-22--Fri
SELECT DATE_FORMAT(NOW(),'%d-%c-%y'); -- 09-12-22
SELECT DATE_FORMAT(NOW(),'%W'); -- Friday(day Name)
SELECT DATE_FORMAT(NOW(),'%w'); -- 5(day number sunday to saturday(0 to 6 ))
SELECT DATE_FORMAT(NOW(),'%T'); -- 22:42:32
SELECT DATE_FORMAT(NOW(),'%r'); -- 10:43:24 PM

-- YEAR()
SELECT YEAR("2018-07-18"); -- 2018

-- MONTH()
SELECT MONTH("2018-07-18"); -- 7

SELECT DAY("2018-07-18"); -- 18

SELECT DAYOFWEEK("2018-07-18"); -- 4(4TH DAY IN WEEK)

SELECT DAYNAME(NOW()); -- Friday

SELECT MONTHNAME(NOW()); -- December

SELECT QUARTER('2022-11-12'); -- 4

SELECT LAST_DAY('2018-07-16'); -- 2018-07-31(RETURNS LAST DAY OF MONTH)


-- %a-Abbreviated weekday name (Sun-Sat)
-- %b-Abbreviated month name (Jan-Dec)
-- %c-Month, numeric (0-12)
-- %D-Day of month with English suffix (0th, 1st, 2nd, 3rd)
-- %d-Day of month, numeric (00-31)
-- %e-Day of month, numeric (0-31)
-- %f-Microseconds (000000-999999)
-- %H-Hour (00-23)
-- %h-Hour (01-12)
-- %I-Hour (01-12)
-- %i-Minutes, numeric (00-59)
-- %j-Day of year (001-366)
-- %k-Hour (0-23)
-- %l-Hour (1-12)
-- %M-Month name (January-December)
-- %m-Month, numeric (00-12)
-- %p-AM or PM
-- %r-Time, 12-hour (hh:mm:ss followed by AM or PM)
-- %S-Seconds (00-59)
-- %s-Seconds (00-59)
-- %T-Time, 24-hour (hh:mm:ss)
-- %U-Week (00-53) where Sunday is the first day of week
-- %u-Week (00-53) where Monday is the first day of week
-- %V-Week (01-53) where Sunday is the first day of week, used with %X
-- %v-Week (01-53) where Monday is the first day of week, used with %x
-- %W-Weekday name (Sunday-Saturday)
-- %w-Day of the week (0=Sunday, 6=Saturday)
-- %X-Year for the week where Sunday is the first day of week, four digits, used with %V
-- %x-Year for the week where Monday is the first day of week, four digits, used with %v
-- %Y-Year, numeric, four digits
-- %y-Year, numeric, two digits