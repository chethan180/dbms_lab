drop database if exists university_profile;

create database university_profile;

use university_profile;

CREATE TABLE Student(name varchar(20),rollno integer UNIQUE,age integer,math integer,sci integer,eng integer,social integer,sports integer);

insert into Student(name,rollno,age,math,sci,eng,social,sports) values("dwayne",33,21,98,94,91,96,55);

insert into Student(name,rollno,age,math,sci,eng,social,sports) values("john",58,18,70,87,77,98,67);

insert into Student(name,rollno,age,math,sci,eng,social,sports) values("dave",27,22,54,68,98,96,77);

insert into Student(name,rollno,age,math,sci,eng,social,sports) values("randy",56,19,69,75,65,67,98);

insert into Student(name,rollno,age,math,sci,eng,social,sports) values("kane",11,22,86,95,52,57,73);

insert into Student(name,rollno,age,math,sci,eng,social,sports) values("tom",50,21,76,84,62,74,81);

create table Campus(name varchar(20),cid integer,loc varchar(20),cap integer,law boolean,engg boolean,buss boolean);

insert into Campus(name,cid,loc,cap,law,engg,buss) values("mec",101,"hyd",1000,1,1,1);

insert into Campus(name,cid,loc,cap,law,engg,buss) values("muc",104,"mad",2000,0,1,1);

insert into Campus(name,cid,loc,cap,law,engg,buss) values("mgt",107,"bom",1500,1,0,0);


	-- QUERIES --



alter table Student
add gender varchar(2);

alter table Student
add team varchar(2);

alter table Student
drop column age;

alter table Student 
add dob date;

alter table Student
add yjoin integer;


UPDATE Student
SET yjoin= 2019, gender='M', team='R',dob= '2000-01-09'
WHERE name= 'dwayne';

UPDATE Student
SET yjoin= 2019, gender='M', team='W',dob= '2002-03-21'
WHERE name= 'john';

UPDATE Student
SET yjoin= 2018, gender='M', team='A',dob= '1999-09-11'
WHERE name= 'dave';

UPDATE Student
SET yjoin= 2019, gender='M', team='R',dob= '2001-04-28'
WHERE name= 'randy';

UPDATE Student
SET yjoin= 2018, gender='M', team='G',dob= '1999-02-13'
WHERE name= 'kane';

UPDATE Student
SET yjoin= 2019, gender='M', team='W',dob= '2000-11-01'
WHERE name= 'tom';






INSERT INTO Student(name, rollno, dob,yjoin,gender,team,math,sci,eng,social,sports)
VALUES ('carol', 7, '2000-06-19',2018,'F','W',78,99,45,56,88);

insert INTO Student(name, rollno, dob,yjoin,gender,team,math,sci,eng,social,sports)
VALUES ('wanda', 21, '2001-08-10',2019,'F','R',42,73,59,63,65);

INSERT INTO Student(name, rollno, dob,yjoin,gender,team,math,sci,eng,social,sports)
VALUES ('natasha', 52, '2001-06-19',2019,'F','A',83,86,89,91,99);

INSERT INTO Student(name, rollno, dob,yjoin,gender,team,math,sci,eng,social,sports)
VALUES ('gamora', 34, '2001-06-19',2018,'F','G',84,93,79,94,85);

INSERT INTO Student(name, rollno, dob,yjoin,gender,team,math,sci,eng,social,sports)
VALUES ('jean', 46, '2000-06-19',2019,'F','G',98,97,84,87,72);

Alter Table Student modify dob date After rollno;

Alter Table Student modify yjoin integer After dob;

Alter Table Student modify gender varchar(10) After yjoin;

Alter Table Student modify team varchar(10) After gender;


ALTER TABLE Campus
ADD pincode integer;

UPDATE Campus
SET pincode=500043
WHERE name= 'mec';

UPDATE Campus
SET pincode=600012
WHERE name= 'muc';


UPDATE Campus
SET pincode=400076
WHERE name= 'mgt';

INSERT INTO Campus(name, cid, loc,pincode,cap,law,engg,buss)
VALUES ('mdc', 106, 'pun',411021,1700,0,1,1);

INSERT INTO Campus(name, cid, loc,pincode,cap,law,engg,buss)
VALUES ('mdd', 109, 'del',110001,1400,1,1,0);

INSERT INTO Campus(name, cid, loc,pincode,cap,law,engg,buss)
VALUES ('mvc', 110, 'vel',631001,1400,1,1,1);

INSERT INTO Campus(name, cid, loc,pincode,cap,law,engg,buss)
VALUES ('mbd', 113, 'bgl',560002,800,0,1,1);

Alter Table Campus modify pincode integer After loc;


-- 1

select name,rollno,year(curdate())-year(dob) as age from Student where year(curdate())-year(dob) >= 18
order by dob ;
-- 2
select gender,count(gender) from Student where year(curdate())-year(dob) >= 20 
group by gender ;

-- select @x :=  SUM((math+sci+eng+social+sports)/5)/11 from  Student;
-- 3
select count(math) from Student where math > (select SUM((math+sci+eng+social+sports)/5)/11 from  Student) ;

-- 4

SELECT sum(case when pincode like '5%' or pincode like '6%' then cap else 0 end)/sum(case when pincode like '3%' or pincode like '4%' then cap else 0 end) as ratio_of_south_to_west   
FROM Campus;
-- 5
select *,(math+sci+eng+social+sports)/5 from  Student
order by (math+sci+eng+social+sports)/5 desc limit 1,1;

-- 6

select name,rollno,(math+sci+eng+social+sports)/5 as avg_marks,(case when (math+sci+eng+social+sports)/5>(select SUM((math+sci+eng+social+sports)/5)/11 from  Student) then 'HIGH' else 'LOW' end)  AS score_status
 from Student;



select * from 
Student;

select * from Campus;
