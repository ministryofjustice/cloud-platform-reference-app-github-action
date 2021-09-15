# Continuous Deployment of an application using Github Actions

Continuous Deployment of an application using [Github Actions](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/deploying-an-app/github-actions-continuous-deployment.html#continuous-deployment-of-an-application-using-github-actions)

## Table of contents

   * [Building, tagging and pushing to ECR](#building,-tagging-and-pushing-to-ECR)
   * [Authenticate and deploy applications](#authenticate-and-deploy-applications)

### Prerequisites

* A cloud platform [namespace](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/env-create.html#creating-a-cloud-platform-environment)
* An [ECR](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/ecr-setup.html#creating-an-ecr-repository) in your namespace, to store your docker images
* A [serviceaccount](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/cloud-platform-cli.html#add-a-service-account-to-your-namespace) in your namespace

## Building, tagging and pushing to ECR

1) Build your Docker image using the following command.

```docker build -t cloud-platform/github-action-reference-app .```

2) After the build completes, tag your image so you can push the image to this repository:

```docker tag cloud-platform/github-action-reference-app:latest 754256621582.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/github-action-reference-app:latest```

3) Run the following command to push this image to your newly created AWS repository:

```docker push 754256621582.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/github-action-reference-app:latest```

## Authenticate and deploy applications

### Authenticate using service account

The serviceaccount has permissions to deploy to your namespace, so we will use its ca.crt and token in the pipeline. Guidence on Using your serviceaccount to authenticate to the cluster [here](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/deploying-an-app/github-actions-continuous-deployment.html#using-your-serviceaccount)

### Deploy applications

There are several ways to deploy applications onto the MoJ Cloud Platform, the below will show the - [helm](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/deploying-an-app/app-deploy-helm.html#deploying-an-application-to-the-cloud-platform-with-helm).

```
helm install github-action-reference-app . \
--values values.yaml \
--namespace <namespace-name> 
```
