# US Household Income Data Cleaning

SELECT * 
FROM us_household_income;

SELECT * 
FROM us_household_income_statistics;

SELECT COUNT(id)
FROM us_household_income_statistics;

SELECT COUNT(*) 
FROM us_household_income;

# Query to find both duplicates for id Column
SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1;

WITH duplicate_rows AS (
    SELECT row_id 
    FROM (
        SELECT row_id, id, ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
        FROM us_household_income
    ) duplicates
    WHERE row_num > 1
)
DELETE FROM us_household_income
WHERE row_id IN (SELECT row_id FROM duplicate_rows);

# Data Exploration
SELECT State_Name,ALand, AWater FROM us_household_income;

SELECT State_Name, SUM(ALand), SUM(AWater) 
FROM us_household_income
GROUP BY State_Name 
ORDER BY 2 DESC;

SELECT State_Name, SUM(ALand), SUM(AWater) 
FROM us_household_income
GROUP BY State_Name 
ORDER BY 3 DESC;

SELECT State_Name, SUM(ALand), SUM(AWater) 
FROM us_household_income
GROUP BY State_Name 
ORDER BY 2 DESC
LIMIT 10;

# TOP 10 by Water
SELECT State_Name, SUM(ALand), SUM(AWater) 
FROM us_household_income
GROUP BY State_Name 
ORDER BY 3 DESC
LIMIT 10;

SELECT  * FROM  us_household_income u 
JOIN us_household_income_statistics us 
	ON u.id = us.id;
    
SELECT  * 
FROM  us_household_income u 
RIGHT JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE u.id IS NULL;


SELECT  * FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0;


SELECT  u.State_Name, County, Type, `Primary`, Mean, Median
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0;    

# Five Lowest Income for Household
SELECT  u.State_Name, AVG(Mean), AVG(Median)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY u.State_name
ORDER BY 2
LIMIT 5;

SELECT  u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY u.State_name;


SELECT  u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY u.State_name
ORDER BY 2
LIMIT 5;

SELECT  u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY u.State_name
ORDER BY 3 DESC
LIMIT 10;

SELECT  u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY u.State_name
ORDER BY 3 ASC
LIMIT 10;

SELECT  Type, `Primary`, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY Type, `Primary`
ORDER BY 3 ASC
LIMIT 10;SELECT  Type, `Primary`, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY Type, `Primary`
ORDER BY 3 ASC
LIMIT 10;

SELECT  Type, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY Type
ORDER BY 3 DESC
LIMIT 10;


SELECT  Type, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY Type
ORDER BY 2 DESC
LIMIT 10;

SELECT  Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY 1
ORDER BY 3 DESC
LIMIT 20;

SELECT  Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0     
GROUP BY 1
ORDER BY 4 DESC
LIMIT 20;


SELECT  u.State_Name, City, ROUND(AVG(Mean),1)
FROM  us_household_income u 
INNER JOIN us_household_income_statistics us 
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name, City
ORDER BY city DESC;

