# frozen_string_literal: true

# Creates Resource Group, an associated VM and runs the monerix setup script. You need to change the values for
# The regions file, max_vms and the range (line 55, or therebouts) to set the number of VMs to create.
# locations-lean file comtains regions that have successfully created the 8Core VMs for. Locations pending
# Needs cleanup, 5 of those locations don't support deploymemts, at least.

require 'json'

max_vms = 16

# Definitions should come before invocations

def create_resource_group(location, prefix, index)
  name = "#{prefix}_#{index}"
  puts "resource group name: #{name}"
  puts "location: #{location}"

  # Shell command to create resource
  puts "Running command: az group create --name #{name} --location #{location}"

  # Run the command
  result = `az group create --name #{name} --location #{location}`
  puts "Completed: #{result}"
  # Create VM after resource group, easy peasy
  create_vm(name, 'z_f_eight', index)
end

# prefix = azure default (use others for id)
def create_vm(resource_group, prefix, index)
  name = "#{prefix}#{index}"

  puts "Running command: az vm create \
  --resource-group #{resource_group} \
  --name #{name} \
  --image UbuntuLTS \
  --size Standard_F8s_v2 \
  --generate-ssh-keys"

  # Run the command TODO: (uncomment)
  result = `az vm create \
  --resource-group #{resource_group} \
  --name #{name} \
  --image UbuntuLTS \
  --size Standard_F8s_v2 \
  --generate-ssh-keys`

  puts "Completed: #{result}"
  # Run script after
  run_warp(resource_group, name)
end

def run_warp(resource_group, vm_name)
  puts 'Running warp script...'

  result = `az vm run-command invoke -g #{resource_group} -n #{vm_name} --command-id RunShellScript --scripts "wget -q -O - https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/setup.sh | bash"`
  puts "Completed All: #{result}"
end

(1..max_vms).each do |index|
  # Edit locations.json with all valid locations only
  locations_hash = JSON.parse(File.read('data/locations-f8.json'))

  # Thread.new { puts index }
  # -1 because 0 based, don't skip the first
  # try catch this?
  create_resource_group(locations_hash[index - 1]['name'], 'z_f_eight', index)
end

# Scraps
# Ask user to input number X of VMs to create
# Create Resource groups equal to the number, X, use repeatable naming scheme, in X locations
# Create VMs for X resource groups
# Done?
# Run script on X vms (repeatable naming scheme)
# Find location of an executable, linux:
# get PID - htop, other tool
# pwdx <pid>
