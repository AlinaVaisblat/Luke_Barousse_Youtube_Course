--Q4: What are the optimal skills to learn based on salary and popularity for remote jobs?
SELECT
    s.skill_id,
    s.skills as skill_name,
    count(distinct j.job_id) as num_jobs,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact j
inner join skills_job_dim sj  on sj.job_id = j.job_id
inner join skills_dim s  on s.skill_id = sj.skill_id
where 
    job_title_short = 'Data Analyst' and
    salary_year_avg is not null AND
    job_work_from_home = TRUE
group BY 1
having count(distinct j.job_id) >10
order by avg_salary desc, num_jobs desc
--limit 5
;

