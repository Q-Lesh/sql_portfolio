/*
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

--Top 10 highest paying data analyst roles that are either remote or local
SELECT
	name AS company_name,
    job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date
	

FROM
	job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
	job_title = 'Data Analyst'
	AND salary_year_avg IS NOT NULL
	AND job_location = 'Anywhere' -- job from Netherlands e.g. or Europe or change to job_work_from_home. Точно также везде можно покрутить, поменять, усложнить может через добавление CASE или типа того. 

ORDER BY
	salary_year_avg DESC 

LIMIT 10;

