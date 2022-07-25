#!/usr/bin/env bash

# Task 2: Run a Container & Make a Prediction
# CC7-l3-C6-Building and Deploy
# https://www.docker.com/wp-content/uploads/2022/03/docker-cheat-sheet.pdf
# 

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
# https://docs.docker.com/engine/reference/commandline/build/
# name and optionally a tag in the 'name:tag' format
docker build --tag=mlapi .

# Step 2: 
# List docker images
# Verifies is above image created
# should show image with repository name equivalent to that specified in tag
# https://docs.docker.com/engine/reference/commandline/image_ls/
docker image ls --format

# Step 3:
# Run flask app
# 8000 from make_predictions.sh
# 80 from Dockerfile
# https://docs.docker.com/engine/reference/commandline/run/
# publish a container's port(s) to the host
# https://docs.docker.com/language/java/run-containers/
docker run --publish 8000:80 mlapi