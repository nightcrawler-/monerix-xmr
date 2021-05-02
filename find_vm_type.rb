# Find regions with x VM size

require "json"

REQ_VM = "Standard_H16_Promo"

data = JSON.parse(File.read("data/vms_per_region.json"))


data.each do |result| 
   

   result["data"].each do |opt|

   	if(opt["name"].downcase.include? REQ_VM.downcase) 
   		puts "#{result["name"]}"
   		#puts "Found a match for #{REQ_VM}"
   	end

   end


end
