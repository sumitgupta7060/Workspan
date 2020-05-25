#Given an array of integers, except one element every element occurrs exactly twice, return element which occurs only once.

#A = [2,3,2,4,4]
# "heder1", "header2", "header3"
# "aa", "bb", "cc"
#  "12", "23", "34"
#
# "cc", "bb", "aa"
#. 
#"""

#!/bin/bash
echo ""aa", "bb", "cc"" | (
    IFS=""", "
    while read line; do
    set -- $line
    for (( i=$#; i > 1; i-- )); do
    printf "%s, " "${!i}"
    done
    echo "$1"
    done
)

