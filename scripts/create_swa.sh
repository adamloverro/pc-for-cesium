#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Construct the path to the file to be sourced
SOURCE_FILE="$SCRIPT_DIR/../.env/deploy.env"

# Check if the file exists before sourcing
if [ -f "$SOURCE_FILE" ]; then
  # Source the file
  source "$SOURCE_FILE"
else
  echo "Error: File not found: $SOURCE_FILE"
  exit 1
fi


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

## TODO:
# Add logging to the script
# Add error handling to the script
# Print the values of the variables used in the script
# Capture the output of the Azure CLI commands and print them
# Extract the URL of the Static Web App from the output and print it