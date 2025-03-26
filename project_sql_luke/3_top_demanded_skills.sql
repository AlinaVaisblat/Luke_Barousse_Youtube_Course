--for all remote DA jobs
SELECT
    skills as skill_name,
    count(distinct j.job_id) as num_jobs
FROM job_postings_fact j
inner join skills_job_dim sj  on sj.job_id = j.job_id
inner join skills_dim s  on s.skill_id = sj.skill_id
where 
    job_title_short = 'Data Analyst' and
    job_work_from_home = TRUE
group BY 1
order by num_jobs desc
limit 5
;