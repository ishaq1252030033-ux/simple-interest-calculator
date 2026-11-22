
#!/bin/bash

# Simple Interest Calculator
# Author: Shaikh Ishaq

echo "=================================="
echo "     Simple Interest Calculator   "
echo "=================================="

# Get input from the user
read -r -p "Enter Principal Amount: " principal
read -r -p "Enter Rate of Interest (%): " rate
read -r -p "Enter Time Period (in years): " time

# Validate numeric input
is_number() {
    [[ "$1" =~ ^([0-9]+(\.[0-9]*)?|\.[0-9]+)$ ]]
}

if ! is_number "$principal" ||
   ! is_number "$rate" ||
   ! is_number "$time"; then
    echo "Error: Please enter valid non-negative numbers."
    exit 1
fi

# Calculate Simple Interest
# Formula: SI = (P * R * T) / 100
awk -v p="$principal" -v r="$rate" -v t="$time" '
BEGIN {
    interest = (p * r * t) / 100
    total = p + interest

    printf "\nSimple Interest: %.2f\n", interest
    printf "Total Amount: %.2f\n", total
}'

echo "=================================="
echo "Calculation completed successfully!"
