# demo-checkov
Applying policies to the infrastructure code using Checkov and Terraform


## Starting with Terraform and Azure

### Creating the backend infrastructure

- Creating the resource group

```bash
$ az group create --name az-weu-checkov-demo-rg --location westeurope
# Result:
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
$ az storage account create --name azweucheckovdemost --resource-group az-weu-checkov-demo-rg --location eastus --sku Standard_LRS
# Result:
{
  "accessTier": "Hot",
  "accountMigrationInProgress": null,
  "allowBlobPublicAccess": false,
  "allowCrossTenantReplication": false,
  "allowSharedKeyAccess": null,
  "allowedCopyScope": null,
  "azureFilesIdentityBasedAuthentication": null,
  "blobRestoreStatus": null,
  "creationTime": "2024-07-25T17:32:53.181359+00:00",
  "customDomain": null,
  "defaultToOAuthAuthentication": null,
  "dnsEndpointType": null,
  "enableHttpsTrafficOnly": true,
  "enableNfsV3": null,
  "encryption": {
    "encryptionIdentity": null,
    "keySource": "Microsoft.Storage",
    "keyVaultProperties": null,
    "requireInfrastructureEncryption": null,
    "services": {
      "blob": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2024-07-25T17:32:53.696983+00:00"
      },
      "file": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2024-07-25T17:32:53.696983+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "extendedLocation": null,
  "failoverInProgress": null,
  "geoReplicationStats": null,
  "id": "/subscriptions/5bf630ed-fa43-46b5-94b2-a0fdf571e2bc/resourceGroups/az-weu-checkov-demo-rg/providers/Microsoft.Storage/storageAccounts/azweucheckovdemost",
  "identity": null,
  "immutableStorageWithVersioning": null,
  "isHnsEnabled": null,
  "isLocalUserEnabled": null,
  "isSftpEnabled": null,
  "isSkuConversionBlocked": null,
  "keyCreationTime": {
    "key1": "2024-07-25T17:32:53.306357+00:00",
    "key2": "2024-07-25T17:32:53.306357+00:00"
  },
  "keyPolicy": null,
  "kind": "StorageV2",
  "largeFileSharesState": null,
  "lastGeoFailoverTime": null,
  "location": "eastus",
  "minimumTlsVersion": "TLS1_0",
  "name": "azweucheckovdemost",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "ipv6Rules": [],
    "resourceAccessRules": null,
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://azweucheckovdemost.blob.core.windows.net/",
    "dfs": "https://azweucheckovdemost.dfs.core.windows.net/",
    "file": "https://azweucheckovdemost.file.core.windows.net/",
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://azweucheckovdemost.queue.core.windows.net/",
    "table": "https://azweucheckovdemost.table.core.windows.net/",
    "web": "https://azweucheckovdemost.z13.web.core.windows.net/"
  },
  "primaryLocation": "eastus",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "publicNetworkAccess": null,
  "resourceGroup": "az-weu-checkov-demo-rg",
  "routingPreference": null,
  "sasPolicy": null,
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "name": "Standard_LRS",
    "tier": "Standard"
  },
  "statusOfPrimary": "available",
  "statusOfSecondary": null,
  "storageAccountSkuConversionStatus": null,
  "tags": {},
  "type": "Microsoft.Storage/storageAccounts"
}

```
- Creating a storage container
```bash
az storage container create --name tfstate --account-name azweucheckovdemost
# Result:
There are no credentials provided in your command and environment, we will query for account key for your storage account.
It is recommended to provide --connection-string, --account-key or --sas-token in your command as credentials.

You also can add `--auth-mode login` in your command to use Azure Active Directory (Azure AD) for authorization if your login account is assigned required RBAC roles.
For more information about RBAC roles in storage, visit https://docs.microsoft.com/azure/storage/common/storage-auth-aad-rbac-cli.

In addition, setting the corresponding environment variables can avoid inputting credentials in your command. Please use --help to get more information about environment variable usage.
{
  "created": true
}
```