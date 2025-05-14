-- 1. List all students
SELECT * FROM students;

-- 2. List all subjects
SELECT * FROM subjects;

-- 3. List all results with student names and subject names
SELECT 
    s.first_name,
    s.last_name,
    sub.subject_name,
    r.score,
    r.exam_date
FROM results r
JOIN students s ON r.student_id = s.student_id
JOIN subjects sub ON r.subject_id = sub.subject_id;

-- 4. Show average score for each student
SELECT 
    s.first_name,
    s.last_name,
    AVG(r.score) AS average_score
FROM results r
JOIN students s ON r.student_id = s.student_id
GROUP BY r.student_id;

-- 5. Show highest score per subject
SELECT 
    sub.subject_name,
    MAX(r.score) AS highest_score
FROM results r
JOIN subjects sub ON r.subject_id = sub.subject_id
GROUP BY r.subject_id;

-- 6. List students who scored below 50 in any subject
SELECT 
    s.first_name,
    s.last_name,
    sub.subject_name,
    r.score
FROM results r
JOIN students s ON r.student_id = s.student_id
JOIN subjects sub ON r.subject_id = sub.subject_id
WHERE r.score < 50;

-- 7. Count how many students took each subject
SELECT 
    sub.subject_name,
    COUNT(DISTINCT r.student_id) AS students_taken
FROM results r
JOIN subjects sub ON r.subject_id = sub.subject_id
GROUP BY sub.subject_id;

-- 8. Show exam history for a specific student (e.g., student ID 1)
SELECT 
    s.first_name,
    s.last_name,
    sub.subject_name,
    r.score,
    r.exam_date
FROM results r
JOIN students s ON r.student_id = s.student_id
JOIN subjects sub ON r.subject_id = sub.subject_id
WHERE r.student_id = 1;

-- 9. Get average score per subject
SELECT 
    sub.subject_name,
    AVG(r.score) AS avg_score
FROM results r
JOIN subjects sub ON r.subject_id = sub.subject_id
GROUP BY sub.subject_id;

-- 10. Rank students by their average score
SELECT 
    s.first_name,
    s.last_name,
    ROUND(AVG(r.score), 2) AS avg_score
FROM results r
JOIN students s ON r.student_id = s.student_id
GROUP BY s.student_id
ORDER BY avg_score DESC;
