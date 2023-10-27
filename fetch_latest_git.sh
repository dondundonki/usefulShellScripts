#!/bin/bash

# Define the directory containing your repositories
repo_directory="<inputdirectory>"

# Loop through each directory in the specified path
for dir in "$repo_directory"/*; do
  if [ -d "$dir" ]; then
    # Check if it's a Git repository
    if [ -d "$dir/.git" ]; then
      # Change into the repository directory
      cd "$dir"
      result=$(basename "$dir")
      printf "\nChecking for updates in $result\n"
      # Perform a git pull
      git pull
      # Return to the original directory
      cd "$repo_directory"
    else
      printf "Skipping non-Git directory: $dir"
    fi
  fi
done