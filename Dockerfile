# https://docs.docker.com/engine/reference/builder/#from
# A valid Dockerfile must start with a FROM instruction.
# Initializes a new build stage and sets the Base Image 
# for subsequent instructions
FROM python:3.7.3-stretch

# Task 1: Complete the Dockerfile
# CC7-L2-C7
# CC7-L3-C1

## Step 1:
# Create a working directory
# https://docs.docker.com/engine/reference/builder/#workdir
# The WORKDIR instruction sets the working directory for any 
# RUN, CMD, ENTRYPOINT, COPY and ADD instructions 
# that follow it in the Dockerfile.
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013

# https://docs.docker.com/engine/reference/builder/#run
# execute any commands in a new layer 
# on top of the current image and commit the results
# resulting committed image will be used 
# for the next step in the Dockerfil
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt        
## Step 4:
# Expose port 80
# https://docs.docker.com/engine/reference/builder/#expose
# Informs Docker that the container listens 
# on the specified network ports at runtime.

# The EXPOSE instruction does not actually publish the port.
# It functions as a type of documentation between 
# the person who builds the image and 
# the person who runs the container, 
# about which ports are intended to be published.

# To actually publish the port when running the container, 
# use the -p flag on docker run to publish and map one or more ports, 
# or the -P flag to publish all exposed ports 
# and map them to high-order ports.
# port is published in run_docker.sh
EXPOSE 80

## Step 5:
# Run app.py at container launch
# https://docs.docker.com/engine/reference/builder/#cmd
# The main purpose of a CMD is to provide defaults for an executing container.
# CMD ["executable","param1","param2"] (exec form, this is the preferred form)
# python app.py translates to CMD ["python","app.py"]
CMD ["python","app.py"]
