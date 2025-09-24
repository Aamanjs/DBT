CREATE DATABASE school;

use school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);

INSERT INTO students (name, age, course, marks) VALUES
('Alice', 20, 'Computer Science', 92),
('Bob', 21, 'Electronics', 78),
('Charlie', 22, 'Mechanical', 65),
('David', 20, 'Electrical', 50),
('Eva', 23, 'Civil', 88),
('Frank', 21, 'Computer Science', 73),
('Grace', 22, 'Electronics', 81),
('Helen', 20, 'Mechanical', 55),
('Ian', 21, 'Civil', 60),
('Jane', 22, 'Computer Science', 95);


-- Problem Statements using SELECT INTO with IN Parameter
-- 1.	Write a procedure that accepts a student name as input and retrieves the marks of that student using SELECT INTO and display the retrieved marks.
-- 2.	Write a procedure that accepts a course ID as input and retrieves the course name using SELECT INTO and display the retrieved course name.
-- 3.	Write a procedure that accepts a student name as input and retrieves the student ID using SELECT INTO and display the retrieved student ID.
-- 4.	Write a procedure that accepts a student ID as input and retrieves the average marks of that student using SELECT INTO and display the retrieved average marks.
-- 5.	Write a procedure that accepts a student name as input and retrieves the course of that student using SELECT INTO and display the retrieved course.


-- Sol 1
delimiter //
create procedure q1(in st_name varchar(20))
begin
declare pmarks int default 0;
select marks into pmarks
from students where name = st_name;
select concat ('Marks for ', st_name, ' are: ', pmarks) as Result;
end//

call q1("Helen");
-- ------------------------------------------------------

-- sol 2
delimiter //
create procedure q2(in c_id varchar(20))
begin
declare pname varchar(20) default "";
select name into pname 
from students where course = c_id
limit 1;
select concat(" Course of ", pname, " is: ",c_id) as Result ;
end//

call q2("Civil");
-- ----------------------------------------------------------

-- sol 3
delimiter //
create procedure q3(in s_name varchar(20))
begin
declare pid int default 0;
select id into pid 
from students where name = s_name;
select concat("Student ID of ", s_name," is: ", pid) as result;
end//

call q3("Bob");
-- --------------------------------------------------------

-- sol 4
delimiter //
create procedure q4(in s_id int)
begin
declare pavg_mrks int default 0;
select avg(marks) into pavg_mrks
from students where id = s_id
group by name;
select concat("Average marks of Student Id ", s_id," are: ",pavg_mrks) as Result; 
end//

call q4("6");
-- --------------------------------------------------------------------

-- sol 5
delimiter //
create procedure q5(in s_name varchar(30))
begin
declare pcourse varchar(30) default " ";
select course into pcourse 
from students where name = s_name;
select concat("The course name of ", s_name," is: ", pcourse) as Course_details;
end//

call q5("Alice");
