#!/usr/bin/env bash

# Task 6: Deploy with Kubernetes and Save Output Logs
# CC7-L4-C10

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
# same dockerpath as specified in upload_docker.sh
dockerpath="pkiage/mlapi"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mlapi\
    --image=$dockerpath\
    --port=80 --labels app=mlapi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward mlapi 8000:80