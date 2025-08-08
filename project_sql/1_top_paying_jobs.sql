/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- Include company names
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment salaries and compensation.
*/

SELECT
    jp.job_id,
    cd.name AS company_name,
    jp.job_title,
    jp.job_location,
    jp.job_schedule_type,
    ROUND(jp.salary_year_avg, 2) AS annual_salary,
    jp.job_posted_date
FROM
    job_postings_fact as jp
LEFT JOIN
    company_dim AS cd ON jp.company_id = cd.company_id
WHERE
    jp.job_title_short LIKE 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
ORDER BY
    annual_salary DESC
LIMIT 15;