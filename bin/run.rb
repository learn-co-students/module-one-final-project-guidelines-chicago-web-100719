require_relative '../config/environment.rb'
welcome
run = true
while run
    players_or_crimes
    input = get_input(gets.chomp)
    if input == 1
        puts "Bears and Falcons players guilty of committing crimes:\n\n"
        puts Player.all.map{|p| p.name}
        #substitute Player.names later
    elsif input == 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.crime_types
    end
end


