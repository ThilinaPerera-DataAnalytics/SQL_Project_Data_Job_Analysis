/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, remote jobs, exclude null values
- Why?
It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    sd.skills AS skill_name,
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
GROUP BY
    skill_name
ORDER BY
    avg_salary DESC
LIMIT 20;

/*

[
  {
    "skill_name": "pyspark",
    "remote_job": true,
    "avg_salary": "208172.25"
  },
  {
    "skill_name": "bitbucket",
    "remote_job": true,
    "avg_salary": "189154.50"
  },
  {
    "skill_name": "couchbase",
    "remote_job": true,
    "avg_salary": "160515.00"
  },
  {
    "skill_name": "watson",
    "remote_job": true,
    "avg_salary": "160515.00"
  },
  {
    "skill_name": "datarobot",
    "remote_job": true,
    "avg_salary": "155485.50"
  },
  {
    "skill_name": "gitlab",
    "remote_job": true,
    "avg_salary": "154500.00"
  },
  {
    "skill_name": "swift",
    "remote_job": true,
    "avg_salary": "153750.00"
  },
  {
    "skill_name": "jupyter",
    "remote_job": true,
    "avg_salary": "152776.50"
  },
  {
    "skill_name": "pandas",
    "remote_job": true,
    "avg_salary": "151821.33"
  },
  {
    "skill_name": "elasticsearch",
    "remote_job": true,
    "avg_salary": "145000.00"
  },
  {
    "skill_name": "golang",
    "remote_job": true,
    "avg_salary": "145000.00"
  },
  {
    "skill_name": "numpy",
    "remote_job": true,
    "avg_salary": "143512.50"
  },
  {
    "skill_name": "databricks",
    "remote_job": true,
    "avg_salary": "141906.60"
  },
  {
    "skill_name": "linux",
    "remote_job": true,
    "avg_salary": "136507.50"
  },
  {
    "skill_name": "kubernetes",
    "remote_job": true,
    "avg_salary": "132500.00"
  },
  {
    "skill_name": "atlassian",
    "remote_job": true,
    "avg_salary": "131161.80"
  },
  {
    "skill_name": "twilio",
    "remote_job": true,
    "avg_salary": "127000.00"
  },
  {
    "skill_name": "airflow",
    "remote_job": true,
    "avg_salary": "126103.00"
  },
  {
    "skill_name": "scikit-learn",
    "remote_job": true,
    "avg_salary": "125781.25"
  },
  {
    "skill_name": "jenkins",
    "remote_job": true,
    "avg_salary": "125436.33"
  },
  {
    "skill_name": "notion",
    "remote_job": true,
    "avg_salary": "125000.00"
  },
  {
    "skill_name": "scala",
    "remote_job": true,
    "avg_salary": "124903.00"
  },
  {
    "skill_name": "postgresql",
    "remote_job": true,
    "avg_salary": "123878.75"
  },
  {
    "skill_name": "gcp",
    "remote_job": true,
    "avg_salary": "122500.00"
  },
  {
    "skill_name": "microstrategy",
    "remote_job": true,
    "avg_salary": "121619.25"
  }
]
*/
