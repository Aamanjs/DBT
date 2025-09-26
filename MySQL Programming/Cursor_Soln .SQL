-- Q1. Create a stored procedure to fetch and print all employee names from the employees table using a cursor.

delimiter //
 create procedure q1()
 begin
 declare e_name varchar(30);
 declare done int default 0 ;
 declare c1 cursor for select emp_name from employees;
 
 declare continue handler for not found set done = 1;
 
 open c1;
 
 read_loop:loop
 fetch c1 into e_name; 
 if done = 1 then
 leave read_loop;
 end if;
 
 select e_name as Employee;
 end loop;

close c1;
end //

call q1();
-- ------------------------------------------------------------------------------------------

-- Q2. Write a procedure that calculates the total salary of all employees using a cursor.

delimiter //
CREATE PROCEDURE q2()
BEGIN
DECLARE e_totalSal INT DEFAULT 0; 
DECLARE done int default 0;
DECLARE c2 CURSOR FOR SELECT sum(salary) as totalSalary FROM EMPLOYEES;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN c2;

read_loop: LOOP

FETCH c2 INTO e_totalSal;

IF done = 1 then
LEAVE read_loop;
END IF;

SELECT e_totalSal as Total_Salary;

END LOOP;

CLOSE c2;
end //

call q2();

DROP PROCEDURE q2;
-- -----------------------------------------------------------

-- Q3. Update the salary by 20% for employees earning less than 4000 using a cursor in a stored procedure.\

drop procedure q3;

delimiter //
CREATE PROCEDURE q3()
BEGIN
declare e_salary float;
declare e_name varchar(30);
declare updated_salary float default 0;
declare done int default 0;
declare  c3 cursor for select emp_name, salary from employees;
declare continue handler for not found set done =  1;

open c3;
read_loop:loop

fetch c3 into e_name, e_salary;
if done = 1 then 
leave read_loop;
end if;

if(e_salary <4000)then
set updated_salary = e_salary + e_salary*0.2;
else 
set updated_salary = e_salary;
end if;

select e_name, updated_salary ;
end loop;

close c3;
end //

call q3();
-- --------------------------------------------------------------------------


-- Q4. Use a cursor to update product status to "Discontinued" if quantity is zero in the products table.

drop procedure q4;

delimiter //
CREATE PROCEDURE q4()
BEGIN
declare done int default 0;
declare p_name varchar(30);
declare p_quantity int;
declare p_status varchar(30);
declare f_status varchar(30);

declare c4 cursor for select product_name, quantity, status from products;
declare continue handler for not found set done = 1;

open c4;
read_loop: LOOP

fetch c4 into p_name, p_quantity, p_status;
IF done = 1 then
LEAVE read_loop;
END IF;

if (p_quantity = 0) then
set f_status = "Discontinued";
else 
set f_status = p_status;
end if;

select p_name, p_quantity, f_status;
end LOOP;

close c4;
end //

call q4();
-- ----------------------------------------------------------------

-- Q5. Write a procedure that counts employees in each department and inserts the results into dept_emp_count.

drop procedure q5;

delimiter //
CREATE PROCEDURE q5()
BEGIN
declare p_deptid int;
declare p_ecount int;
declare done int default 0;


declare c5 cursor for select dept_id, count(emp_id) as total_count from employees
group by dept_id;
declare continue handler for not found set done = 1;

open c5;
read_loop:loop


fetch c5 into p_deptid, p_ecount ;
if done = 1 then 
leave read_loop;
end if;

INSERT INTO dept_emp_count(dept_id, emp_count) values (p_deptid, p_ecount);

end loop;
close c5;

select * from dept_emp_count;
end //

call q5();
-- --------------------------------------------------------------------

-- Q6. Fetch student names and grades using a cursor and print only those with grades below 60.

select * from students;

drop procedure q6;

delimiter //
CREATE PROCEDURE q6()
BEGIN
declare s_name varchar(30);
declare s_grade int;
declare done int default 0;

declare c6 cursor for select student_name,grade from students;
declare continue handler for not found set done =1;

create temporary table if not exists temp_students (
	student_name VARCHAR(30),
    grade int 
    );
    
TRUNCATE TABLE temp_students;

open c6;

read_loop:loop

fetch c6 into s_name,s_grade;

if done =1 then
leave read_loop; 
end if;

if(s_grade < 60) then
	INSERT INTO temp_students(student_name,grade) VALUES (s_name,s_grade);
end if;

end loop;

close c6;

SELECT * FROM temp_students;

end //

call q6();
--  ---------------------------------------------------------------------------------

-- Q7.Create a stored procedure that loops through orders and prints each order ID using a cursor with a NOT FOUND handler.

drop procedure q7;

delimiter //
CREATE PROCEDURE q7()
BEGIN
DECLARE done int DEFAULT 0; 
DECLARE p_order_id int DEFAULT 0; 


DECLARE c7 CURSOR FOR SELECT order_id from orders;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_order(
	ordr_id int
);

OPEN c7;

read_loop: LOOP
	FETCH c7 INTO p_order_id;
    
    IF done = 1 then
		LEAVE read_loop;
	END IF;
    
    INSERT into temp_order(ordr_id) VALUES (p_order_id);
    
END LOOP;

CLOSE c7;

SELECT * FROM temp_order;

end //

call q7();
-- --------------------------------------------------------------------------------------

