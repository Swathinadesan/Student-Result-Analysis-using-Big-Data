# Student Result Analysis using Big Data

A BDA mini-project demonstrating HDFS, Hadoop MapReduce and Hive using a student result dataset.

## BDA tools
- Hadoop HDFS: distributed storage
- Hadoop MapReduce: distributed processing
- Apache Hive: SQL-based analytics
- Python: Mapper and Reducer implementation

## Workflow
CSV -> HDFS -> MapReduce -> processed CSV -> Hive -> analytics

## Windows demo
1. Install/configure Hadoop and Hive according to your lab environment.
2. Put `data/student_results.csv` into HDFS.
3. Run the MapReduce job using the commands in `scripts/run_mapreduce.sh` or the Windows equivalent.
4. Load the processed output into Hive using `hive/student_result_analysis.sql`.
5. Run the queries to show average, highest marks, pass percentage and toppers.

Note: `mapper.py` and `reducer.py` are written in Hadoop Streaming style. They can also be tested locally with `scripts/run_local_demo.bat`.
