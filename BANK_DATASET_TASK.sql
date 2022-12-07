-- with this data try to find out sum of balance 
-- Try to find out avarage of balance 
-- try to find out who is having a min balance 
-- try to find out who is having a mazxmim balance 
-- try to prepare a list of all the person who is having loan 
-- try to find out average balance for all the people whose job role is admin 
-- try to find out a record  without job whose age is below 45 
-- try to find out a record where education is primarty and person is jobless
-- try to find of a record whose bank account is having a negative balance 
-- try to find our a record who is not having house at all along with there balance 

USE BANK_DATABASE;

SELECT * FROM BANK_DETAILS;

-- with this data try to find out sum of balance 
SELECT SUM(balance) FROM BANK_DETAILS;
SELECT * FROM BANK_DETAILS WHERE balance in (SELECT SUM(balance) FROM BANK_DETAILS);
SELECT * FROM BANK_DETAILS WHERE balance = (SELECT SUM(balance) FROM BANK_DETAILS);

-- Try to find out avarage of balance
SELECT AVG(balance) FROM BANK_DETAILS;
SELECT * FROM BANK_DETAILS WHERE balance in (SELECT AVG(balance) FROM BANK_DETAILS);
SELECT * FROM BANK_DETAILS WHERE balance = (SELECT AVG(balance) FROM BANK_DETAILS);


-- try to find out who is having a min balance 
SELECT MIN(balance) FROM BANK_DETAILS;
SELECT * FROM BANK_DETAILS WHERE balance in (SELECT MIN(balance) FROM BANK_DETAILS);
SELECT * FROM BANK_DETAILS WHERE balance = (SELECT MIN(balance) FROM BANK_DETAILS);

-- try to find out who is having a mazxmim balance
SELECT MAX(balance) FROM BANK_DETAILS;
SELECT * FROM BANK_DETAILS WHERE balance in (SELECT MAX(balance) FROM BANK_DETAILS);
SELECT * FROM BANK_DETAILS WHERE balance = (SELECT MAX(balance) FROM BANK_DETAILS);

-- try to prepare a list of all the person who is having loan
SELECT * FROM BANK_DETAILS WHERE loan = 'yes';
SELECT count(*) FROM BANK_DETAILS WHERE loan = 'yes';

-- try to find out average balance for all the people whose job role is admin 
SELECT AVG(BALANCE) FROM BANK_DETAILS WHERE job = 'admin.';

-- try to find out a record  without job whose age is below 45 
SELECT * FROM BANK_DETAILS WHERE job = 'unknown' AND age <= 45;

-- try to find out a record where education is primary and person is jobless
SELECT * FROM BANK_DETAILS WHERE job = 'unknown' and education = 'primary';

-- try to find of a record whose bank account is having a negative balance 
SELECT * FROM BANK_DETAILS WHERE balance < 0;
SELECT count(*) FROM BANK_DETAILS WHERE balance < 0;

-- try to find out a record who is not having house at all along with there balance
SELECT * FROM BANK_DETAILS WHERE housing = 'no' and balance < 0;