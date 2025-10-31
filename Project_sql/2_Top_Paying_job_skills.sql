/*
Question → What skills are required for the highest-paying data analyst jobs?
Goal → Use the top 10 highest-paying data analyst roles identified earlier and list the specific technical and domain skills required for each.
Purpose → This will help aspiring analysts understand which skills to prioritize for career growth, align their learning paths with industry demand, and target roles with the best salary potential.
*/

with top_paying_jobs as (
select 
    job_id,
    name as company_name,
    job_title,
    job_location,
    salary_year_avg
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
)
select 
    top_paying_jobs.*,
    skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
order by salary_year_avg desc

/*
Overall Insights Summary

🔹 Top 3 Skills: SQL, Excel, Python → Non-negotiable for data roles.
🔹 Complementary Skills: Tableau + Communication tools (Excel/Word/Confluence).
🔹 Bonus Skills: ML libraries, Jira, and automation tools (Flow).
🔹 Skill Balance: ~60% analytical/data-focused, ~25% business/reporting, ~15% technical support or automation.
*/