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



-- Problem Statements using SELECT INTO with OUT Parameter
-- 1.	Write a procedure that retrieves the name of the topper student (highest marks) into an OUT parameter using SELECT INTO and display the retrieved name.
-- 2.	Write a procedure that retrieves the lowest marks scored by any student into an OUT parameter using SELECT INTO and display the retrieved marks.
-- 3.	Write a procedure that retrieves the total number of students into an OUT parameter using SELECT INTO and display the retrieved count.
-- 4.	Write a procedure that retrieves the overall average marks of all students into an OUT parameter using SELECT INTO and display the retrieved average marks.
-- 5.	Write a procedure that accepts a student ID as input and retrieves the course name of that student into an OUT parameter using SELECT INTO and display the retrieved course name


-- sol 1
delimiter //
create procedure q1_2(out s_name varchar(30))
begin
select name into s_name 
from students where marks >= all(select marks from students);
select concat("Topper student of class is: ",s_name) as Highest_Scorer;
end//

call q1_2(@topper);

select @topper as Topper_Name;
-- -------------------------------------------------------------------------

-- sol 2
delimiter //
create procedure q2_2(out s_name varchar(30))
begin
select name into s_name 
from students where marks <= all(select marks from students);
select concat("Lowest marks in class are scored by : ",s_name) as Lowest_Scorer;
end//

call q2_2(@lowestScore);

select @lowestScore as Lowest_Scorer_Name;
-- ---------------------------------------------------------------------------

-- sol 3
delimiter //
create procedure q3_2(out s_no int)
begin
select count(*) into s_no
from students; 
select concat("Total count of Students is", s_no) as Total_Count;
end//

call q3_2(@Student_Count);

select @Student_Count as Total_Student_Count;
-- ------------------------------------------------------

-- sol 4
delimiter //
create procedure q4_2(out avg_marks int)
begin
select avg(marks) into avg_marks
from students;
select concat("Average marks of total Students are: ", avg_marks) as Average_Marks;
end//

call q4_2(@Std_Avrg_Marks);

select @Std_Avrg_Marks as Student_Average_Marks;
-- ---------------------------------------------------------

-- sol 5
delimiter //
create procedure q5_2(in s_id varchar(30), out c_name varchar(30))
begin
select course into c_name 
from students where name = s_id;
select concat("The Course name of ", s_id, " is: ", c_name) as c_det;
end//

call q5_2("Grace",@course_det);

select @course_det as Student_course_details;

