--What skills are  required for top-paying remote data anlyst jobs?
with top_paying_jobs AS
    (SELECT
    c.name,
    job_id,
    job_title,
    salary_year_avg
    FROM job_postings_fact j
    left join company_dim c  on j.company_id = c.company_id
    where 
        job_title_short = 'Data Analyst' and
        job_location = 'Anywhere' and
        salary_year_avg is not NULL
    order by salary_year_avg desc
    limit 10)
select
    x.skill_name,
    count (DISTINCT x.job_id) as num_jobs
from 
    (select 
        top_paying_jobs.*,
        s.skills as skill_name
    from  top_paying_jobs
    inner join skills_job_dim sj on sj.job_id = top_paying_jobs.job_id -- inner - to filter out jobs with  no skills specified
    inner join skills_dim s on s.skill_id = sj.skill_id
    ) as x
group by 1
order by num_jobs desc;


-- --Chat GPT's insights
-- Top 5 Most In-Demand Skills:
-- SQL – 8 occurrences → The most crucial skill for data querying and manipulation.

-- Python – 7 occurrences → Essential for data analysis, automation, and machine learning.

-- Tableau – 6 occurrences → Highly valued for data visualization and business intelligence.

-- R – 4 occurrences → Preferred for statistical analysis and data science roles.

-- Pandas, Excel, Snowflake – 3 occurrences each → Used for data processing, reporting, and cloud-based data storage.

-- Mid-Tier Skills (2 occurrences each):
-- Azure, AWS → Cloud platforms for data storage and computation.

-- Power BI → Another major BI tool alongside Tableau.

-- Oracle → Common in enterprise and healthcare analytics.

-- Go → Niche programming language for high-performance data processing.

-- NumPy → Python library for numerical computing.

-- GitLab, Bitbucket, Atlassian, Jira, Confluence → Version control and project management tools.

-- Lower Frequency Skills (1 occurrence each):
-- Databricks, PySpark → Big data technologies.

-- Jupyter → Used for interactive data analysis.

-- PowerPoint → Presentation tool, especially for senior-level roles.

-- Hadoop → Big data framework.

-- Crystal Reports, Flow → Specialized reporting tools.

-- SAP → Enterprise data analytics.

-- Jenkins → CI/CD and automation.

-- Git → Version control system.

-- Key Takeaways:
-- SQL and Python dominate all top-paying roles.

-- Cloud platforms (AWS, Azure, Snowflake) are key differentiators.

-- Visualization (Tableau, Power BI) is crucial for presenting insights.

-- Big data & DevOps tools (Databricks, Jenkins, GitLab) are gaining traction.




-- --As JSON before grouping (as in Luke's example)
-- [
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "sql"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "python"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "r"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "azure"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "databricks"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "aws"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "pandas"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "pyspark"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "jupyter"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "excel"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "tableau"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "power bi"
--   },
--   {
--     "name": "AT&T",
--     "job_id": 552322,
--     "job_title": "Associate Director- Data Insights",
--     "salary_year_avg": "255829.5",
--     "skill_name": "powerpoint"
--   },
--   {
--     "name": "Pinterest Job Advertisements",
--     "job_id": 99305,
--     "job_title": "Data Analyst, Marketing",
--     "salary_year_avg": "232423.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "Pinterest Job Advertisements",
--     "job_id": 99305,
--     "job_title": "Data Analyst, Marketing",
--     "salary_year_avg": "232423.0",
--     "skill_name": "python"
--   },
--   {
--     "name": "Pinterest Job Advertisements",
--     "job_id": 99305,
--     "job_title": "Data Analyst, Marketing",
--     "salary_year_avg": "232423.0",
--     "skill_name": "r"
--   },
--   {
--     "name": "Pinterest Job Advertisements",
--     "job_id": 99305,
--     "job_title": "Data Analyst, Marketing",
--     "salary_year_avg": "232423.0",
--     "skill_name": "hadoop"
--   },
--   {
--     "name": "Pinterest Job Advertisements",
--     "job_id": 99305,
--     "job_title": "Data Analyst, Marketing",
--     "salary_year_avg": "232423.0",
--     "skill_name": "tableau"
--   },
--   {
--     "name": "Uclahealthcareers",
--     "job_id": 1021647,
--     "job_title": "Data Analyst (Hybrid/Remote)",
--     "salary_year_avg": "217000.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "Uclahealthcareers",
--     "job_id": 1021647,
--     "job_title": "Data Analyst (Hybrid/Remote)",
--     "salary_year_avg": "217000.0",
--     "skill_name": "crystal"
--   },
--   {
--     "name": "Uclahealthcareers",
--     "job_id": 1021647,
--     "job_title": "Data Analyst (Hybrid/Remote)",
--     "salary_year_avg": "217000.0",
--     "skill_name": "oracle"
--   },
--   {
--     "name": "Uclahealthcareers",
--     "job_id": 1021647,
--     "job_title": "Data Analyst (Hybrid/Remote)",
--     "salary_year_avg": "217000.0",
--     "skill_name": "tableau"
--   },
--   {
--     "name": "Uclahealthcareers",
--     "job_id": 1021647,
--     "job_title": "Data Analyst (Hybrid/Remote)",
--     "salary_year_avg": "217000.0",
--     "skill_name": "flow"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "python"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "go"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "snowflake"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "pandas"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "numpy"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "excel"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "tableau"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 168310,
--     "job_title": "Principal Data Analyst (Remote)",
--     "salary_year_avg": "205000.0",
--     "skill_name": "gitlab"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "python"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "azure"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "aws"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "oracle"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "snowflake"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "tableau"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "power bi"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "sap"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "jenkins"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "bitbucket"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "atlassian"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "jira"
--   },
--   {
--     "name": "Inclusively",
--     "job_id": 731368,
--     "job_title": "Director, Data Analyst - HYBRID",
--     "salary_year_avg": "189309.0",
--     "skill_name": "confluence"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "python"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "r"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "git"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "bitbucket"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "atlassian"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "jira"
--   },
--   {
--     "name": "Motional",
--     "job_id": 310660,
--     "job_title": "Principal Data Analyst, AV Performance Analysis",
--     "salary_year_avg": "189000.0",
--     "skill_name": "confluence"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "python"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "go"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "snowflake"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "pandas"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "numpy"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "excel"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "tableau"
--   },
--   {
--     "name": "SmartAsset",
--     "job_id": 1749593,
--     "job_title": "Principal Data Analyst",
--     "salary_year_avg": "186000.0",
--     "skill_name": "gitlab"
--   },
--   {
--     "name": "Get It Recruit - Information Technology",
--     "job_id": 387860,
--     "job_title": "ERM Data Analyst",
--     "salary_year_avg": "184000.0",
--     "skill_name": "sql"
--   },
--   {
--     "name": "Get It Recruit - Information Technology",
--     "job_id": 387860,
--     "job_title": "ERM Data Analyst",
--     "salary_year_avg": "184000.0",
--     "skill_name": "python"
--   },
--   {
--     "name": "Get It Recruit - Information Technology",
--     "job_id": 387860,
--     "job_title": "ERM Data Analyst",
--     "salary_year_avg": "184000.0",
--     "skill_name": "r"
--   }
-- ]