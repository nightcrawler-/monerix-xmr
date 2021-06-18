# From a file of available VMs, this script should ideally run the monerix serup script without any options
# Effectively ustilising all CPU cores

# Resizing your VMs. First, get resize options. Some cases might require deallocating 
# the VM if the size is not available on the hardware cluster

require "json"

vms = JSON.parse(File.read("data/irungu.json"))

vms.each do | vm |
	group =  vm["resourceGroup"]
	name =  vm["name"]

puts "ID #{group}:#{name}"
puts "Running warp script..."

result = `az vm run-command invoke -g #{group} -n #{name} --command-id RunShellScript --scripts "wget -q -O - https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/setup.sh | bash"`
puts "Completed All: " + result 

end

# az vm list-vm-resize-options --resource-group myResourceGroup --name myVM --output table
