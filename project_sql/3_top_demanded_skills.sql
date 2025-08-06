/*
Question: What are the most in-demand skills for a Data Analyst as remote jobs?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on Data Analyst jobs where work from home is allowed.
- Why?
Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
(job title, skill name, and count of postings)
*/

SELECT
    jp.job_title_short,
    sd.skills AS skill_name,
    COUNT(sjd.job_id) AS demand_count
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sjd ON jp.job_id = sjd.job_id
INNER JOIN
    skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE
    jp.job_title_short = 'Data Analyst' AND
    jp.job_work_from_home = True
GROUP BY
    jp.job_title_short,
    skill_name
ORDER BY
    demand_count DESC
LIMIT 5;