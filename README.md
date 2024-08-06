# Overview
A simple golang web app is provided, I will be deoloying the app using best devops practices which will include:
- Containerization (Multi Stage Docker Build) 
- Creating Kubernetes Manifests 
- Continuous Integration using GitHub Actions 
- Continuous Delivery using Argo CD 
- Kubernetes Cluster creation and setup 
- Helm chart creation and configuration for multiple environments 
- Ingress controller creation, configuration to expose application 
- DNS mapping for our domain - End to End CI/CD demonstration

---

## Running The Go App Locally

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/courses` in your web browser.

## Looks like this

![Website](static/images/golang-website.png)

---

__Steps that will be involved in completing the project:__

    - Containerize the application
    - Create Kubernetes manifest - Deployments,  Service, Ingress
    - Implement continous integration - Github Actions
    - Implement continous delivery - GitOps (AgroCD)
    - Kubernetes Cluster (EKS Cluster)
    - Setup a helm chart for the application
    - Ingress Controller (to create a load balancer)
    - Map load balancer to DNS

___Containerization: Docker___
- Create a [dockerfile](./Dockerfile) for containerizing the go app
- Build an image using the dockerfile
- Run it and push it to docker hub

    ![screenshot](dockerfile image)
    ![screenshot](build command)
    ![screenshot](run command)
    ![screenshot](running app)

___Kubernetes___
- Write the kubernetes configurations for:
    [Deployment](./kubernetes/deployment.yaml)
    [Service](./kubernetes/service.yaml)
    [Ingress](./kubernetes/ingress.yaml)
- Setup a kubernetes cluster (use any cluster of choice)
- Apply app the deployment, service and ingress to cluster
- Meanwhile, we cannot access the ingress (it will not have an ip address even tho it has been created), we need an ingress controller
- Install nginx Ingress controller (it is advisable to install the controller first)

___Helm chart___
- Create a chart using `helm create <chart-name>`
- Copy manifests files to templates directory
- Helm core are values. templates and charts


___CI/CD___
Github Actions will be used for continous integration. The following stages will be created:
- Build & Test
- Static code analysis
- Docker image & push to dockerhub
- Update Helm (can also update manifest file here)
- 
GitOps - AgroCD will be used for continous deployment.
- Watch the helm chart
- If there is an update to values.yaml file, it pulls the helm chart and installs it on the kubernetes cluster
- 
CI integrates updates on your app into your builds, tests it and updates the images, helm chart and/or manifest files. But it does not end there, you need CD to deploy your changes to your cluster, or a production environment.


