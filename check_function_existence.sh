#!/bin/bash

read -p "Enter the function name to search for: " functionName
read -p "Enter the root directory to search in: " rootDirectory

grep -rHinwi "$functionName" "$rootDirectory" --include="*.py" | sed "s|$rootDirectory/||" | cut -d ':' -f 1,2



