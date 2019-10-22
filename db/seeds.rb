equipment_hash = JSON.parse(RestClient.get('https://wger.de/api/v2/equipment'))
equipment_names = equipment_hash["results"].collect { |result| result["name"] }
equipment_names.each { |name| Equipment.create(name: name) }

muscle_group_hash = JSON.parse(RestClient.get('https://wger.de/api/v2/exercisecategory'))
muscle_group_names = muscle_group_hash["results"].collect { |result| result["name"] }
muscle_group_names.each { |name| MuscleGroup.create(name: name) }


