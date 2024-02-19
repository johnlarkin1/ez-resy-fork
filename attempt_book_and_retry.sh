#!/bin/bash

# Maximum number of attempts
max_attempts=5
attempt=0

# Command to run
command="npm run start:today"

# Directory where your npm project is located
# TODO(@user): populate
project_dir=$PWD

# Change to the project directory
cd "$project_dir"

# Run the command and retry upon failure
while [ $attempt -lt $max_attempts ]; do
  echo "Attempt $((attempt+1)) of $max_attempts"
  if $command; then
    echo "Command succeeded."
    break
  else
    echo "Command failed, retrying in 20 seconds..."
    sleep 20
  fi
  attempt=$((attempt+1))
done

if [ $attempt -eq $max_attempts ]; then
  echo "Command failed after $max_attempts attempts."
fi
