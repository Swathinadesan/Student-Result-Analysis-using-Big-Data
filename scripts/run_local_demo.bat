@echo off
echo Running Hadoop Streaming-style MapReduce locally...
type ..\data\student_results.csv | python ..\mapreduce\mapper.py | sort | python ..\mapreduce\reducer.py
pause
