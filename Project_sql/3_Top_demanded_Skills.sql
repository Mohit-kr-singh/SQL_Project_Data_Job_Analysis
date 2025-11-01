/*
Question → What are the most in-demand skills for data analysts?
Approach → Use an inner join between job_postings_fact and the relevant skills table (similar to Query 2) to analyze all job postings.
Goal → Identify the top 5 most frequently requested skills for data analyst roles.
Purpose → Understanding which skills are most in demand helps prioritize learning, align career development with market needs, and improve job readiness for high-impact roles.
*/


select 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where job_title_short='Data Analyst' and job_location='India'
GROUP BY skills
ORDER BY demand_count desc
limit 5