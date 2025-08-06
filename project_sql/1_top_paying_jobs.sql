/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- Include company names
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment salaries and compensation.
*/

SELECT
    jp.job_id AS "JOB ID",
    cd.name AS "Company Name",
    jp.job_title AS "Jobs Type",
    jp.job_location AS " Location",
    jp.job_schedule_type AS "Job Schedule",
    jp.salary_year_avg AS "Annual Salary",
    jp.job_posted_date AS "Posted Date"
FROM
    job_postings_fact as jp
LEFT JOIN
    company_dim AS cd ON jp.company_id = cd.company_id
WHERE
    jp.job_title_short LIKE '%Data%Analyst%' AND
    jp.job_work_from_home = TRUE AND
    jp.salary_year_avg IS NOT NULL
ORDER BY
    "Annual Salary" DESC
LIMIT 10;