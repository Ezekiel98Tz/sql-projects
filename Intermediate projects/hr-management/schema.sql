-- Create departments table
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    birth_date DATE,
    hire_date DATE
);

-- Create titles table
CREATE TABLE titles (
    title_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    job_title VARCHAR(100),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Create salaries table
CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    salary DECIMAL(10,2),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Create dept_emp table (many-to-many relationship)
CREATE TABLE dept_emp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    dept_id INT,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
