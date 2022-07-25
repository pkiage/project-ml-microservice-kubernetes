#!/usr/bin/env bash
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/

# Task 6: Deploy with Kubernetes and Save Output Logs
# CC7-L4-C10

# This tags and uploads an image to Docker Hub

# https://kubernetes.io/docs/concepts/workloads/pods/
#  Pods are the smallest deployable units of computing 
# that you can create and manage in Kubernetes.

# A Pod (as in a pod of whales or pea pod) 
# is a group of one or more containers, 
# with shared storage and network resources, 
# and a specification for how to run the containers.

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
# same dockerpath as specified in upload_docker.sh
dockerpath="pkiage/mlapi:v0.0.1"

# Step 2
# Run the Docker Hub container with kubernetes
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#run
# Create and run a particular image in a pod.
kubectl run mlapi\
    --image=$dockerpath\
    --port=80\
    --labels app=mlapi

# Step 3:
# List kubernetes pods
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get
# Display one or many resources.
kubectl get pods

# Step 4:
# Forward the container port to a host
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#port-forward
# Forward one or more local ports to a pod.
kubectl port-forward mlapi 8000:80