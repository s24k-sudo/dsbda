-- Assignment 8 (Part B): Data Mining in Hive on Forest Fire Dataset

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS forest_db;
USE forest_db;

-- 2. Create Table for Forest Fire Dataset
-- Structure: X, Y, month, day, FFMC, DMC, DC, ISI, temp, RH, wind, rain, area
CREATE TABLE IF NOT EXISTS forest_fire (
    X INT,
    Y INT,
    month STRING,
    day STRING,
    FFMC FLOAT,
    DMC FLOAT,
    DC FLOAT,
    ISI FLOAT,
    temp FLOAT,
    RH FLOAT,
    wind FLOAT,
    rain FLOAT,
    area FLOAT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- 3. Load Data
-- Assuming forestfires.csv is in the local path or HDFS
LOAD DATA LOCAL INPATH 'forestfires.csv' OVERWRITE INTO TABLE forest_fire;

-- 4. Data Mining Queries

-- a. Find the total area burnt per month
SELECT month, SUM(area) as total_area
FROM forest_fire
GROUP BY month
ORDER BY total_area DESC;

-- b. Find the average temperature and humidity for months where area burnt > 10
SELECT month, AVG(temp), AVG(RH)
FROM forest_fire
WHERE area > 10
GROUP BY month;

-- c. Find the maximum wind speed recorded in each month
SELECT month, MAX(wind)
FROM forest_fire
GROUP BY month;
