CREATE DATABASE KEY_PRIMARY_FOREIGN; 

USE KEY_PRIMARY_FOREIGN;

CREATE TABLE iNEURON(
course_id int not null,
course_name varchar(60),
course_status varchar(40),
number_of_enrollment int,
PRIMARY KEY (course_id)
);

SELECT * FROM iNEURON;

SHOW COLUMNS IN iNEURON;

INSERT INTO iNEURON VALUES(01,"FSDA","ACTIVE",100);
INSERT INTO iNEURON VALUES(02,"FSDS","NOT ACTIVE",90);
INSERT INTO iNEURON VALUES(03,"BLOCK CHAIN","ACTIVE",80);
INSERT INTO iNEURON VALUES(04,"CYBER SECURITY","ACTIVE",120);


CREATE TABLE students_ineuron(
student_id int,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
FOREIGN KEY (course_id1) references iNEURON(course_id)
);

SELECT * FROM students_ineuron;

INSERT INTO students_ineuron VALUES (101,"FSDA","test@gmail.com","active",01);
INSERT INTO students_ineuron VALUES (101,"FSDA","test@gmail.com","active",01);
INSERT INTO students_ineuron VALUES (101,"FSDA","test@gmail.com","active",01);
INSERT INTO students_ineuron VALUES (101,"FSDA","test@gmail.com","active",01);


CREATE TABLE payment(
course_name varchar(60),
course_id int,
course_live_status varchar(50),
course_launch_date varchar(60),
foreign key (course_id) references iNEURON(course_id)
);

SELECT * FROM payment;

INSERT INTO payment values('FSDA',01,'ACTIVE','18TH JUNE');
INSERT INTO payment values('FSDA',01,'ACTIVE','18TH JUNE');
INSERT INTO payment values('FSDA',01,'ACTIVE','18TH JUNE');

CREATE TABLE class(
course_id int,
class_name varchar(60),
class_topic varchar(60),
class_duration int,
primary key(course_id),
foreign key(course_id) references iNEURON(course_id)
);

SELECT * FROM class;

alter table iNEURON drop primary key;
alter table iNEURON add constraint test_prim primary key(course_id,course_name);

drop table class;

create table test(
id int not null,
`name` varchar(60),
email_id varchar(60),
mobile_no varchar(10),
address varchar(50)
);

select * from test;

alter table test add primary key(id);

alter table test drop primary key;

show columns in test;

alter table test add constraint test_prim primary key(id , email_id);

SELECT * FROM test;


create table parent(
id int not null,
primary key(id));

select * from parent;

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id));

insert into parent values(1);

insert into parent values(2);

insert into parent values(3);
select * from parent;

insert into child values(101,1);
select * from child ;
insert into child values(101,2);

drop table child;

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on delete cascade);

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child;

select * from parent;


select * from parent;

delete from parent where id = 1;

update parent set id = 3 where id = 2;

drop table child;

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on update cascade);

insert into parent values(1);
delete from parent where id = 3;
insert into child values(1,1),(1,2),(3,2),(2,2);

update parent set id = 3 where id = 2;

select * from parent;
select * from child;