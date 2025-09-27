-- Q1. Write a procedure that accepts a student’s ID and returns their name in uppercase using UPPER().

drop function getName;

Delimiter //
create function getName ( s_id int) returns varchar(30) deterministic
begin
declare p_name varchar(30);

select UPPER(student_name) into p_name from students where student_id = s_id;

return p_name;

end //

select getName(2) as Student_Name;
-- ---------------------------------------------------------------------------

-- Q2. Create a procedure that accepts an employee’s ID and returns the length of their name using LENGTH().

drop function getLength;

DELIMITER //
create function getLength (id int) returns int deterministic
begin
declare l_name int;

select length(emp_name) into l_name from employees where emp_id = id;

return l_name;

end//

select getLength(4) as Length_Emp_Name;
-- ----------------------------------------------------------------------------

-- Q3. Write a procedure that accepts a date and returns the day name using DAYNAME

drop function getDayName;

Delimiter //
create function getDayName(id int) returns VARCHAR(30) deterministic
begin
declare day_name  VARCHAR(30);

select DAYNAME(hire_date) into day_name from employees where emp_id = id;

return day_name;

end//

select getDayName(5) as Hired_DayName;
-- ----------------------------------------------------------------------------

-- Q4. Create a procedure that accepts a department ID and returns the average salary of employees in that department using AVG().

drop function getAvgSal;

Delimiter //
create function getAvgSal(id int) returns decimal(10,2) deterministic 
begin
declare p_sal decimal(10,2);

select avg(salary) into p_sal 
from employees 
where dept_id = id; 

return p_sal;

end //

select getAvgSal(1) as Average_Salary;
-- ----------------------------------------------------------------------------

-- Q5. Write a stored function to return the annual salary of an employee when the employee ID is given.

drop function getAnnualSal;

delimiter //
create function getAnnualSal( id int) returns int deterministic
begin
declare a_sal int;

select sum(salary) into a_sal 
from employees where emp_id = id;

return a_sal;

end // 

select getAnnualSal(3) as Annual_Salary
-- ----------------------------------------------------------------------------

-- Q6. Write a stored function to find the experience of an employee (in years) from the hire date, when the employee ID is given.

drop function getExp;

Delimiter //
create function getExp(id int) returns int deterministic
begin
declare exp int;

select timestampdiff(year, hire_date, curdate()) into exp 
from employees 
where emp_id = id;

return exp;

end//

select getExp(3) as Experience_years;
-- ----------------------------------------------------------------------------

-- Q7. Write a stored function to return the department name when the employee ID is given.

drop function getDeptName;

Delimiter //
create function getDeptName(id int) returns varchar(30) deterministic
begin
declare d_name varchar(30);

select dept_name into d_name
from departments d 
join employees e on e.dept_id = d.dept_id
where e.emp_id = id;  

return d_name;

end//

select getDeptName(4) as Dept_name;
-- ----------------------------------------------------------------------------

-- Q8. Write a stored function to return the number of employees in a particular department, when the department ID is given.

drop function countDeptEmp;

Delimiter //
create function countDeptEmp(id int) returns int deterministic
begin
declare e_count int;

select count(emp_id) into e_count 
from employees 
where dept_id = id;

return e_count;

end// 

select countDeptEmp(2) as Emp_Count
-- ----------------------------------------------------------------------------

-- Q9. Write a stored function to return the bonus amount for an employee based on their salary (e.g., 10% of salary if salary < 50,000, otherwise 5%).

drop function getBonusAmount;

Delimiter //
create function getBonusAmount(id int) returns decimal(10.2) deterministic
begin
declare sal int;
declare bns decimal(10.2);

select salary into sal
from employees 
where emp_id = id;

if sal < 5000 then
	set bns = sal * 0.1;
else 
	set bns = sal * 0.05;
end if;

return bns;

end//

 select getBonusAmount(2) as Bonus;
 
 






