/*
Question → What are the top skills based on salary?
Approach → Analyze the average salary associated with each skill across data analyst job postings.
Focus → Consider only roles that include specific salary information.
Purpose → Identifying which skills are linked to higher salaries helps prioritize learning, tailor upskilling efforts, and make informed decisions when targeting high-paying data analyst roles.
*/

select 
    skills,
    round(avg(salary_year_avg),0) as average_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where job_title_short='Data Analyst' and salary_year_avg is NOT NULL and job_location='India'
GROUP BY skills
ORDER BY average_salary desc
limit 20


/*
Insight Summary → Top-Paying Data Analyst Skills

1. Enterprise & Cloud Tools Drive Top Pay:
   Skills like Visio, Jira, Confluence, Power BI, and Azure are linked to higher salaries —
   showing that analysts who combine data work with business process and cloud analytics earn the most.

2. Storytelling Beats Coding Alone:
   Tools such as PowerPoint, Excel, and Google Sheets still command strong pay —
   because clear data communication and visualization are valued as much as technical skills.

3. Hybrid Analysts Earn More:
   Analysts blending core tools (SQL, Python, R) with automation, BI, or light ML (TensorFlow, PyTorch)
   tend to
*/