#!/usr/bin/env bash

# Task 2: Run a Container & Make a Prediction
# CC7-l3-C6-Building and Deploy
# https://www.docker.com/wp-content/uploads/2022/03/docker-cheat-sheet.pdf
# https://docs.docker.com/engine/reference/commandline/build/
# https://docs.docker.com/engine/reference/commandline/docker/
# https://docs.docker.com/engine/reference/commandline/run/

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag

# name and optionally a tag in the 'name:tag' format
docker build --tag=mlapi .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
# 8000 from make_predictions.sh
# 80 from Dockerfile

# publish a container's port(s) to the host
docker run -p 8000:80 mlapi