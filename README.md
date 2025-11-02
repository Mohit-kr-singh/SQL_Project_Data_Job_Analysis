# SQL_Project_Data_Job_Analysis

## Introduction

📊 Dive into the Indian data job market! This project focuses on Data Analyst roles in India, uncovering insights into 💰 top-paying positions, 🔥 most in-demand skills, and 📈 the sweet spot where high demand meets high salary in the world of data analytics.

🔍 Explore the full set of SQL queries in the [project_sql](Project_sql) to see how each analysis was performed. 

## 📚 Background  

Driven by the goal of understanding and navigating the **Data Analyst job market in India** more effectively, this project was created to uncover insights about the skills and roles that truly matter.  

The motivation behind this analysis was to identify **top-paying** and **in-demand** skills, helping aspiring data analysts streamline their career planning and focus on what brings the best opportunities.  

---
### 💡 Key Questions Explored  

1. 💰 What are the **top-paying Data Analyst jobs** in India?  
2. 🧩 What **skills are required** for these top-paying jobs?  
3. 🔥 What **skills are most in demand** for data analysts?  
4. 📈 Which **skills are associated with higher salaries**?  
5. 🎯 What are the **most optimal skills** to learn — combining both demand and pay potential?

## 🛠️ Tools I Used  

For my deep dive into the **Data Analyst job market in India**, I utilized several key tools that powered my analysis and workflow:  

- **🧮 SQL:** The backbone of my analysis — used to query datasets and uncover actionable insights.  
- **🐘 PostgreSQL:** My chosen database management system, perfect for managing and analyzing large volumes of job posting data.  
- **💻 Visual Studio Code:** My go-to environment for writing, running, and managing SQL queries efficiently.  
- **🌐 Git & GitHub:** Essential for version control, tracking progress, and sharing my SQL scripts and findings for collaboration and transparency.


## 📊 The Analysis  

Each SQL query in this project was designed to explore a specific aspect of the **Data Analyst job market in India**.  
Below is a breakdown of how each question was approached and analyzed:  

---

### 1️⃣ Top-Paying Data Analyst Jobs  
To identify the **highest-paying roles**, I filtered job postings by:  
- **Job title:** Data Analyst  
- **Location:** India (focusing on both on-site and remote roles)  
- **Salary:** Considered only those with available yearly salary data  

This analysis revealed which companies and positions offer the **best salary potential** in the Indian data analytics market.  


**📄 SQL Query**
```sql
/*
Question → What are the highest-paying data analyst jobs in India?
Goal → Identify the top 10 data analyst roles with the highest salary potential.
*/

SELECT 
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date AS Date
FROM 
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'India'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

#### 📈 Chart Story Breakdown  

This chart visualizes the **Top 10 Highest-Paying Data Analyst Jobs in India**, comparing average yearly salaries across companies and job titles.

- **🏦 Deutsche Bank** leads with the **Senior Business & Data Analyst** role, offering an average salary of around **$119K**, showing strong demand for senior data professionals in the finance sector.
  
- **🏢 ACA Group** follows closely with a **Sr. Enterprise Data Analyst** position paying around **$118K**, indicating high value for enterprise-level data analytics.
  
- **🧬 Clarivate** appears twice in the list, reflecting consistent investment in data-driven roles within research and healthcare domains.
  
- **💡 Loop Health** and **Cargill** highlight how data analytics extends beyond tech — into **healthcare** and **supply chain analytics** with competitive pay.
  
- **📊 AlphaSense** and **Miratech** offer strong salaries for roles blending **AI research, business intelligence, and data integration**, underscoring the growing overlap between analytics and automation.
  
- **🔬 Merck Group** and **Bristol Myers Squibb** show that **biopharma companies** also value analytical expertise for research and commercial operations.  

**🧩 Key Takeaway:**  
High-paying Data Analyst roles in India are concentrated in **finance, enterprise solutions, and research-based industries**, especially for **senior o** 

![Alt text](Images/top_jobs.jpg)


### 2️⃣ Skills for Top-Paying Jobs  

To understand what **skills are required for the top-paying Data Analyst roles**, I joined the job postings dataset with the skills data.  
This provided deeper insight into what **employers value most** for high-compensation roles in India — helping identify which skills drive higher pay in the analytics domain.  

---

#### 🧩 Query Breakdown  

| Step | Description |
|------|--------------|
| **1. Identify Top-Paying Roles** | Selected the top 10 highest-paying Data Analyst jobs from the `job_postings_fact` table based on average yearly salary. |
| **2. Join with Company Data** | Used a `LEFT JOIN` with `company_dim` to include company names for better context. |
| **3. Merge Skills Information** | Joined the top-paying jobs with `skills_job_dim` and `skills_dim` tables to map each role to its required skills. |
| **4. Sort Results** | Ordered by salary in descending order to highlight the highest-paying jobs and their skill sets. |

---

#### 📄 SQL Query
```sql
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        name AS company_name,
        job_title,
        job_location,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND job_location = 'India' 
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;
```

<img width="1580" height="1180" alt="image" src="https://github.com/user-attachments/assets/3e39b781-ed49-447f-9f75-19a0e2beea4a" />

## 📊 Insights from the Analysis  

- **SQL** and **Excel** are the most common skills, forming the foundation of high-paying analytics roles.  
- **Power BI**, **Tableau**, and **Python** highlight strong demand for data visualization and technical expertise.  
- **Enterprise tools** like **Azure**, **Jira**, and **Confluence** link to the highest salaries, showing value in business collaboration and project management.  
- **Automation and storytelling tools** (e.g., **Flow**, **PowerPoint**) boost career growth for hybrid analysts.  

**🧩 Key Takeaway:**  
Top-paying Data Analyst roles reward professionals who blend **core analytics (SQL, Excel, Python)** with **business and visualization tools (Power BI, Azure, Jira, Confluence)** for maximum impact.

### 3️⃣ In-Demand Skills for Data Analysts  

This query identifies the **skills most frequently requested** in Data Analyst job postings across India, helping highlight the areas with the **highest demand** in the job market.  
It provides valuable guidance on which skills aspiring analysts should prioritize to improve employability.  

---

#### 🧩 Query Breakdown  

| Step | Description |
|------|--------------|
| **1. Join Tables** | Combined `job_postings_fact`, `skills_job_dim`, and `skills_dim` to link each job posting with its required skills. |
| **2. Filter Roles** | Focused only on jobs titled *Data Analyst* located in *India*. |
| **3. Count Skill Occurrences** | Counted how many times each skill appeared across all job listings. |
| **4. Sort & Limit** | Ordered by frequency (descending) and displayed the top 10 most requested skills. |

---

#### 📄 SQL Query
```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND job_location = 'India'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 10;
```
<img width="645" height="453" alt="image" src="https://github.com/user-attachments/assets/0f6e558b-a9e7-4aa2-a176-2e822fee8312" />

#### 📈 Chart Story Breakdown  

The bar chart visualizes the **frequency of the most requested skills** across Data Analyst job listings in India.  

- **SQL** dominates as the most in-demand skill, appearing in over **1,000 job postings** — a must-have for all analysts.  
- **Excel** and **Python** remain core tools for **data cleaning, processing, and automation**.  
- **Tableau** and **Power BI** stand out as essential for **data storytelling and visualization**.  
- **R** and **SAS** continue to be valuable for **statistical and business analytics** roles.  
- **Azure** and **AWS** highlight the growing demand for **cloud-based analytics** skills in modern data workflows.  

**🧩 Key Takeaway:**  
The most in-demand Data Analyst roles reward professionals who combine **SQL, Excel, and Python** with **visualization (Tableau, Power BI)** and **cloud technologies (Azure, AWS)** to stay future-ready in the evolving data landscape.


