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

### 4️⃣ Skills Based on Salary  

This query explores the **average salaries associated with different skills** among Data Analyst roles in India.  
It helps identify which skills are linked to **higher compensation**, guiding professionals on which tools and technologies to prioritize for better career growth.  

---

#### 🧩 Query Breakdown  

Step  Description 
--------------------
**1. Join Tables** | Connected `job_postings_fact`, `skills_job_dim`, and `skills_dim` to link job postings with their required skills. 
**2. Filter Relevant Data** | Focused only on *Data Analyst* roles in *India* with available salary information. 
**3. Calculate Averages** | Computed the average yearly salary for each skill using the `AVG()` function. 
**4. Rank Skills by Pay** | Sorted skills in descending order of average salary to identify top-paying ones. 

---

#### 📄 SQL Query
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_location = 'India'
GROUP BY 
    skills
ORDER BY 
    average_salary DESC
LIMIT 20;
```

#### 💰 Top 10 Highest-Paying Data Analyst Skills in India  

| Rank | Skill | Average Salary (USD) |
|------|--------|---------------------:|
| 1️⃣ | Visio | **119,250** |
| 2️⃣ | Jira | **119,250** |
| 3️⃣ | Confluence | **119,250** |
| 4️⃣ | Power BI | **118,140** |
| 5️⃣ | Azure | **118,140** |
| 6️⃣ | PowerPoint | **104,550** |
| 7️⃣ | Flow | **96,604** |
| 8️⃣ | Sheets | **93,600** |
| 9️⃣ | Word | **89,579** |
| 🔟 | SQL | **85,397** |

#### 📊 Insights Breakdown  

The table highlights the **skills most closely associated with higher salaries** for Data Analyst roles in India.  

- **🏢 Enterprise tools** like **Visio**, **Jira**, and **Confluence** top the list — showing strong demand for analysts who can manage workflows, documentation, and collaboration in enterprise environments.  
- **⚙️ Business Intelligence & Cloud** skills such as **Power BI** and **Azure** also rank high, reflecting the premium placed on cloud-based analytics and data visualization expertise.  
- **🧮 Core analytical tools** like **SQL**, **Excel**, and **Python** remain essential but command slightly lower salaries compared to enterprise-level tools.  
- **🧠 Advanced frameworks** like **TensorFlow** and **PyTorch** demonstrate that knowledge in **machine learning** can also boost earning potential.  
- **💼 Productivity tools** (Word, PowerPoint, Outlook) still appear in high-paying roles, underscoring the value of communication and reporting in analytics.  

**🧩 Key Takeaway:**  
To reach the **top salary bracket**, Data Analysts should combine **core technical skills (SQL, Python)** with **enterprise and visualization tools (Power BI, Azure, Jira)** — blending technical analysis with strategic business insight.

### 5️⃣ Most Optimal Skills to Learn  

This query combines **skill demand** and **average salary** data to reveal which skills provide the **best career ROI** — i.e., those that are both **frequently required** and **highly paid** in India’s Data Analyst job market.  

---

#### 🧩 Query Breakdown  

**Step  Description ** 

**1. skill_demand CTE** Calculates how many job postings mention each skill — identifying which ones are most in demand.

**2. avg_salary CTE**  Computes the average salary for each skill, showing its market value.

**3. Combine Results**  Joins both datasets on `skill_id` to align demand and salary insights for every skill.

---

#### 📄 SQL Query  

```sql
WITH skill_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND job_location = 'India'
    GROUP BY skills_dim.skills, skills_dim.skill_id
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
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_location = 'India'
    GROUP BY skills_dim.skill_id, skills_dim.skills
)
SELECT
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    average_salary
FROM skill_demand
INNER JOIN avg_salary 
    ON skill_demand.skill_id = avg_salary.skill_id;
```

#### 💡 Top Skills Balancing Salary & Demand  

| Rank | Skill | Demand Count | Avg. Salary (USD) | Insight |
|------|--------|---------------:|------------------:|---------|
| 1️⃣ | **SQL** | 1,016 | 85,397 | The foundation of all analytics — required in nearly every job, ensuring stability and consistent demand. |
| 2️⃣ | **Excel** | 717 | 84,366 | Core analytical tool; essential for business reporting, dashboards, and quick data insights. |
| 3️⃣ | **Python** | 687 | 77,186 | Key for automation, data cleaning, and analysis; bridges analytics and data science. |
| 4️⃣ | **Tableau** | 545 | 74,435 | Visualization powerhouse for data storytelling and executive reporting. |
| 5️⃣ | **Power BI** | 402 | 118,140 | High salary premium; combines visualization and enterprise-level reporting. |
| 6️⃣ | **Azure** | 151 | 118,140 | Reflects rising demand for cloud analytics and enterprise data solutions. |
| 7️⃣ | **PowerPoint** | 154 | 104,550 | High value for presentation and communication of insights. |
| 8️⃣ | **R** | 286 | 76,667 | Useful for statistical modeling and deeper analytical insights. |
| 9️⃣ | **Flow** | 102 | 96,604 | Growing automation skill linking analytics with workflow efficiency. |
| 🔟 | **Visio / Jira / Confluence** | 17–57 | 119,250 | Premium enterprise collaboration tools — seen in senior analyst and business strategy roles. |

---

#### 📊 Insights Breakdown  

- **🔹 High-demand, high-salary intersection:** Skills like **SQL**, **Excel**, and **Python** dominate in job volume while maintaining strong salary levels.  
- **💼 Enterprise advantage:** Tools such as **Power BI**, **Azure**, **Visio**, and **Jira** offer premium pay — common in large-scale analytics teams.  
- **📈 Visualization and communication:** **Tableau** and **PowerPoint** remain vital for data storytelling and business presentations.  
- **🧠 Automation edge:** Skills like **Flow** and **Cloud tools (Azure)** indicate growing adoption of automation and scalable data workflows.  

**🧩 Key Takeaway:**  
To maximize both **career opportunities** and **salary potential**, Data Analysts should focus on mastering a **hybrid stack**:  
➡️ **Core tools:** SQL, Excel, Python  
➡️ **Visualization:** Power BI, Tableau  
➡️ **Cloud & Enterprise:** Azure, Jira, Confluence  
➡️ **Communication & Automation:** PowerPoint, Flow  

---

