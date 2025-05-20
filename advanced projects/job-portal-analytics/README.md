#  Job Portal Analytics

An advanced SQL project designed to simulate the backend of a job portal platform. It supports job postings, applications, recruiters, and applicant tracking for real-world HR analytics.

##  Project Structure

- `schema.sql` – Database schema with all core entities.
- `seed_data.sql` – Sample data for companies, jobs, applicants, etc.
- `queries.sql` – Useful analytical and operational SQL queries.

## 🔍 Features

- Job postings by companies with location, salary range, and deadlines.
- Applicant profiles and skill tagging.
- Applications tracking with statuses and timelines.
- Recruiter notes and job view tracking.

##  Key SQL Queries

- Top 5 most applied jobs.
- Application conversion rate by company.
- Applicants with most relevant skills.
- Average application processing time.
- Job view trends over time.

##  Tables

- `companies`
- `jobs`
- `applicants`
- `skills`
- `applicant_skills`
- `applications`
- `recruiter_notes`
- `job_views`

##  Notes

- Helps simulate real-world job analytics and insights.
- Includes many-to-many and status-tracking relationships.
