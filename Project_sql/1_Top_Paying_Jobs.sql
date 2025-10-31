/*
Question → What are the highest-paying data analyst jobs in India?
Goal → Identify the top 10 data analyst roles with the highest salary potential.
*/

select 
    job_id,
    name as company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
from 
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id
WHERE
    job_title_short='Data Analyst' and 
    job_location='India' AND
    salary_year_avg is not NULL
order by
    salary_year_avg DESC
limit 10
