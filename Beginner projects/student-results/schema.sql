
-- Create students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    enrollment_year INT
);

-- Create subjects table
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Create results table
CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    score INT,
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);



SHOW TABLES;

DELETE FROM students WHERE student_id = <student_id>;
DELETE FROM results WHERE subject_id = <subject_id>;





-- Temporarily disable foreign key checks to avoid constraint errors
SET foreign_key_checks = 0;

-- Drop the tables in reverse dependency order
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS students;

-- Re-enable foreign key checks
SET foreign_key_checks = 1;
