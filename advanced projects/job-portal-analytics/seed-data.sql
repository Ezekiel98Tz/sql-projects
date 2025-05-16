-- Seed companies
INSERT INTO companies (company_name, industry, website) VALUES
('Tech Solutions Ltd', 'Technology', 'https://techsolutions.example.com'),
('HealthCare Plus', 'Healthcare', 'https://healthcareplus.example.com'),
('FinServe Corp', 'Finance', 'https://finserve.example.com');

-- Seed jobs
INSERT INTO jobs (company_id, job_title, job_description, location, salary_min, salary_max, posted_date, closing_date) VALUES
(1, 'Software Engineer', 'Develop and maintain software applications.', 'New York, NY', 70000, 120000, '2025-04-01', '2025-05-01'),
(1, 'Data Analyst', 'Analyze and interpret complex datasets.', 'Remote', 60000, 90000, '2025-04-05', '2025-05-10'),
(2, 'Registered Nurse', 'Provide patient care in hospital.', 'Los Angeles, CA', 50000, 80000, '2025-03-20', '2025-04-20'),
(3, 'Financial Advisor', 'Advise clients on financial planning.', 'Chicago, IL', 65000, 110000, '2025-04-15', '2025-05-15');

-- Seed applicants
INSERT INTO applicants (first_name, last_name, email, phone, resume_url) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', 'https://resumes.example.com/alice_johnson.pdf'),
('Bob', 'Smith', 'bob.smith@example.com', '555-5678', 'https://resumes.example.com/bob_smith.pdf'),
('Carol', 'Lee', 'carol.lee@example.com', '555-8765', 'https://resumes.example.com/carol_lee.pdf');

-- Seed skills
INSERT INTO skills (skill_name) VALUES
('Python'),
('SQL'),
('Project Management'),
('Nursing'),
('Financial Analysis'),
('Data Visualization');

-- Seed applicant_skills
INSERT INTO applicant_skills (applicant_id, skill_id) VALUES
(1, 1), -- Alice knows Python
(1, 2), -- Alice knows SQL
(2, 3), -- Bob knows Project Management
(2, 5), -- Bob knows Financial Analysis
(3, 4), -- Carol knows Nursing
(3, 6); -- Carol knows Data Visualization

-- Seed applications
INSERT INTO applications (job_id, applicant_id, application_date, status) VALUES
(1, 1, '2025-04-10', 'applied'), -- Alice applied for Software Engineer
(2, 1, '2025-04-11', 'reviewed'), -- Alice applied for Data Analyst
(4, 2, '2025-04-16', 'applied'), -- Bob applied for Financial Advisor
(3, 3, '2025-03-25', 'interview'); -- Carol applied for Registered Nurse

-- Seed job_views
INSERT INTO job_views (job_id, viewed_on, viewer_ip, user_agent) VALUES
(1, '2025-04-09 09:00:00', '192.168.1.10', 'Mozilla/5.0'),
(1, '2025-04-09 09:05:00', '192.168.1.11', 'Mozilla/5.0'),
(2, '2025-04-10 14:20:00', '192.168.1.12', 'Chrome/90.0'),
(4, '2025-04-16 10:00:00', '192.168.1.13', 'Safari/14.0');

-- Seed recruiter_notes
INSERT INTO recruiter_notes (application_id, note_text) VALUES
(1, 'Strong candidate with excellent coding skills.'),
(3, 'Needs more experience in financial products.'),
(4, 'Great clinical experience, invited to interview.');
