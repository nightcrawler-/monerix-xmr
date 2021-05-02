# Return all VM sizes from the regions (35?)

require "json"

locations = JSON.parse(File.read("data/locations-lean.json"))


# All results will be wrapped in a json array
puts "["

locations.each do |loc|

	# Each location(has an array of vm sizes) will be an array object in the parent array
	puts "{\"name\": \"" + "#{loc["name"]}" + "\", \"data\": "
	result = `az vm list-sizes -l #{loc["name"]}` 
	puts result 
	puts "},"
end

puts "]"


# az vm list-sizes -l <region>
