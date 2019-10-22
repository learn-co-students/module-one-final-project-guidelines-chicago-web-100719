# require_relative '../config/environment.rb'

equipment_hash = JSON.parse(RestClient.get('https://wger.de/api/v2/equipment'))
results = equipment_hash["results"]
equipment_names = results.collect {|name| name["name"]}
puts equipment_names
equipment_names.each {|name| Equipment.create(name: name)}

