--Q4: What are top skills based on salary (all locations)
SELECT
    skills as skill_name,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact j
inner join skills_job_dim sj  on sj.job_id = j.job_id
inner join skills_dim s  on s.skill_id = sj.skill_id
where 
    job_title_short = 'Data Analyst' and
    --job_title like '%Data%Analyst%' and
    salary_year_avg is not null
group BY 1
order by avg_salary desc
limit 5
;
