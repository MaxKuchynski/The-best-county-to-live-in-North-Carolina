SELECT * FROM Capstone.school_perf;

SELECT COUNT(*)  # 2323 rows and 8 columns
FROM Capstone.school_perf;

# grades
SELECT distinct grade
FROM Capstone.school_perf;

# NC has 100 counties. Let's what we have
SELECT count(distinct district)
FROM Capstone.school_perf;

# Checking counties
SELECT distinct district
FROM Capstone.school_perf;

# Checking Wake County
SELECT * 
FROM Capstone.school_perf
WHERE district LIKE '%Wake%';

# The average school score per county
SELECT 
    district, ROUND(AVG(schoolscore), 2) AS avg_school_score
FROM
    Capstone.school_perf
GROUP BY district
ORDER BY 2 DESC;

# School rank
SELECT *, DENSE_RANK() OVER (ORDER BY avg_school_score DESC) AS rank_school
FROM Capstone.avg_school_score
ORDER BY avg_school_score DESC;







