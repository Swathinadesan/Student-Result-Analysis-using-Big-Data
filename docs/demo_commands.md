# Demo Commands

## HDFS
```bash
hdfs dfs -mkdir -p /student_result/input
hdfs dfs -put -f data/student_results.csv /student_result/input/
hdfs dfs -ls /student_result/input
hdfs dfs -cat /student_result/input/student_results.csv
```

## MapReduce
```bash
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-input /student_result/input/student_results.csv \
-output /student_result/output \
-mapper "python mapper.py" \
-reducer "python reducer.py" \
-files mapreduce/mapper.py,mapreduce/reducer.py
```

## Hive
```sql
CREATE DATABASE student_bda;
USE student_bda;
```
Then run `hive/student_result_analysis.sql`.
