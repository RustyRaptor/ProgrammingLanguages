#!/bin/bash

# Prints a string when we don't have short-circuit evaluation. 
function print_answer {
    echo "We DO NOT have short-circuit evaluation!"
    return 0
}

# Set A to false to see if it skips or not. 
A=false

# If they are both true print that they are both true else print 
# A string we will use to see if we have short circuit eval. 
if [[ $A == true && $(print_answer) ]]; then
    echo "Both A and B are true"
else
    echo "If you only see this then we DO have short circuit evaluation"
fi
