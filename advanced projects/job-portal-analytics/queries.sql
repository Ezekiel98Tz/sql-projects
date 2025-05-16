--1. Get all active job postings (not closed yet)

SELECT j.job_id, j.job_title, c.company_name, j.location, j.salary_min, j.salary_max, j.posted_date, j.closing_date
FROM jobs j
JOIN companies c ON j.company_id = c.company_id
WHERE j.closing_date >= CURDATE()
ORDER BY j.posted_date DESC;


--2. Count number of applicants per job

SELECT j.job_id, j.job_title, COUNT(a.application_id) AS applicant_count
FROM jobs j
LEFT JOIN applications a ON j.job_id = a.job_id
GROUP BY j.job_id, j.job_title
ORDER BY applicant_count DESC;


--3. List all applicants for a specific job with their application status

SELECT a.applicant_id, a.first_name, a.last_name, a.email, ap.status, ap.application_date
FROM applications ap
JOIN applicants a ON ap.applicant_id = a.applicant_id
WHERE ap.job_id = 1 -- replace with specific job_id
ORDER BY ap.application_date DESC;


--4. Find applicants with a particular skill

SELECT a.applicant_id, a.first_name, a.last_name, s.skill_name
FROM applicants a
JOIN applicant_skills ask ON a.applicant_id = ask.applicant_id
JOIN skills s ON ask.skill_id = s.skill_id
WHERE s.skill_name = 'Python'; -- replace with any skill


--5. Find jobs matching applicants’ skills (jobs that require skills applicants have)

--Assuming you want to find applicants with skills matching a particular job’s requirements — 
--this assumes you extend the jobs table or have a job_skills table (not in current schema).

SELECT DISTINCT a.applicant_id, a.first_name, a.last_name
FROM applicants a
JOIN applicant_skills ask ON a.applicant_id = ask.applicant_id
JOIN job_skills jsk ON ask.skill_id = jsk.skill_id
WHERE jsk.job_id = 1; -- replace with job_id


--6. Count number of applications by status (for recruitment dashboard)

SELECT status, COUNT(*) AS total
FROM applications
GROUP BY status;


--7. Top 5 most viewed jobs (by count of views in last 30 days)

SELECT j.job_id, j.job_title, c.company_name, COUNT(jv.view_id) AS views_count
FROM jobs j
JOIN job_views jv ON j.job_id = jv.job_id
JOIN companies c ON j.company_id = c.company_id
WHERE jv.viewed_on >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY j.job_id, j.job_title, c.company_name
ORDER BY views_count DESC
LIMIT 5;


--8. Recent recruiter notes for a specific application

SELECT rn.note_text, rn.created_at
FROM recruiter_notes rn
WHERE rn.application_id = 1 -- replace with application_id
ORDER BY rn.created_at DESC;


--9. Applicants who have applied but never got hired

SELECT DISTINCT a.applicant_id, a.first_name, a.last_name
FROM applicants a
JOIN applications ap ON a.applicant_id = ap.applicant_id
WHERE ap.status != 'hired';

--10. Applications submitted per day (last 7 days)

SELECT application_date, COUNT(*) AS applications_count
FROM applications
WHERE application_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
GROUP BY application_date
ORDER BY application_date DESC;