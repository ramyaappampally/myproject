create table department(
department_id varchar(10) primary key,
department_name char(50) not null unique
);

select * from [dbo].[department]

create table students_details(
id varchar(10) primary key,
name char(10) Unique,
email varchar(50),
age tinyint,
district varchar(20),
marks int,
city char(20),
fee decimal(10,3) default 00.0,
department_id varchar(10),
birth_date date,
log_intime time,
created_it datetime,
is_active bit,
notes text,
Foreign key (department_id)
REFERENCES department(department_id)
);


select * from [dbo].[students_details]

CREATE TABLE dml_students (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 age INT,
 city VARCHAR(50)
 );
select * from dml_students

CREATE TABLE ddl_students (
 id INT PRIMARY KEY,
 item_name varchar(50)
 );
select * from ddl_students

insert into ddl_students
(id,item_name)
values
('1','moniter'),
('2','keyboard'),
('3','notebook');

insert into [dbo].[department]
(department_id,department_name)
values
('10','web developer'),
('20','data analyst'),
('30','software testing');

insert into dml_students
(id,name,age,city)
values
('1','meera','20','Rajahmundry'),
('2','ajay','21',''),
('3','nisha',' ','Elluru'),
('4','varun','25',''),
('5','deepa ','24','Amalapuram'),
('6','harish','23','Rajahmundry'),
('7','sneha','24','kakinada'),
('8','vikram','27','Tirupathi');

CREATE TABLE academic_details (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT,
    district VARCHAR(100),
    marks INT,
    city VARCHAR(100)
);

INSERT INTO academic_details
(id, name, email, age, district, marks, city)
VALUES
(1, 'Meera', 'meera@example.com', 23, 'East Godavari', 82, 'Rajahmundry'),
(2, 'Ajay', NULL, 21, 'West Godavari', 91, 'Eluru'),
(3, 'Nisha', 'nisha@example.com', 22, 'East Godavari', 76, 'Amalapuram'),
(4, 'Varun', 'varun@example.com', 24, 'West Godavari', 84, NULL),
(5, 'Deepa', 'deepa@example.com', 21, 'West Godavari', 96, 'Eluru'),
(6, 'Harish', 'harish@example.com', 25, 'East Godavari', 88, 'Rajahmundry'),
(7, 'Sneha', 'sneha@example.com', 20, 'Tirupati', 72, 'Tirupati'),
(8, 'Vikram', 'vikram@example.com', NULL, 'Kakinada', 67, 'Kakinada');

CREATE TABLE course_details(
    id INT PRIMARY KEY,
    fee DECIMAL(10,2),
    department_id INT,
    birth_date DATE,
    login_time TIME,
    created_at DATETIME,
    is_active bit,
    notes VARCHAR(255)
);


INSERT INTO course_details
(id, fee, department_id, birth_date, login_time,
 created_at, is_active, notes)
VALUES
(1, 14500.00, 10, '2003-02-14', '09:15:00', '2026-10-11 09:15:00',1, 'Learning web development'),

(2, 12500.00, 20, '2005-04-08', '09:45:00', '2026-10-12 09:45:00', 1, 'Learning data analytics'),

(3, 11000.00, 30, NULL, '10:00:00', '2026-10-13 10:00:00', 1, 'Learning software testing'),

(4, 13500.00, 10, '2002-01-27', '10:15:00', '2026-10-14 10:15:00', 1, 'Learning web development'),

(5, 14000.00, 20, '2005-09-03', '10:30:00', '2026-10-15 10:30:00', 1, 'Learning data analytics'),

(6, 15500.00, 10, '2001-12-05', NULL, '2026-10-16 11:00:00', 1, 'Learning web development'),

(7, 9500.00, 30, '2006-03-22', '11:15:00', '2026-10-17 11:15:00', 1, NULL),

(8, 10500.00, 20, '2003-08-16', '11:30:00', '2026-10-18 11:30:00', 1, 'Learning data analytics');

select * from course_details

select * from academic_details


CREATE TABLE course_demo(
     course_id INT PRIMARY KEY,
    course_name varchar(50),
    duration varchar(15)
);

select * from course_demo

alter table course_demo
add course_fee decimal(10,3);

sp_rename 'course_demo','course_details1';
select * from course_details1
truncate table ddl_students
select * from ddl_students
drop table course_details1

insert into dml_students
(id,name,age,city)
values
('9','Anjali','22','Bhimavaram'),
('10','surya','24','pitapuram');

select * from dml_students
 update dml_students
 set age=23 where id=3;

 update dml_students
 set city='Bhimavaram' where id=4;

 delete from dml_students
 where id=8;

select * from dml_students

select * from academic_details
select * from course_details
select * from ddl_students

-- Display only the name, age, and city of all students.
select name,age,city from dml_students

--display only column names in the table 

SELECT name
FROM sys.columns
WHERE object_id = OBJECT_ID('dbo.students_details');
--Display students whose age is greater than 22.
select age from dml_students
where age>22

--Display student names and marks, arranged from highest marks to lowest marks

select name,marks from academic_details
order by  marks DESC;
--. Display the first three records from the students table. Also display the students whose email address has not been provided.
SELECT TOP 3 *
FROM [dbo].[academic_details]
WHERE email IS NULL;

-- . Create a table named employee_demo with employee_id as INT, employee_name as VARCHAR(50), age as

CREATE TABLE emp_demo (
 emp_id INT PRIMARY KEY,
 emp_name VARCHAR(50),
 age tinyINT,
 joining_date date
 );
 select * from emp_demo

--Create a table named product_demo with product_id as BIGINT, price as DECIMAL(8,2), temperature as
 
CREATE TABLE Product_demo
(
 Product_id bigint,
 Price decimal(8,2),
 temperture float,
 distance float 
 );

 --3. Create a table named class_demo with country_code as CHAR(2), start_time as TIME, and created_at as

 CREATE TABLE class_demo
(
 country_code char(2),
start_time TIME,
 created_at datetime,
);
---Create a table named feedback_demo with feedback_id as INT and feedback as TEXT.

 CREATE TABLE feedback_demo
(
 feedback_id int,
 feedback text,
);

--Create a table named datatype_practice with id as INT, name as VARCHAR(50), fee as DECIMAL(8,2), and is_active as BOOLEAN.

 CREATE TABLE datatype_practice
(
 id int,
 name varchar(20),
 fee decimal(8,2),
 is_active bit
);
---Create a table named constraint_departments with department_id as the unique row identifier and department_name as a required, non-duplicate value.

create table constraint_department(
department_id varchar(10) primary key,
department_name char(30) not null unique
);

drop table constraint_department;
---Create a table named student_profile with student_id as the unique row identifier, name as a required value,and email as a non-duplicate value.

 CREATE TABLE student_profile
(
 student_id bigint primary key,
 name varchar(20),
email varchar(50) unique
);

--Create a table named age_check_demo with id and age columns. Make sure age cannot be below 18

CREATE TABLE age_check_demo
(
 id bigint primary key,
 age INT CHECK (age >= 18)
);

--4. Create a table named course_fees with course_id as the unique row identifier and fee with an initial value of0.00 when no fee is supplied.
 
 CREATE TABLE course_fees
(
 course_id bigint primary key,
 fee decimal(10,3) default 0.0
);

--Create a table named student_departments with student_id as the unique row identifier and department_id connected to constraint_departments.

 CREATE TABLE student_departments
(
 student_id int primary key,
 department_id varchar(10),
  FOREIGN KEY (department_id)
  REFERENCES constraint_department(department_id));
 
-- Display the positive value of -25 and the sign of -15
select ABS(-25)
select ABS(-15)
-- Display 4.2 rounded up to the next whole number and 4.9 rounded down to the previous whole number.

SELECT
    CEILING(4.2) AS Rounded_Up,
    FLOOR(4.9) AS Rounded_Down;

-- Display 12.567 rounded to 2 decimal places. Also display the value after removing decimal digits beyond 2 places without rounding.

select  ROUND(12.567, 2) AS Rounded_Value,
    ROUND(12.567, 2, 1) AS Truncated_Value;
--Find the remainder when 10 is divided by 3, and calculate the result when 2 is raised to the power of 3

SELECT
    10 % 3 AS Remainder,
    POWER(2, 3) AS Power_Result;

--Find the square root of 81, the largest value among 10, 25, and 7, and the smallest value among the same numbers.
 select 
  SQRT(81) as square_root,
  GREATEST(1,25,7) as greatest_value,
  LEAST (1,25,7) as least_value;

  select * from [dbo].[academic_details]
--. Write separate queries to display students from East Godavari district, students who scored more than 80 marks, and students who scored less than 80 marks.

select * from [dbo].[academic_details]
where district='East Godavari';

SELECT *
FROM [dbo].[academic_details]
WHERE marks > 80;

SELECT *
FROM [dbo].[academic_details]
WHERE marks < 80;
--Write separate queries to display students who scored at least 80 marks, students who scored at most 75 marks, and students who are not from East Godavari district.

SELECT *
FROM [dbo].[academic_details]
WHERE marks >= 80;

SELECT *
FROM [dbo].[academic_details]
WHERE marks <=75;

select * from [dbo].[academic_details]
where district<>'East Godavari';

---. Write queries to display students who scored from 75 to 90 marks, including both limits, and students who belong to either East Godavari or West Godavari district.
SELECT *
FROM [dbo].[academic_details]
WHERE marks between 75 and 90;

select * from [dbo].[academic_details]
where district IN ('East Godavari', 'West Godavari');

--Write queries to display students whose names begin with the letter 'M' and students whose names contain exactly four characters.
select * from [dbo].[academic_details]
where name like 'm%'

select * from [dbo].[academic_details]
where name like '____';

/* Write two queries: display students who are from West Godavari district and scored at least 80 marks; 
display students who are from either East Godavari or West Godavari district.*/

select * from [dbo].[academic_details]
where district='west Godavari';

SELECT *
FROM [dbo].[academic_details]
WHERE district = 'West Godavari'
AND marks >= 80;

select * from [dbo].[academic_details]
where district = 'East Godavari' OR district='West Godavari';

--. Display each district from the students table only once.
 select distinct district from [dbo].[academic_details]
--. Display each city from the students table only once.
 select distinct city from [dbo].[academic_details]
--Display each age from the students table only once.
 select distinct age from [dbo].[academic_details]
--.Display each district-and-marks combination only once
select distinct district,marks from [dbo].[academic_details]
-- Display each city-and-age combination only once.
select distinct city,age from [dbo].[academic_details]

-- Display students in ascending order of marks.
SELECT * FROM [dbo].[academic_details]
ORDER BY marks ASC;

-- Display students in descending order of marks.
SELECT * FROM [dbo].[academic_details]
ORDER BY marks DESC;
--. Display students in alphabetical order of their names
SELECT * FROM [dbo].[academic_details]
ORDER BY name ASC;
--Display students in ascending order of age
SELECT * FROM [dbo].[academic_details]
ORDER BY age ASC;
-- Display students in alphabetical order of district names.
SELECT * FROM [dbo].[academic_details]
ORDER BY district ASC;

--Count the number of students in each district.
SELECT district,COUNT(*) AS Total_Students
FROM [dbo].[academic_details] 
group by district;
--Find the average marks in each district.
SELECT district,avg(marks) AS Total_avg
FROM [dbo].[academic_details] 
group by district;
--Find the total marks in each district.
SELECT district,sum(marks) AS Total_sum
FROM [dbo].[academic_details] 
group by district;
--Find the minimum marks in each district
SELECT district,min(marks) AS Total_min
FROM [dbo].[academic_details] 
group by district;
--. Find the maximum marks in each district
SELECT district,max(marks) AS Total_max
FROM [dbo].[academic_details] 
group by district;
-- Display districts having more than one student.
SELECT district,COUNT(*) AS Total_Students
FROM [dbo].[academic_details]
GROUP BY district
HAVING COUNT(*) > 1;
-- Display districts having an average mark greater than 80.
SELECT district,COUNT(*) AS Total_avg
FROM [dbo].[academic_details]
GROUP BY district
HAVING avg(marks)>80;
--. Display districts where the total marks are greater than 200.
SELECT district,COUNT(*) AS Total_sum
FROM [dbo].[academic_details]
GROUP BY district
HAVING sum(marks)>200;
--Display districts where the minimum marks are 70 or above
SELECT district,min(marks) AS Total_min
FROM [dbo].[academic_details]
GROUP BY district
HAVING min(marks)>=70;
-- Display districts where the maximum marks are greater than 90.
SELECT district,max(marks) AS Maximum_Marks 
FROM [dbo].[academic_details]
GROUP BY district
HAVING max(marks)>90;
/*Consider only students who scored 70 marks or above. Arrange the remaining students by district and
display only districts that have more than one student.*/

SELECT district,COUNT(*) AS Total_Students
FROM [dbo].[academic_details]
WHERE marks >= 70
GROUP BY district
HAVING COUNT(*) > 1
ORDER BY district ASC;
/*. Consider only students aged 22 or above. Arrange the remaining students by district and display only
districts that have more than one student.*/
SELECT district,COUNT(*) AS Total_Students
FROM [dbo].[academic_details]
where age>=22
GROUP BY district
having count(*)>1;
/* Consider only students who scored more than 80 marks. Arrange the remaining students by district and
display only districts whose average marks are above 80.*/
SELECT district,COUNT(*) AS Total_Students
FROM [dbo].[academic_details]
where marks>80
GROUP BY district
having avg(marks)>80;
/*Consider only students from West Godavari district. Arrange them by district and display the result only
when the district has at least two students.*/
SELECT district,COUNT(*) AS Total_Students
FROM [dbo].[academic_details]
where district='west godavari'
group by district
having count(*)>2;
/*. Consider only students who scored 75 marks or above. Arrange the remaining students by district and
display only districts whose average marks are above 80.*/
SELECT district,AVG(marks) AS Average_Marks
FROM [dbo].[academic_details]
where marks>=75
group by district
having avg(marks)>80;