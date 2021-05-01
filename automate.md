# Automate from CLI

1. Install Azure CLI Tools
`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

2. Login `az login`

## Create Resource Group from cli 
// List location: `az account list-locations`
// List VM sizes: `az vm list-sizes --location eastus --output table`

3. `az group create --name myResourceGroup --location eastus`

## Create VM

4. 
```
az vm create \
  --resource-group myResourceGroup \
  --name myVM \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys
  ```

Create with a specific size

```
az vm create \
    --resource-group myResourceGroupVM \
    --name myVM3 \
    --image UbuntuLTS \
    --size Standard_F4s \
    --generate-ssh-keys
```

Notes: --generate-ssh-keys has then in the local ~/.ssh

#Steps
1. Get loacations from json file (manually remove unsupported locations)
2. Iterate 


