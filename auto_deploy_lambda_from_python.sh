#!/bin/bash

# Ask the user for the filename
read -p "Please enter your file name: " filename

# Check if the specified directory exists
if [ ! -d "$filename" ]; then
    echo "Directory '$filename' does not exist."
    exit 1
fi

# Navigate to the specified directory
cd "$filename" || exit

# Create the 'package' directory
mkdir -p package

python3 -m pip3 install --upgrade pip

# Install dependencies into the 'package' directory
python3 -m pip3 install -r requirements.txt --target ./package

# Navigate to the 'package' directory
cd package || exit

# Create a zip file of the package
zip -r "../${filename}_deployment_package.zip" .

# Go back to the original directory
cd ..

# Add the lambda_function.py to the zip package
zip "${filename}_deployment_package.zip" lambda_function.py

echo "Deployment package created: ${filename}_deployment_package.zip"
