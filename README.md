[![pkiage](https://circleci.com/gh/pkiage/project-ml-microservice-kubernetes.svg?style=svg)](https://app.circleci.com/pipelines/github/pkiage/project-ml-microservice-kubernetes)

# Udacity - Cloud DevOps Engineering - Project 4: Operationalize Machine Learning Microservice API

## Project Summary

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Running The Python Scripts & Web App

### Clone the Repository

```shell
git clone https://github.com/pkiage/project-ml-microservice-kubernetes.git
```

### Create and Activate Environment

```shell
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```
#### Install dependencies

```shell
make install
```

#### Confirm all requirementes installed

```shell
docker --version
```

### Run Lint Check

```shell
make lint
```

### Run a Container & Make a Prediction

#### Run and build a Docker image

```shell
./run_docker.sh
```

#### Make a prediction

```shell
./make_prediction.sh
```

### Upload the Docker Image

```shell
./upload_docker.sh
```

### Configure Kubernetes to Run Locally

```shell
minikube start
```

#### Verify

```shell
kubectl config view
```

### Deploy with Kubernetes and Save Output Logs

#### Deploy application on the Kubernetes cluster

```shell
./run_kubernetes.sh
```

#### Make a Prediction

```shell
./make_prediction.sh
```

## Files In The Repository
```folder-structure
├── .circleci               
│   └── config.yml                        ### 
├── model_data  
|   ├── boston_housing_prediction.joblib  ###
|   └── housing.csv                       ###  
├── output_txt_files 
|   ├── docker_out.txt                    ### Log statements from app.py following executing run_docker.sh
|   └── kubernetes_out.txt                ### Log statements after running a prediction via Kubernetes deployment
├── .gitignore                            ###
├── app.py                                ###
├── Dockerfile                            ### Contains all commands a user could call on command line to assemble an image
├── make_predictions.sh                   ### Sends some input into containerized application via appropriate port
├── requirements.txt                      ###
├── rubric.png                            ### Udacity Project 4 Rubric
├── run_docker.sh                         ### Enables getting Docker running, locally
├── run_kubernetes.sh                     ### Deploys application on the Kubernetes cluster (after uploaded docker image and configured Kubernetes so that a cluster is running)
├── upload_docker.sh                      ### Uploads built image to docker to make it accessible to a Kubernets cluster
```