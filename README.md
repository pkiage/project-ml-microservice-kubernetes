[![pkiage](https://circleci.com/gh/pkiage/project-ml-microservice-kubernetes.svg?style=svg)](https://app.circleci.com/pipelines/github/pkiage/project-ml-microservice-kubernetes)

# Udacity - Cloud DevOps Engineering - Project 4: Operationalize Machine Learning Microservice API

## A. Project Summary

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## B. [Optional] Setup to Run from Cloud9 or Remote VS Code

Helps with environment standardization that simplifies installation and configuration. (CC7-L2-C6)

### Cloud9
#### 1. AWS > Cloud9 > Create New Environment

- Name: name (e.g. udacityProject4)
- Environment type: Create a new instance for environment (EC2)
- Instance type: m5.large (8GiB RAM + 2 vCPU)
- Platform: Amazon Linux 2

#### 2. Create SSH Key Locally (in Cloud9)

Needed only first time in new AWS Cloud9 environment

```shell
ssh-keygen -t rsa
cat path_public_key_saved_to
```

#### 3. Copy the Public SSH Key and Add it to Github

Github > Settings > SSH and GPG keys > New SSH key

- Title: udacityProject4
- Key: public ssh key

#### 4. Clone Repository via SSH (in Cloud9)

```shell
git clone git@github.com:pkiage/project-ml-microservice-kubernetes.git
```

## B. Running The Python Scripts & Web App

### 1. Clone the Repository

```shell
git clone https://github.com/pkiage/project-ml-microservice-kubernetes.git
```

Go to repository root folder

```shell
cd project-ml-microservice-kubernetes
```

### 2. Create and Activate Environment

```shell
mkdir /tmp/local_environments
python3 -m venv /tmp/local_environments/.devops
source /tmp/local_environments/.devops/bin/activate
```

#### Install Dependencies

```shell
make install
```

#### Confirm Requirementes Installed

```shell
docker --version
```

### 3. Run Lint Check

```shell
make lint
```

### 4. [Optional] Run App Locally (standalone)

```shell
python3 app.py
```

### 4. Run a Container & Make a Prediction

#### Run and Build a Docker Image

```shell
./run_docker.sh
```

#### Make a Prediction

```shell
./make_prediction.sh
```

### 5. Upload the Docker Image

```shell
./upload_docker.sh
```

### 6. Configure Kubernetes to Run Locally

```shell
minikube start
```

#### Verify

```shell
kubectl config view
```

### 7. Deploy with Kubernetes and Save Output Logs

#### Deploy Application on the Kubernetes Cluster

```shell
./run_kubernetes.sh
```

#### Make a Prediction

```shell
./make_prediction.sh
```

## C. Files In The Repository
```folder-structure
├── .circleci               
│   └── config.yml                        ### CircleCI configuration file
├── model_data  
|   ├── boston_housing_prediction.joblib  ### Presisted Python object to be loaded in app.py (pre-trained model)
|   └── housing.csv                       ### Data used in pre-trained model                      
├── output_txt_files 
|   ├── docker_out.txt                    ### Log statements from app.py following executing run_docker.sh
|   └── kubernetes_out.txt                ### Log statements after running a prediction via Kubernetes deployment
├── .gitignore                            ### Files and directories to ignore from git history
├── app.py                                ### Python flask app that serves out predictions (inference) about housing prices through API calls
├── Dockerfile                            ### Contains all commands a user could call on command line to assemble an image
├── make_predictions.sh                   ### Sends some input into containerized application via appropriate port
├── requirements.txt                      ### List of Python dependencies for the project
├── rubric.png                            ### Udacity Project 4 Rubric
├── run_docker.sh                         ### Enables getting Docker running, locally
├── run_kubernetes.sh                     ### Deploys application on the Kubernetes cluster (after uploaded docker image and configured Kubernetes so that a cluster is running)
├── upload_docker.sh                      ### Uploads built image to docker to make it accessible to a Kubernets cluster
```