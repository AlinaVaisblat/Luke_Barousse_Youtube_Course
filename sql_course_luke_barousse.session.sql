


-- select * FROM 
-- --skills_job_dim
-- job_postings_fact
-- where job_work_from_home = 'true'
-- limit 100;


-- select distinct job_location
-- from job_postings_fact
-- where lower(job_location) like '%calgary%' 
-- and job_title_short = 'Data Analyst'
-- and job_work_from_home = 'true';


-- SELECT job_title_short,
--     --count(job_id) as num_jobs,
--     CASE when salary_hour_avg <=30 then 'low-paid'
--     when salary_hour_avg between 31 and 45 then 'mid-paid'
--     --when salary_hour_avg is NULL then 'unknown'
--     else 'well-paid' 
--     end as job_category,
--     salary_hour_avg
-- FROM job_postings_fact
-- WHERE job_title_short = 'Data Analyst' and salary_hour_avg is not null
-- --GROUP BY job_category
-- ORDER BY salary_hour_avg desc
-- limit 100;


--Practical Problem 7
-- with skills AS
--     (
--     select sjd.job_id,
--           sjd.skill_id,
--           sd.skills as skill_name
--     from skills_job_dim sjd
--     left join skills_dim sd on sd.skill_id = sjd.skill_id
--     --limit 10
--     ) 
-- select
--     s.skill_id,
--     s.skill_name,
--     count(distinct f.job_id) as num_jobs
-- from job_postings_fact f
-- inner join skills s on f.job_id = s.job_id
-- where f.job_work_from_home = 'true' 
--     and job_title_short = 'Data Analyst'
--     --and lower(job_location) like '%ca%'
-- GROUP By 1,2
-- order by num_jobs desc
-- limit 5;


-- --Practical Problem 8
-- select * from 
--     (select * from january_jobs
--     union all
--     select * from february_jobs
--     union all
--     select * from march_jobs) as s
-- where s.salary_year_avg > 70000
-- and job_title_short = 'Data Analyst';

