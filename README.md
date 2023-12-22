# Azure Web App with CI/CD pipeline

Python app serving static HTML deployed on Azure using Azure Web Apps. A CI/CD pipeline has been implemented by utilizing GitHub Actions Workflows. 

The pipeline enables us to automatically build, package and deploy new versions of the app to our Azure environment on repository pushes.

## Requirements

* x86-64
* Linux/Unix
* [Python 3](https://www.python.org/downloads/)


## Guide

In order to integrate the CI/CD pipeline, one must do the following:
```
1. Provision Azure resources with the 'up' script described below.
2. Nagivate to the the newly created Web App in Azure Portal.
3. Click on "Download publish profile" and copy the file contents.
4. Navigate to the 'Security' section of your GitHub repository settings.
5. Click on 'Actions', which is located under subsection 'Secrets an variables'
6. Update secret 'AZURE_WEBAPP_PUBLISH_PROFILE' with the copied file contents.
```

## Creating resources

The shell script 'up' provisions Azure resources. It has two possible arguments: terraform and bicep.

### 'sh up.sh terraform'
```
1. terraform init
2. terraform plan
3. terraform apply
```

### 'sh up.sh bicep'
```
1. az group create --name hvalfangstresourcegroup --location "North Europe"
2. az bicep build --file main.bicep
3. az deployment group create --resource-group hvalfangstresourcegroup --template-file main.json
```


## Removing resources

The shell script 'down' removes allocated Azure resources.

### 'sh down.sh terraform'
```
terrraform destroy
```


### 'sh down.sh bicep'
```
 az group delete --name hvalfangstresourcegroup --yes --no-wait
```
