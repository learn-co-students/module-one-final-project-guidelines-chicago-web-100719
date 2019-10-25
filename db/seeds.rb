require_relative '../config/environment.rb'

seed_array = JSON.parse(RestClient.get('http://nflarrest.com/api/v1/team/arrests/CHI')) + JSON.parse(RestClient.get('http://nflarrest.com/api/v1/team/arrests/ATL')) + JSON.parse(RestClient.get('http://nflarrest.com/api/v1/team/arrests/SEA'))

seed_array.each do |arrest|
    Arrest.create({
        day_of_week: arrest['Day_of_Week'],
        date: arrest['Date'],
        description: arrest['Description'],
        crime_id: Crime.find_or_create_by(category: arrest['Category']).id,
        player_id: Player.find_or_create_by(name: arrest['Name'].gsub("'", " ").downcase.titleize, position: arrest['Position_name']).id
    })
end
