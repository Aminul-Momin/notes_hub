#!/bin/bash

:'
Taken From: https://www.youtube.com/watch?v=NSu4IWlOU7k&t=626s
to execute a Bash File:  "bash fileName.sh"
echo "The va.ue of the pwd command is $(pwd)"
putout = $(pwd)
echo "The value of the output variable is ${output}"
'
## FOR LOOP:
for i in $(seq 10)
do
	echo "Value is: $i"
done


for i in $(ls -1)
do
	echo chgrp cdrom ${i}
done

echo $((3+4))
echo $((3%4))


## CONTROL FLOW:
if [$((${1} % 2)) -eq 0]; then
	echo "Even!"
else
	echo "Odd!"
fi

# Numerical Conditional Operators
#	-eq	|
#	-ne	|
#	-lt	|
#	-le |
#	-le |
#	-gt	|
#	-ge |	


############################
#### Regular Expressions ####
############################
