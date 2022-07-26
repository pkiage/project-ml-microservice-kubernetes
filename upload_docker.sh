#!/usr/bin/env bash
# Task 4: Upload the Docker Image

# CC7-L4-C6
# CC7-L4-C10 

# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
## path is tag specified in run_docker.sh
### docker build -t mlapi .

dockerpath="pkiage/mlapi:v0.0.1"

# Step 2:  
# Authenticate & tag
## Authenticate
# https://docs.docker.com/engine/reference/commandline/login/
docker login

## Tag
### tag should be similar to that specified in run_docker.sh
### docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
### Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
# https://docs.docker.com/engine/reference/commandline/tag/
docker tag mlapi $dockerpath

echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
# https://docs.docker.com/engine/reference/commandline/push/
docker push $dockerpath