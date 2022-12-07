SELECT * FROM bank_details;

DELIMITER &&
CREATE PROCEDURE select_records()
BEGIN
	SELECT * FROM BANK_DETAILS;
END &&

CALL select_records;

DELIMITER &&
CREATE PROCEDURE max_balance()
BEGIN
	SELECT * FROM BANK_DETAILS WHERE balance in (SELECT MAX(balance) FROM BANK_DETAILS);
END &&

CALL max_balance();

DELIMITER &&
CREATE PROCEDURE min_balance()
BEGIN
	SELECT * FROM BANK_DETAILS WHERE balance in (SELECT MIN(balance) FROM BANK_DETAILS);
END &&

CALL min_balance();

DELIMITER &&
CREATE PROCEDURE avg_of_balance()
BEGIN
	SELECT AVG(balance) FROM BANK_DETAILS;
END &&

CALL avg_of_balance();

DELIMITER &&
CREATE PROCEDURE avg_bal_jobrole(IN v1 varchar(30))
BEGIN 
	SELECT AVG(balance) FROM BANK_DETAILS WHERE job = v1;
END &&

CALL avg_bal_jobrole('admin.');

CALL avg_bal_jobrole('retired');

DELIMITER &&
CREATE PROCEDURE by_job_education(IN v1 varchar(20) , IN v2 varchar(20))
BEGIN 
	SELECT * FROM BANK_DETAILS WHERE job = v1 and education = v2 ;
END &&

CALL by_job_education('blue-collar','unknown');

CALL by_job_education('retired','tertiary');


CREATE VIEW bank_view AS SELECT age,job,marital,balance,education FROM BANK_DETAILS;

SELECT * FROM bank_view;

SELECT COUNT(*) FROM bank_view;

SELECT AVG(balance) FROM bank_view WHERE job = 'admin.';