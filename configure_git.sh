#!/bin/bash

# Define GitHub username, custom host alias, and office email
GITHUB_USER="<githubusername>"
HOST_ALIAS="<githubhostaliasinssh>"
OFFICE_EMAIL="<githubemail>"
USER_NAME="<githubusername>"

# Loop through all directories in the current location
for dir in */; do
    # Navigate to the repository directory
    cd "$dir" || continue

    # Check if it's a Git repository
    if [[ -d .git ]]; then
        # Set Git user name and email
        git config user.email "$OFFICE_EMAIL"
        git config user.name "$USER_NAME"

        # Add the remote origin URL with custom host alias
        git remote add origin git@$HOST_ALIAS:$GITHUB_USER/$(basename "$dir").git
        echo "Configured Git for $(basename "$dir") repository."
    else
        echo "Skipping non-Git directory: $(basename "$dir")."
    fi

    # Navigate back to the parent directory
    cd ..
done

