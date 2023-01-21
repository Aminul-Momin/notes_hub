#!/bin/sh

# https://tldp.org/LDP/abs/html/timedate.html

file_name=test_files
 
current_time=$(date "+%Y/%m/%d-%H.%M.%S")
current_time=$(date +%H_%M_%S)
echo $current_time
echo "Current Time : $current_time"
 
new_fileName="$file_name"_"$current_time"_TESTING".csv"

# Don't output as intended !!!!
new_fileName=TEST_FILE_"$(date +%H_%M_%S)"_"$current_time".csv

echo "New FileName: " "$new_fileName"

# now=$(date +"%T")
# echo "CURRENT_TIME_$now"