## Stored Procedure Practice Questions (10 Ques)

### 1. Write a procedure that accepts a student’s ID and returns their name in uppercase using UPPER().

### 2. Create a procedure that accepts an employee’s ID and returns the length of their name using LENGTH().

### 3. Write a procedure that accepts a date and returns the day name using DAYNAME().

### 4. Create a procedure that accepts a department ID and returns the average salary of employees in that department using AVG().

### 5. Write a procedure that accepts two dates and returns the number of days between them using DATEDIFF().

### 6. Write a procedure that accepts a product ID and increases its price by 10% if price > 5000, else 5%, using CASE.

### 7.  Create a procedure that accepts a year and checks whether it is a leap year using MOD() and IF().

### 8. Write a procedure that returns the nth highest salary from the employees table using ORDER BY and LIMIT.

### 9. Create a procedure that accepts an employee’s joining date and returns their years of experience using TIMESTAMPDIFF().

### 10. Write a procedure that accepts a customer’s phone number and returns a masked version (e.g., 98765****1) using CONCAT() and RIGHT().


```SQL
CREATE DATABASE function_pr;
USE function_pr;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50)
);

INSERT INTO students (student_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('Diana'),
('Evan');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE
);

INSERT INTO employees (emp_name, salary, dept_id, hire_date) VALUES
('John', 4500, 1, '2018-06-15'),
('Mary', 6000, 2, '2015-03-10'),
('Steve', 3500, 1, '2020-01-20'),
('Anna', 8000, 3, '2012-11-05'),
('Paul', 5500, 2, '2019-08-25');

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_name) VALUES
('Sales'),
('Marketing'),
('IT');

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (product_name, price) VALUES
('Laptop', 55000),
('Mouse', 800),
('Keyboard', 1200),
('Monitor', 9500),
('Printer', 6000);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders (order_date, customer_id, amount) VALUES
('2025-01-01', 1, 100.00),
('2025-01-10', 2, 250.50),
('2025-02-15', 3, 300.75);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    phone_number VARCHAR(15)
);

INSERT INTO customers (customer_name, phone_number) VALUES
('Raj', '9876543210'),
('Aman', '9123456789'),
('Sita', '9988776655');

