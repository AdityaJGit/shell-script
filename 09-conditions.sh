#!/bin/bash
NUMBER=$1
#-gt(greater than),-lt(less than),-eq(equal to),-ge(greater than equal to),-le(less than equal to)
if [ $NUMBER -gt 100]
then
    echo "Given Number is Greater than 100"
else
    echo "Given Number is Less than or Equal to 100"
fi