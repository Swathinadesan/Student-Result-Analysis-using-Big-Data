-- Apache Hive analytics layer
-- Create the source table from the student CSV.

CREATE DATABASE IF NOT EXISTS student_bda;
USE student_bda;

DROP TABLE IF EXISTS student_results;

CREATE TABLE student_results (
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

-- In a lab cluster, load the CSV from HDFS:
-- LOAD DATA INPATH '/student_result/input/student_results.csv'
-- INTO TABLE student_results;

-- Skip the header row in queries by filtering student_id != 'student_id'.

-- 1. Student-wise total and average
SELECT student_id, name,
       (maths + science + english + computer) AS total_marks,
       ROUND((maths + science + english + computer) / 4.0, 2) AS average_marks
FROM student_results
WHERE student_id != 'student_id'
ORDER BY average_marks DESC;

-- 2. Top 5 students
SELECT student_id, name,
       (maths + science + english + computer) AS total_marks
FROM student_results
WHERE student_id != 'student_id'
ORDER BY total_marks DESC
LIMIT 5;

-- 3. Subject-wise average
SELECT
  ROUND(AVG(maths),2) AS maths_avg,
  ROUND(AVG(science),2) AS science_avg,
  ROUND(AVG(english),2) AS english_avg,
  ROUND(AVG(computer),2) AS computer_avg
FROM student_results
WHERE student_id != 'student_id';

-- 4. Overall pass percentage (all subjects >= 40)
SELECT
  ROUND(
    100.0 * SUM(
      CASE WHEN maths >= 40 AND science >= 40
             AND english >= 40 AND computer >= 40 THEN 1 ELSE 0 END
    ) / COUNT(*), 2
  ) AS overall_pass_percentage
FROM student_results
WHERE student_id != 'student_id';
