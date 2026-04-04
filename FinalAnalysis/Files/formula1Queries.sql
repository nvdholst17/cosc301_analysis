USE formula1;

-- EDA, the most important part of our data is in the Races table and ensuring we have a evenly distributed set of data over the years

-- Year analysis
SELECT 
    AVG(year) AS meanYear,
    STDDEV(year) AS stdDev,
    MIN(year) AS min,
    MAX(year) AS max
FROM races;

-- Are any years missing? No
SELECT 
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS missing_count
FROM races;

-- What percent of races happenned in each decade?
SELECT 
    FLOOR(year / 10) * 10 AS decade, 
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM races), 2) AS percentage
FROM races 
GROUP BY decade 
ORDER BY decade ASC;

-- The most frequent years
SELECT 
    year, 
    COUNT(*) AS count 
FROM races 
GROUP BY year 
ORDER BY count DESC 
LIMIT 5;
