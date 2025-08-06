/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries.
*/
WITH top_paying_jobs AS (
    SELECT
        jp.job_id,
        cd.name AS company_name,
        jp.job_title,
        jp.salary_year_avg AS annual_salary
    FROM
        job_postings_fact AS jp
    LEFT JOIN
        company_dim AS cd ON jp.company_id = cd.company_id
    WHERE
        jp.job_title_short = 'Data Analyst'
        AND jp.job_work_from_home = TRUE
        AND jp.salary_year_avg IS NOT NULL
    ORDER BY
        annual_salary DESC
    LIMIT 10
)

SELECT
    tp.*,
    sd.skills AS skill_name
FROM
    top_paying_jobs AS tp
INNER JOIN
    skills_job_dim AS sjd ON tp.job_id = sjd.job_id
INNER JOIN
    skills_dim AS sd ON sjd.skill_id = sd.skill_id
ORDER BY
    annual_salary DESC;

/*
Takeaways:
    SQL and Python are must-haves — no surprise there.
    Tableau still holds weight for dashboarding in high-paying roles.
    R, Snowflake, and Pandas follow — solid adds for analytical depth.
    Excel refuses to die. It’s still relevant even in top roles.
    Cloud & DevOps-adjacent tools (Azure, Bitbucket, Go) are creeping in.

[
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "annual_salary": "255829.5",
    "skill_name": "powerpoint"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "skill_name": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "skill_name": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "skill_name": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "skill_name": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "annual_salary": "232423.0",
    "skill_name": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "skill_name": "sql"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "skill_name": "crystal"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "skill_name": "oracle"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "skill_name": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "annual_salary": "217000.0",
    "skill_name": "flow"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "sql"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "python"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "go"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "snowflake"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "pandas"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "numpy"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "excel"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "tableau"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "annual_salary": "205000.0",
    "skill_name": "gitlab"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "sql"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "python"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "azure"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "aws"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "oracle"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "snowflake"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "tableau"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "power bi"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "sap"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "jenkins"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "bitbucket"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "atlassian"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "jira"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "annual_salary": "189309.0",
    "skill_name": "confluence"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "sql"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "python"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "r"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "git"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "bitbucket"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "atlassian"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "jira"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "annual_salary": "189000.0",
    "skill_name": "confluence"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "sql"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "python"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "go"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "snowflake"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "pandas"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "numpy"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "excel"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "tableau"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "annual_salary": "186000.0",
    "skill_name": "gitlab"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "annual_salary": "184000.0",
    "skill_name": "sql"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "annual_salary": "184000.0",
    "skill_name": "python"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "annual_salary": "184000.0",
    "skill_name": "r"
  }
]

*/