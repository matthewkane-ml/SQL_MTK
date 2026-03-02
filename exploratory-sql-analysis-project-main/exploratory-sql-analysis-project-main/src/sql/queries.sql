-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1

SELECT *
FROM observations
LIMIT 10;

-- MISSION 2

SELECT DISTINCT region_id
FROM observations;


-- MISSION 3

SELECT COUNT( DISTINCT species_id)
FROM observations;

-- MISSION 4

SELECT COUNT(region_id)
FROM observations
WHERE region_id = 2;

-- MISSION 5

SELECT COUNT(observation_date)
FROM observations
WHERE observation_date = "1998-08-08";


-- Level 2 – Aggregation and Sorting

-- 6. Region with the most observations

SELECT region_id, COUNT(*) AS total_observations
FROM observations
GROUP BY region_id
ORDER BY total_observations DESC
LIMIT 1;

-- 7. Most frequent species

SELECT species_id,  COUNT(*) AS Num_of_observations
FROM observations
GROUP BY species_id
ORDER BY Num_of_observations DESC
LIMIT 5;

-- 8. Species with fewer than 5 records

SELECT species_id,  COUNT(*) AS Num_of_observations_of_Species
FROM observations
GROUP BY species_id
HAVING Num_of_observations_of_Species < 5;

-- 9. Most active observers

SELECT observer, COUNT(*) AS Num_of_observations_per_observer
FROM observations
GROUP BY observer
ORDER BY Num_of_observations_per_observer DESC;

-- Level 3 – JOIN

-- 10. Region name per observation

SELECT observations.id, regions.name 
FROM observations
JOIN regions
    ON  observations.region_id = regions.id;


-- 11. Scientific name of each species

SELECT observations.id, species.scientific_name
FROM observations
JOIN species 
    ON observations.species_id = species.id;


-- 12. Most observed species per region

SELECT regions.name, observations.species_id, COUNT(*) as Total 
FROM observations
JOIN regions 
    ON observations.region_id = regions.id
GROUP BY regions.name, observations.species_id
ORDER BY Total DESC;
