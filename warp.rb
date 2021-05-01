# Load locations JSON file (should be in the root directory with this script)
require "json"
require "shellwords" # Not very necessary

max_vms = 1

# Definitions should come before invocations

def create_resource_group(location, prefix, index)
  name = prefix + "_" + index.to_s
  puts "resource group name: #{name}"
  puts "location: #{location}"

  # Shell command to create resource
  puts "Running command: az group create --name #{name} --location #{location}"

  # Run the command
  `az group create --name #{name} --location #{location}`

  # Create VM after resource group, easy peasy
  create_vm(name, "azure", index)
end

# prefix = azure default (use others for id)
def create_vm(resource_group, prefix, index)
  name = prefix + "_" + index.to_s

  puts "Running command: az vm create \
  --resource-group #{resource_group} \
  --name #{name} \
  --image UbuntuLTS \
  --size Standard_F8s_v2 \
  --generate-ssh-keys"

  # Run the command TODO: (uncomment)
  `az vm create \
  --resource-group #{resource_group} \
  --name #{name} \
  --image UbuntuLTS \
  --size Standard_F8s_v2 \
  --generate-ssh-keys`

  # Run script after
  run_warp(resource_group, name)
end

def run_warp(resource_group, vm_name)
  puts "Running warp script..."
  `az vm run-command invoke -g #{resource_group} -n #{vm_name} --command-id RunShellScript --scripts "wget -O - https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/warp-unlimited.sh | bash"`
end

(1..max_vms).each do |index|
  # Edit locations.json with all valid locations only
  locations_hash = JSON.parse(File.read("data/locations.json"))

  create_resource_group(locations_hash[index]["name"], "rg_azure", index)
end

# Scraps
# Ask user to input number X of VMs to create
# Create Resource groups equal to the number, X, use repeatable naming scheme, in X locations
# Create VMs for X resource groups
# Done?
# Run script on X vms (repeatable naming scheme)
