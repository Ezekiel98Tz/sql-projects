-- Insert into students
INSERT INTO students (first_name, last_name, enrollment_year) VALUES
('Alice', 'Johnson', 2022),
('Bob', 'Smith', 2021),
('Catherine', 'Lee', 2023),
('David', 'Brown', 2022),
('Emily', 'Clark', 2021);

-- Insert into subjects
INSERT INTO subjects (subject_name) VALUES
('Mathematics'),
('Physics'),
('Chemistry'),
('History'),
('English');

-- Insert into results
INSERT INTO results (student_id, subject_id, score, exam_date) VALUES
(1, 1, 85, '2024-05-10'),
(1, 2, 78, '2024-05-12'),
(2, 1, 92, '2024-05-10'),
(2, 3, 66, '2024-05-15'),
(3, 4, 74, '2024-05-18'),
(4, 5, 88, '2024-05-20'),
(5, 2, 91, '2024-05-12'),
(5, 3, 84, '2024-05-15');

