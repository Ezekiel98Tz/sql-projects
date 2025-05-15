-- 1. Get a list of all employees with their department names
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_id = de.emp_id
JOIN departments d ON de.dept_id = d.dept_id;

+------------+          +------------+          +-------------+
| employees  |          | dept_emp   |          | departments |
|------------|          |------------|          |-------------|
| emp_id     | <----->  | emp_id     |          | dept_id     |
| first_name |          | dept_id    | <----->  | dept_name   |
| last_name  |          +------------+          +-------------+
+------------+


-- 2. Find the average salary in each department
SELECT 
    d.dept_name,
    AVG(s.salary) AS avg_salary
FROM salaries s
JOIN dept_emp de ON s.emp_id = de.emp_id
JOIN departments d ON de.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 3. List all employees hired after 2012
SELECT 
    emp_id,
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date > '2012-01-01';

-- 4. Get employees earning more than $70,000
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    s.salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.salary > 70000;

-- 5. Count of employees per department
SELECT 
    d.dept_name,
    COUNT(*) AS total_employees
FROM departments d
JOIN dept_emp de ON d.dept_id = de.dept_id
GROUP BY d.dept_name;

-- 6. Find the highest paid employee
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    s.salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
ORDER BY s.salary DESC
LIMIT 1;

-- 7. Show the title history of an employee
SELECT 
    t.emp_id,
    e.first_name,
    e.last_name,
    t.job_title,
    t.from_date,
    t.to_date
FROM titles t
JOIN employees e ON t.emp_id = e.emp_id
WHERE t.emp_id = 2;

-- 8. List employees with their salary and department in a single view
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    d.dept_name,
    s.salary
FROM employees e
JOIN dept_emp de ON e.emp_id = de.emp_id
JOIN departments d ON de.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;
