# Create barebones VMs in regions provided from a file,
# the VM type can be hardcoded or provided as an argument,
# as with the names and regions file

puts "Regions: #{ARGV[0]} Machine Type: #{ARGV[1]}"

require "json"

# Definitions should come before invocations

def create_resource_group(location, prefix, index)
  name = prefix + "_" + index.to_s
  puts "resource group name: #{name}"
  puts "location: #{location}"

  # Shell command to create resource
  puts "Running command: az group create --name #{name} --location #{location}"

  # Run the command
  result = `az group create --name #{name} --location #{location}`
  puts "Completed: " + result
  # Create VM after resource group, easy peasy
  create_vm(name, prefix, index)
end

# prefix = azure default (use others for id)
def create_vm(resource_group, prefix, index)
  name = prefix + "" + index.to_s

  puts "Running command: az vm create \
  --resource-group #{resource_group} \
  --name #{name} \
  --image UbuntuLTS \
  --size #{ARGV[1]} \
  --generate-ssh-keys"

  # Run the command TODO: (uncomment)
  result = `az vm create \
  --resource-group #{resource_group} \
  --name #{name} \
  --image UbuntuLTS \
  --size #{ARGV[1]} \
  --generate-ssh-keys`

  puts "Completed: " + result
end

def list_locations
  raw = JSON.parse(File.read("data/locations-h8.json"))
  clean = ""

  raw.each do |val|
    clean += "#{val["name"]}\n"
  end

  return clean
end

def list_machine_types
  "Standard_H8_Promo\nStandard_F8s_v2"
end

if ARGV[0].nil?
  puts "Please provide a json file with the regions"
  return
end

if ARGV[1].nil?
  puts "Please provide a machine type as the second argument\n\n#{list_machine_types}"
  return
end

JSON.parse(File.read(ARGV[0])).each_with_index do |location, index|
  puts "Creating VM: #{location["name"]}: #{("#{`hostname`}".gsub! "\n", "") + index.to_s}"
  create_resource_group(location["name"], ("#{`hostname`}".gsub! "\n", ""), index)
end
# create_resource_group(location["name"], ("#{`hostname`}".gsub! "\n", ""), index)
