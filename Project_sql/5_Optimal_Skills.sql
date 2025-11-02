/*
Question → What are the most optimal skills to learn for a data analyst?
Approach → Identify skills that are both in high demand and associated with high average salaries across data analyst job postings.
Focus → Combine frequency of skill mentions with salary data to highlight the most valuable skills.
Purpose → Helps aspiring analysts prioritize learning paths by focusing on skills that offer strong job market demand and high earning potential — enabling smarter career planning and faster growth.
*/

with skill_demand as (
select 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where job_title_short='Data Analyst' and job_location='India'
GROUP BY skills_dim.skills,skills_dim.skill_id
), avg_salary AS (  
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' 
      AND salary_year_avg IS NOT NULL 
      AND job_location = 'India'
    GROUP BY skills_dim.skill_id, skills_dim.skills
)

select
skill_demand.skill_id,
skill_demand.skills,
demand_count,
average_salary
from skill_demand
inner join avg_salary on skill_demand.skill_id = avg_salary.skill_id