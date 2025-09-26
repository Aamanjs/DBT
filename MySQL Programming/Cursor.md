### Q1. Create a stored procedure to fetch and print all employee names from the employees table using a cursor.
### Q2. Write a procedure that calculates the total salary of all employees using a cursor.
### Q3. Update the salary by 20% for employees earning less than 4000 using a cursor in a stored procedure.
### Q4. Use a cursor to update product status to "Discontinued" if quantity is zero in the products table.
### Q5. Write a procedure that counts employees in each department and inserts the results into dept_emp_count.
### Q6. Fetch student names and grades using a cursor and print only those with grades below 60
### Q7. Create a stored procedure that loops through orders and prints each order ID using a cursor with a NOT FOUND handler.
### Q8. Write a procedure that uses a cursor to fetch customer names and insert them into a customer_archive table.
### Q9. Use a cursor in a stored procedure to increase the price of all products by 5%.
### 10. Write a procedure that fetches all book titles from a books table and displays them using a cursor.


```SQL
-- Create Database
CREATE DATABASE cursor_PR;
USE cursor_PR;

-- 1. employees table
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);

INSERT INTO employees (emp_name, salary, dept_id) VALUES
('Alice', 3500, 1),
('Bob', 4200, 2),
('Charlie', 2900, 1),
('Diana', 5000, 3),
('Evan', 3100, 2);

-- 2. products table
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    status VARCHAR(20)
);

INSERT INTO products (product_name, quantity, status) VALUES
('Laptop', 10, 'Available'),
('Mouse', 0, 'Available'),
('Keyboard', 5, 'Available'),
('Monitor', 0, 'Available'),
('Printer', 3, 'Available');

-- 3. departments table
CREATE TABLE IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_name) VALUES
('Sales'),
('Marketing'),
('IT');

-- 4. dept_emp_count table
CREATE TABLE IF NOT EXISTS dept_emp_count (
    dept_id INT,
    emp_count INT
);

-- 5. students table
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50),
    grade INT
);

INSERT INTO students (student_name, grade) VALUES
('John', 45),
('Mary', 78),
('Steve', 62),
('Anna', 38),
('Paul', 55);

-- 6. orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders (order_date, customer_id, amount) VALUES
('2025-01-01', 1, 100.00),
('2025-01-05', 2, 150.50),
('2025-01-10', 3, 200.75);

-- 7. customer_archive table
CREATE TABLE IF NOT EXISTS customer_archive (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- 8. books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(100)
);

INSERT INTO books (book_title) VALUES
('The Great Gatsby'),
('1984'),
('To Kill a Mockingbird'),
('The Catcher in the Rye'),
('Moby-Dick');


```





