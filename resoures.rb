# Get resources and availability details/restrictions for all regions in the locations.json file
# Allow params (later)

require 'json'

locations_hash = JSON.parse(File.read('data/locations.json'))

def get_info(loc) 
  `az vm list-skus --location #{loc} --resource-type virtualmachines --output table | tee -a skus.table`
end

locations_hash.each do |loc| 
	get_info(loc['name'])
end
