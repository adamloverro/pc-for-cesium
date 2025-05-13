source ../.env/deploy.env

## Pre-requisites
# Ensure you have the Azure CLI installed and are logged in to your Azure account.
# You can install the Azure CLI from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
# Log in to your Azure account
az login --use-device-code

## Create a new resource group for the Static Web App
# This script creates a new resource group in Azure for the Static Web App.
# It uses the Azure CLI to create the resource group with the specified name and location.
# Ensure the Azure CLI is installed and you are logged in
# to your Azure account before running this script.
# Set the resource group name and location
az group create \
  --name $MY_RESOURCE_GROUP_NAME \
  --location $REGION

## Create a new Static Web App
# This script creates a new Static Web App in Azure.
# It uses the Azure CLI to create the Static Web App with the specified name and resource group.
# Set the Static Web App name and resource group
  az staticwebapp create \
    --name $MY_STATIC_WEB_APP_NAME \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --location $REGION