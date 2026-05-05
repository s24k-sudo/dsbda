#!/bin/bash
export HADOOP_HOME=/home/ajinkya/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Start Hadoop if not running
if ! jps | grep -q "NameNode"; then
    echo "Starting Hadoop..."
    start-all.sh
    sleep 10
fi

# Go to the assignment directory
cd "/mnt/c/Users/AJINKYA/OneDrive/Desktop/DSBDA/1"

# Compile
echo "Compiling..."
javac -classpath $(hadoop classpath) -d . UserLogMapper.java UserLogReducer.java UserLogDriver.java

# Jar
echo "Creating JAR..."
jar -cvf UserLog.jar mrLogFile_demo/*.class

# Prepare HDFS
echo "Preparing HDFS..."
hadoop fs -rm -r /output_log 2>/dev/null
hadoop fs -mkdir -p /input
hadoop fs -put -f access_log_short.csv /input

# Run
echo "Running MapReduce..."
hadoop jar UserLog.jar mrLogFile_demo.UserLogDriver /input /output_log

# Show Results
echo "Results:"
hadoop fs -cat /output_log/part-*
