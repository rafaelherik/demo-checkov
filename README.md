# demo-checkov
Applying policies to the infrastructure code using Checkov and Terraform


## Starting with Terraform and Azure

### Creating the backend infrastructure

- Creating the resource group

```bash
$ az group create --name az-weu-checkov-demo-rg --location westeurope

{
  "id": "/subscriptions/5bf630ed-fa43-46b5-94b2-a0fdf571e2bc/resourceGroups/az-weu-checkov-demo-rg",
  "location": "westeurope",
  "managedBy": null,
  "name": "az-weu-checkov-demo-rg",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

- Creating the storage account
```bash
az storage account create --name azweucheckovdemost --resource-group az-weu-checkov-demo-rg --location eastus --sku Standard_LRS
```
- Creating a storage container
```bash
az storage container create --name tfstate --account-name azweucheckovdemost

```