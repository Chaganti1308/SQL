CREATE DATABASE window_functions;

USE window_functions;

CREATE TABLE ineuron_students(
student_id int,
student_batch varchar(60),
student_name varchar(40),
student_stream varchar(30),
student_marks int,
student_mail_id varchar(50)
); 

SELECT * FROM ineuron_students;

SHOW COLUMNS IN ineuron_students;

INSERT INTO ineuron_students VALUES
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com'),
(101,'FSDA','SAURABH','CS',80,'SAURABH@GMAIL.COM'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');


SELECT * FROM ineuron_students;

-- Aggregate window functions
SELECT student_batch, SUM(student_marks) FROM ineuron_students GROUP BY student_batch;
SELECT student_batch, AVG(student_marks) FROM ineuron_students GROUP BY student_batch;
SELECT student_batch, MIN(student_marks) FROM ineuron_students GROUP BY student_batch;
SELECT student_batch, MAX(student_marks) FROM ineuron_students GROUP BY student_batch;

SELECT COUNT(student_batch) FROM ineuron_students;

-- distinct batches count
SELECT COUNT(DISTINCT student_batch) FROM ineuron_students;

-- batch wise count
SELECT student_batch, COUNT(*) FROM ineuron_students GROUP BY student_batch;


-- ANalytical based window functions
-- Row,Rank,Dense Rank
SELECT * FROM ineuron_students;

UPDATE  ineuron_students
SET student_batch = 'fsda' WHERE student_id = 101;


-- maximum student marks by each batch
SELECT student_name, student_batch,student_marks FROM ineuron_students WHERE student_marks IN 
(SELECT MAX(student_marks) FROM ineuron_students group by student_batch);

SELECT student_name FROM ineuron_students where student_marks in
(select max(student_marks) from ineuron_students where student_batch='fsda');


SELECT student_name,student_batch,student_marks FROM ineuron_students WHERE student_batch = 'fsda' ORDER BY student_marks DESC LIMIT 2;

SELECT student_name,student_batch,student_marks FROM ineuron_students WHERE student_batch = 'fsda' ORDER BY student_marks DESC;


-- FIRST ORDER BY DESCENDING
-- SKIP THE FIRST RECORD IN DESCENDING ORDER AND PRINTS THE NEXT ONE RECORD
SELECT student_name,student_batch,student_marks FROM ineuron_students WHERE student_batch = 'fsda' ORDER BY student_marks DESC LIMIT 1,1;

-- SKIPS THE FIRST AND PRINTS THE NEXT 2 RECORDS
SELECT student_name,student_batch,student_marks FROM ineuron_students WHERE student_batch = 'fsda' ORDER BY student_marks DESC LIMIT 1,2;



-- SKIPS THE FIRST AND SECOND AND PRINTS THE NEXT 3 RECORDS
SELECT student_name,student_batch,student_marks FROM ineuron_students 
WHERE student_batch = 'fsda' ORDER BY student_marks DESC LIMIT 2,3;

SELECT * FROM ineuron_students WHERE student_batch = 'fsda' 
ORDER BY student_marks DESC LIMIT 2,3;

-- ROW_NUMBER()
SELECT *,
ROW_NUMBER() OVER(ORDER BY student_marks) AS 'row_number' 
FROM ineuron_students;


-- SEPARATION BY STUDENT_BATCH
SELECT *,
ROW_NUMBER() OVER(PARTITION BY student_batch ORDER BY student_marks) AS 'row_number'  
FROM ineuron_students;

SELECT * FROM 
(SELECT student_id,student_batch,student_stream,student_marks,
ROW_NUMBER() OVER(PARTITION BY student_batch ORDER BY student_marks DESC) AS 'row_no'  
FROM ineuron_students) AS test WHERE row_no = 1;


SELECT * FROM 
(SELECT student_id,student_batch,student_stream,student_marks,
ROW_NUMBER() OVER(PARTITION BY student_batch ORDER BY student_marks DESC) AS 'row_number'  
FROM ineuron_students) AS test WHERE `row_number` = 1;


-- RANK()


SELECT *,
ROW_NUMBER() OVER (ORDER BY student_marks DESC) AS row_num,
RANK() OVER (ORDER BY student_marks DESC) AS row_rank 
FROM ineuron_students;


SELECT * FROM
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY student_batch ORDER BY student_marks DESC ) AS row_num,
RANK() OVER (PARTITION BY student_batch ORDER BY student_marks DESC ) AS row_rank
FROM ineuron_students) AS TEST WHERE row_rank = 1 ;


-- DENSE_RANK
SELECT * FROM
(SELECT *,
ROW_NUMBER() OVER (ORDER BY student_marks DESC ) AS row_num,
RANK() OVER (ORDER BY student_marks DESC ) AS row_rank,
DENSE_RANK() OVER (ORDER BY student_marks DESC ) AS dense_rank1
FROM ineuron_students) AS TEST WHERE dense_rank1 = 3 ;

SELECT * FROM
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY student_batch ORDER BY student_marks DESC ) AS row_num,
RANK() OVER (PARTITION BY student_batch ORDER BY student_marks DESC ) AS row_rank,
DENSE_RANK() OVER (PARTITION BY student_batch ORDER BY student_marks DESC ) AS dense_rank1
FROM ineuron_students) AS TEST WHERE dense_rank1 = 3 ;

