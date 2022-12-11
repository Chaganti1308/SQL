CREATE DATABASE DRESS_DATASET;

SHOW DATABASES;

USE DRESS_DATASET;

-- used to know which database is using
SELECT DATABASE();

CREATE TABLE dress_data(
`Dress_ID` varchar(30),
`Style` varchar(30),
`Price` varchar(30),
`Rating` varchar(30),
`Size` varchar(30),
`Season` varchar(30),
`NeckLine` varchar(30),
`SleeveLength` varchar(30),
`waiseLine` varchar(30),
`Material` varchar(30),
`FabricType` varchar(30),
`Decoration` varchar(30),
`Pattern Type` varchar(30),
`Recommendation` varchar(30)
);

SELECT * FROM dress_data;

SHOW COLUMNS IN dress_data;

-- uploading bulk data at a time
LOAD DATA INFILE
'D:/FSDA/SQL_datasets/AttributeDataSet.csv'
INTO TABLE dress_data
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM dress_data;

SELECT count(*) FROM dress_data;

CREATE TABLE IF NOT EXISTS test(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(50),
test_address varchar(50),
PRIMARY KEY (test_id)
);

SELECT * FROM test;

-- will get a issue
INSERT INTO test VALUES
('sudh','sudh@gmail.com','banglore'),
('krish','krish@gmail.com','banglore'),
('hitesh','hitesh@ineuron.ai','banglore'),
('subham','subham@gmail.com','jaipur');


-- APPROACH1
INSERT INTO 
test (test_name,test_mailid,test_address)
VALUES
('sudhan','sudh@gmail.com','banglore'),
('krishnaik','krish@gmail.com','banglore'),
('hiteshchowdary','hitesh@ineuron.ai','banglore'),
('subhamgill','subham@gmail.com','jaipur');



-- APPROACH2
INSERT INTO 
test (test_id,test_name,test_mailid,test_address)
VALUES
(5,'sudh','sudh@gmail.com','banglore'),
(6,'krish','krish@gmail.com','banglore'),
(7,'hitesh','hitesh@ineuron.ai','banglore'),
(8,'subham','subham@gmail.com','jaipur');

SELECT * FROM test;


CREATE TABLE IF NOT EXISTS test1(
test_id int not null auto_increment,
test_name varchar(30),
test_mailid varchar(50),
test_address varchar(50),
PRIMARY KEY (test_id)
);

INSERT INTO 
test1 (test_name,test_mailid,test_address)
VALUES
('sudh','sudh@gmail.com','banglore'),
('krish','krish@gmail.com','banglore'),
('hitesh','hitesh@ineuron.ai','banglore'),
('subham','subham@gmail.com','jaipur');

-- CHECK CONSTRAINT
CREATE TABLE IF NOT EXISTS test2(
test_id int,
test_name varchar(30),
test_mailid varchar(50),
test_address varchar(50),
test_salary int check(test_salary > 10000)
);

SELECT * FROM test2;

INSERT INTO 
test2
VALUES
(1,'sudh','sudh@gmail.com','banglore',100000),
(2,'krish','krish@gmail.com','banglore',20000),
(3,'hitesh','hitesh@ineuron.ai','banglore',5000), -- check constraint violated
(4,'subham','subham@gmail.com','jaipur',12000);


INSERT INTO 
test2
VALUES
(1,'sudh','sudh@gmail.com','banglore',100000),
(2,'krish','krish@gmail.com','banglore',20000),
(3,'hitesh','hitesh@ineuron.ai','banglore',50000), 
(4,'subham','subham@gmail.com','jaipur',12000);

-- Successfully inserted into table

CREATE TABLE IF NOT EXISTS test3(
test_id int,
test_name varchar(30),
test_mailid varchar(50),
test_address varchar(50) check(test_address = 'banglore'),
test_salary int check(test_salary > 10000)
);

SELECT * FROM test3;

INSERT INTO 
test3
VALUES
(1,'sudh','sudh@gmail.com','banglore',100000),
(2,'krish','krish@gmail.com','banglore',20000),
(3,'hitesh','hitesh@ineuron.ai','banglore',50000), 
(4,'subham','subham@gmail.com','jaipur',12000); -- check constraint violated at address

INSERT INTO 
test3
VALUES
(1,'sudh','sudh@gmail.com','banglore',100000),
(2,'krish','krish@gmail.com','banglore',20000),
(3,'hitesh','hitesh@ineuron.ai','banglore',50000), 
(4,'subham','subham@gmail.com','banglore',12000); 

SELECT * FROM test3;

CREATE TABLE IF NOT EXISTS test4(
test_id int not null,
test_name varchar(30),
test_mailid varchar(50),
test_address varchar(50) check(test_address = 'banglore'),
test_salary int check(test_salary > 10000)
);

INSERT INTO 
test4
VALUES
(1,'sudh','sudh@gmail.com','banglore',100000),
(2,'krish','krish@gmail.com','banglore',20000),
(3,'hitesh','hitesh@ineuron.ai','banglore',50000), 
(4,'subham','subham@gmail.com','banglore',12000); 

CREATE TABLE IF NOT EXISTS test5(
test_id int not null default 0,
test_name varchar(30),
test_mailid varchar(50),
test_address varchar(50) check(test_address = 'banglore'),
test_salary int check(test_salary > 10000)
);

INSERT INTO test5(test_name,test_mailid,test_address,test_salary)
VALUES('sudh','sudh@gmail.com','banglore',100000);

SELECT * FROM test5; # default value 0

INSERT INTO test5(test_id,test_name,test_mailid,test_address,test_salary)
VALUES(1,'krish','krish@gmail.com','banglore',100000);


SELECT * FROM test5;


CREATE TABLE IF NOT EXISTS test6(
test_id int  default 0,
test_name varchar(30),
test_mailid varchar(50) unique,
test_address varchar(50),
test_salary int check(test_salary > 10000)
);

SELECT * FROM test6;

INSERT INTO 
test6
VALUES
(1,'rishi','rishi@gmail.com','hyd',20000),
(2,'neeha','neeha@gmail.com','HYDER',18000),
(3,'mohan','mohan@gmail.com','bang',15000),
(4,'rishika','rishi@gmail.com','BANG',10001); -- email should be unique



INSERT INTO 
test6(test_id,test_name,test_mailid,test_address,test_salary)
VALUES
(1,'rishi','rishi@gmail.com','hyd',20000),
(2,'neeha','neeha@gmail.com','HYDER',18000),
(3,'mohan','mohan@gmail.com','bang',15000),
(4,'rishika','rishika@gmail.com','BANG',10001);





create table if not exists test7( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
test_adress varchar(30) check (test_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id));

SELECT * FROM test7;

insert into test7 (test_id , test_name , test_mailid , test_adress,test_salary)
values (101 , 'sudhanshu','sudhanshu55@ineuron.ai','bengalore' , 50000);

insert into test7 (test_name , test_mailid , test_adress,test_salary)
values ('sudhanshu','sudhanshu5@ineuron.ai','bengalore' , 50000);

insert into test7 (test_id ,test_name , test_mailid , test_adress,test_salary)
values (501,'sudhanshu','sudhanshu555@ineuron.ai','bengalore' , 50000);

insert into test7 (test_name , test_mailid , test_adress,test_salary)
values ('sudhanshu','sudhanshu555@ineuron.ai','bengalore' , 50000);
