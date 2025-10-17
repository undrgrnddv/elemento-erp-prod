#!/bin/bash

# This script clones a list of specified OCA repositories into a 'myaddons' directory.
# Each repository will be placed in its own subdirectory.

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the main directory name
MAIN_DIR="myaddons"

# Create the main directory if it doesn't already exist
echo "Creating the main directory: $MAIN_DIR..."
mkdir -p "$MAIN_DIR"

# Navigate into the main directory
cd "$MAIN_DIR"

# Array of repository URLs to clone
repos=(
    "https://github.com/OCA/account-financial-reporting.git"
    "https://github.com/OCA/account-financial-tools.git"
    "https://github.com/OCA/mis-builder.git"
    "https://github.com/OCA/reporting-engine.git"
    "https://github.com/OCA/server-ux.git"
    "https://github.com/OCA/web.git"
)

# Loop through the array and clone each repository
echo "Starting to clone repositories..."
for repo_url in "${repos[@]}"
do
    # Extract the repository name from the URL to use as the folder name
    # Example: https://github.com/OCA/web.git -> web
    repo_name=$(basename "$repo_url" .git)

    echo "----------------------------------------"
    echo "Cloning $repo_name from $repo_url"
    git clone "$repo_url" "$repo_name"
    echo "Successfully cloned into '$repo_name'."
done

echo "----------------------------------------"
echo "All repositories have been cloned successfully."
echo "The contents of '$MAIN_DIR' are:"
ls -l

# Navigate back to the original directory
cd ..