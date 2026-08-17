#!/bin/bash

# Fibonacci sequence generator

# NOTE: Bash arithmetic is limited to signed 64-bit integers
# Original: t1=0; t2=1; nextTerm=$((t1 + t2))
# Bash's $(( )) arithmetic overflows around F(93)
# 
# To handle F(100) and beyond, you would need to use:
# - 'bc' calculator: echo "scale=0; $t1 + $t2" | bc
# - Python: python3 -c "print($t1 + $t2)"
# 
# This version shows the limitation and warns about overflow

echo "Enter the number of terms: "
read n

echo "Fibonacci Series:"
echo "(Note: Bash arithmetic accurate up to F(93), values beyond will overflow)"

t1=0
t2=1

for ((i=1; i<=n; i++))
do
    echo "$t1, "
    nextTerm=$((t1 + t2))
    t1=$t2
    t2=$nextTerm
done

echo ""
