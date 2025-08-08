/*
What are the most optimal skills to learn
(aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with
high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why?
Targets skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis
*/
/*
-- via combining query 3 and query 4 as CTEs
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM
        job_postings_fact AS jp
    INNER JOIN
        skills_job_dim AS sjd ON jp.job_id = sjd.job_id
    INNER JOIN
        skills_dim AS sd ON sjd.skill_id = sd.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
        AND jp.job_work_from_home = True
    GROUP BY
        sd.skill_id,
        sd.skills
),
average_salary AS (
    SELECT
        sd.skill_id,
        sd.skills,
        ROUND(AVG(jp.salary_year_avg), 2) AS avg_salary
    FROM
        job_postings_fact AS jp
    INNER JOIN
        skills_job_dim AS sjd ON jp.job_id = sjd.job_id
    INNER JOIN
        skills_dim AS sd ON sjd.skill_id = sd.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
        AND jp.job_work_from_home = True
    GROUP BY
        sd.skill_id,
        sd.skills
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills  AS skill_name,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    skills_demand.demand_count > 10
ORDER BY
    average_salary.avg_salary DESC,
    skills_demand.demand_count DESC
    
LIMIT 25;
*/
-----------------------------------------------------------------------
-- as a concise query

SELECT
    sd.skill_id,
    sd.skills AS skill_name,
    COUNT(sjd.job_id) AS demand_count, -- Or can use COUNT(jp.job_id)
    ROUND(AVG(jp.salary_year_avg), 2) AS annual_average_salary
FROM
    job_postings_fact AS jp
INNER JOIN
    skills_job_dim AS sjd ON jp.job_id = sjd.job_id
INNER JOIN
    skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE
    jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
GROUP BY
    sd.skill_id,
    skill_name
HAVING
    COUNT(sjd.job_id) > 10 -- Aggregations not allowed in WHERE atatement
ORDER BY
    annual_average_salary DESC,
    demand_count DESC
LIMIT 20;
 