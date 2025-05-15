-- Insert departments
INSERT INTO departments (dept_name) VALUES 
('Human Resources'),
('Engineering'),
('Marketing'),
('Finance'),
('Sales');

-- Insert employees
INSERT INTO employees (first_name, last_name, gender, birth_date, hire_date) VALUES 
('John', 'Doe', 'M', '1985-04-12', '2010-06-01'),
('Jane', 'Smith', 'F', '1990-09-23', '2015-03-15'),
('Alice', 'Brown', 'F', '1988-12-10', '2013-01-10'),
('Bob', 'Johnson', 'M', '1975-07-05', '2008-11-20'),
('Tom', 'Harris', 'M', '1992-02-18', '2019-08-01');

-- Insert titles
INSERT INTO titles (emp_id, job_title, from_date, to_date) VALUES
(1, 'HR Manager', '2010-06-01', NULL),
(2, 'Software Engineer', '2015-03-15', NULL),
(3, 'Marketing Lead', '2013-01-10', NULL),
(4, 'Finance Analyst', '2008-11-20', NULL),
(5, 'Sales Executive', '2019-08-01', NULL);

-- Insert salaries
INSERT INTO salaries (emp_id, salary, from_date, to_date) VALUES
(1, 70000.00, '2010-06-01', NULL),
(2, 85000.00, '2015-03-15', NULL),
(3, 65000.00, '2013-01-10', NULL),
(4, 75000.00, '2008-11-20', NULL),
(5, 60000.00, '2019-08-01', NULL);

-- Assign employees to departments
INSERT INTO dept_emp (emp_id, dept_id, from_date, to_date) VALUES
(1, 1, '2010-06-01', NULL),  -- HR
(2, 2, '2015-03-15', NULL),  -- Engineering
(3, 3, '2013-01-10', NULL),  -- Marketing
(4, 4, '2008-11-20', NULL),  -- Finance
(5, 5, '2019-08-01', NULL);  -- Sales
