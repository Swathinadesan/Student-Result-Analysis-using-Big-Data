CREATE DATABASE IF NOT EXISTS student_bda;

USE student_bda;

CREATE TABLE IF NOT EXISTS student_results (
    student_id STRING,
    name STRING,
    maths INT,
    science INT,
    english INT,
    computer INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'data/student_results.csv'
INTO TABLE student_results;

SELECT
    student_id,
    name,
    maths,
    science,
    english,
    computer,
    (maths + science + english + computer) AS total_marks,
    ROUND((maths + science + english + computer) / 4.0, 2) AS average,
    ROUND(((maths + science + english + computer) / 400.0) * 100, 2) AS percentage
FROM student_results;
