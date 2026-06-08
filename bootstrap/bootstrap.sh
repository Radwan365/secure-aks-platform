#!/bin/bash
set -e

RESOURCE_GROUP_NAME=terraform-state-rg
tf_SA_ACCOUNT=tfstateradwan2026
LOCATION=eastus

# Create Resource Group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
# Create Storage Accounts
az storage account create --name $tf_SA_ACCOUNT --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS
# Create Storage Container
az storage container create --name dev --account-name $tf_SA_ACCOUNT
az storage container create --name staging --account-name $tf_SA_ACCOUNT
az storage container create --name prod --account-name $tf_SA_ACCOUNT
