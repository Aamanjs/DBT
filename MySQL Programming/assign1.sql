-- General Stored Procedure Problems (No Database Table)
--     1. Write a stored procedure that accepts two numbers as IN parameters and displays their sum.
--    2. Write a stored procedure that accepts one number as IN parameter and displays whether it is even or odd.
--    3. Write a stored procedure that accepts a string as IN parameter and displays the string in uppercase.
--    4. Write a stored procedure that accepts a number N and prints the factorial of N.
--    5. Write a stored procedure that accepts a number as IN parameter and prints the multiplication table of that number (up to 10).


-- sol 1
delimiter //
create procedure sumdetails(in a int, in b int)
begin
declare c int default 0;
set c = a + b;
select concat("The sum of ", a, " and ", b, " is: ", c) as Result;
end //

call sumdetails(4,9);
-- ---------------------------------------------------------------------


-- sol 2
delimiter //
create procedure evenOdd(in a int)
begin
declare b varchar(30) default "";
if(a%2 = 0) then
set b = " is Even Number";
else 
set b = " is Odd Number";
end if;
select concat(a, b) as Result;
end //

call evenOdd(8);
-- --------------------------------------------------------------------

-- sol 3
delimiter //
create procedure upper(in a varchar(30))
begin
declare c varchar(30) default "";
set c = upper(a);
select concat("upper case of ",a, " is: ", c) as Result;
end//

call upper("small");
-- --------------------------------------------------------------------
drop procedure factorial;
-- sol 4
delimiter //
create procedure factorial(in a int)
begin
declare f int default 1;
declare i int default 1;

while i <= a 
do 
set f = f*i;
set i = i+1;
end while;

select concat("Fatcorial of ", a, " is: ", f) as Result;

end//

call factorial(4);

--    5. Write a stored procedure that accepts a number as IN parameter and prints the multiplication table of that number (up to 10).

-- sol 5
delimiter //
create procedure multitable(in a int)
begin 
declare i int default 1;
declare c int ;

while i<=10
do 
set c = a*i;
select concat(a,' X ',i,' = ' ,c) as multiplication;
set i = i+1;

end while;


end//

CALL print_table(5);

-- -----------------------------------------------------------------------------------------------
-- Create the database
CREATE DATABASE companydb;
USE companydb;

-- Employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Insert sample employees
INSERT INTO employees VALUES
(1, 'Alice', 60000, 10),
(2, 'Bob', 55000, 20),
(3, 'Charlie', 70000, 10),
(4, 'David', 52000, 30);

-- View wmployees data
select * from employees;

-- ------------------------------------------------------------------------------------

-- Departments table (optional, for context)
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'HR'),
(20, 'Sales'),
(30, 'IT');

-- View departments data
select * from departments;

-- -----------------------------------------------------------------------------

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO orders VALUES
(101, 1, '2025-01-15', 150.00),
(102, 2, '2025-01-17', 300.00),
(103, 1, '2025-02-05', 200.00);

-- View orders data
select * from orders;

-- -----------------------------------------------------------------------------

-- Customers table (optional)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Customer A'),
(2, 'Customer B');

-- View customers data
select * from customers;

-- ---------------------------------------------------------------------------------

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock_qty INT
);

INSERT INTO products VALUES
(101, 'Laptop', 25),
(102, 'Mouse', 150),
(103, 'Keyboard', 100);

-- View products data
select * from products;

-- ------------------------------------------------------------------------------

-- Students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT,
    grade VARCHAR(2)
);

INSERT INTO students VALUES
(1, 'John Doe', 85, 'A'),
(2, 'Jane Smith', 75, 'B'),
(3, 'Sam Brown', 65, 'C');

-- View students data
select * from students;


-- Stored Procedure Problems Using Database Tables (with IN parameter)
--     1. Write a stored procedure that accepts an employee_id and displays the employee’s name and salary from the employees table.
--    2. Write a stored procedure that accepts a department_id and displays the count of employees in that department from the employees table.
--    3. Write a stored procedure that accepts a customer_id and displays all orders placed by that customer from the orders table.
--    4. Write a stored procedure that accepts a product_id and displays the product name and current stock quantity from the products table.
--    5. Write a stored procedure that accepts a student_id and displays the student’s marks and grade from the students table.


-- sol1
delimiter //
create procedure getemp(in eid int)
begin
select emp_name,salary  from employees
where employee_id = eid;
end//

call getemp(3);
-- ------------------------------------------------------

-- sol2
delimiter //
create procedure getempdetails(in deptid int, out pcount int)
begin
select count(*) into pcount from employees
where department_id = deptid
group by department_id;
end //

call getempdetails(10,@vcount);

select @vcount;
-- ---------------------------------------------------

-- sol3
delimiter //
create procedure custorders(in cust_id int)
begin
select * from orders
where customer_id = cust_id;
end //

call custorders(2);
-- -----------------------------------------------------

-- sol4
delimiter //
create procedure productDetails(in p_id int)
begin
select product_name, stock_qty
from products
where product_id = p_id;
end //

call productDetails(102);
-- ----------------------------------------------

-- sol5
delimiter //
create procedure studMarks(in s_id int)
begin
select marks, grade 
from students
where student_id = s_id;
end //

call studMarks(3);














