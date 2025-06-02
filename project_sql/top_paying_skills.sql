
with top_paying_jobs as (
select 
job_id,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date,
company_dim.name as company_name

from 
job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
where 
job_title_short = 'Data Analyst' and 
job_location = 'Anywhere' and 
salary_year_avg is not NULL
ORDER BY
salary_year_avg DESC
LIMIT 10
)

select
top_paying_jobs.*,
skills
 from top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
ORDER BY
salary_year_avg DESC
