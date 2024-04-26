#!/bin/bash

# COURSE="DevOps from current script"

# echo "Before calling otherscript, course: $COURSE"
# echo "Process ID of current script: $$"

# ./18-other-script.sh

# echo "After calling otherscript, course: $COURSE"



COURSE="DevOps from current script"

echo "Before calling otherscript, course: $COURSE"
echo "Process ID of current script: $$"

source ./18-other-script.sh

echo "After calling otherscript, course: $COURSE"