/*Question: What are the top-paying data analyst jobs?
- Identify the top  10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights on the skills in demand */

SELECT
    c.name,
    --job_id,
    job_title,
    --job_title_short,
    --job_location,
    --job_schedule_type,
    --job_posted_date,
    salary_year_avg
FROM job_postings_fact j
left join company_dim c  on j.company_id = c.company_id
where 
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    --and job_work_from_home = TRUE
    salary_year_avg is not NULL
order by salary_year_avg desc
limit 10;

-- --to see all columns in the table in PostgreSQL
-- SELECT *
--   FROM information_schema.columns
--  WHERE table_schema = 'public'
--    AND table_name   = 'job_postings_fact';
--Result
-- job_id,
-- company_id,
-- job_title_short,
-- job_title,
-- job_location,
-- job_via,
-- job_schedule_type,
-- job_work_from_home,
-- search_location,
-- job_posted_date,
-- job_no_degree_mention,
-- job_health_insurance,
-- job_country,
-- salary_rate,
-- salary_year_avg,
-- salary_hour_avg