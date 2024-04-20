#!/bin/bash

CITIES=("Toronto" "Mississauga" "Oakville" "Burlington")

echo "1st City is: ${CITIES[0]}"
echo "2nd City is: ${CITIES[1]}"
echo "City 1st and 4th are: ${CITIES[2,3]}"
echo "All Cities are: ${CITIES[@]}"