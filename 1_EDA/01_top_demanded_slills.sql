/*
PREGUNTA: CUALES SON LAS HABILIDADES MAS DEMANDADAS PRA UN DATA ENGINEER?
    IDENTIFICA EL TOP 10 DE HABILIDADES MAS DEMANDADAS PARA UN DATA ENGINNER
    CONCENTRATE EN LOS POSTEOS DE TRABAJOS REMOTOS

POR QUE?
    DEVUELVE EL TOP 10 HABILIDADES CON LA MAYOR DEMANDA EN EL MERCADO REMOTO,
    PROVEENDO INSIGHTS DENTRO DE LAS HABILIDADES MAS VALIOSAS PARA LOS DATA ENGINNERS
*/

SELECT 
     *
FROM job_postings_fact
LIMIT 1;

SELECT 
     *
FROM skills_job_dim
LIMIT 1;

SELECT 
     *
FROM skills_dim
LIMIT 1;

SELECT
    sd.skills,
    COUNT (jpf.*) as demand_count
FROM job_postings_fact AS jpf
INNER JOIN  skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
Here's the breakdown of the most demanded skills for data engineers:
SQL and Python are by far the most in-demand skills, with around 29,000 job postings each - nearly double the next closest skill.
Cloud platforms round out the top skills, with AWS leading at ~18,000 postings, followed by Azure at ~14,000.
Apache Spark completes the top 5 with nearly 13,000 postings, highlighting the importance of big data processing skills.

Key takeaways:
- SQL and Python remain the foundational skills for data engineers
- Cloud platforms (AWS, Azure) are critical for modern data engineering
- Big data tools like Spark continue to be highly valued
- Data pipeline tools (Airflow, Snowflake, Databricks) show growing demand
- Java and GCP round out the top 10 most requested skills

┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/