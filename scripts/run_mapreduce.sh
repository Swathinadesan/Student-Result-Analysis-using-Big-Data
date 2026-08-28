#!/bin/bash
# Example Hadoop Streaming command.
# Adjust HADOOP_STREAMING_JAR for your Hadoop installation.

HADOOP_STREAMING_JAR=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar

hdfs dfs -mkdir -p /student_result/input
hdfs dfs -put -f data/student_results.csv /student_result/input/

hdfs dfs -rm -r -f /student_result/output

hadoop jar $HADOOP_STREAMING_JAR \
  -input /student_result/input/student_results.csv \
  -output /student_result/output \
  -mapper "python mapper.py" \
  -reducer "python reducer.py" \
  -files mapreduce/mapper.py,mapreduce/reducer.py

hdfs dfs -cat /student_result/output/part-*
