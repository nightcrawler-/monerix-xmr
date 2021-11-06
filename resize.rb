# frozen_string_literal: true

# Resizing your VMs. First, get resize options. Some cases might require deallocating
# the VM if the size is not available on the hardware cluster

require 'json'

vms = JSON.parse(File.read('data/vms_x.json'))

vms.each do |vm|
  group = vm['resourceGroup']
  name = vm['name']

  # Check options
  puts "ID #{group}:#{name}"
  result = `az vm list-vm-resize-options --resource-group #{group} --name #{name}`

  puts result
end

# az vm list-vm-resize-options --resource-group myResourceGroup --name myVM --output table
