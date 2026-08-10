#!/bin/bash

# Fibonacci sequence generator using bc for arbitrary precision
# bc is typically pre-installed on macOS and Linux systems

echo -n "Enter the number of terms: "
read n

echo "Fibonacci Series (using bc for arbitrary precision):"

t1=0
t2=1

for ((i=1; i<=n; i++))
do
    echo -n "$t1, "
    # Use bc for arbitrary precision arithmetic
    nextTerm=$(echo "$t1 + $t2" | bc)
    t1=$t2
    t2=$nextTerm
done

echo ""
