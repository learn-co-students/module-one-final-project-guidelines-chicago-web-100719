
require 'pry'

def welcome
    puts "Welcome to the Official NFL Player Arrest App!\n\n"
end

def get_input(input)
    if input.to_i == 0
        input = input.downcase.titleize
    else input = input.to_i
    end
end

def find_player(player)
    Player.find_by(name: player)
end

def most_common_crimes
    puts "Please enter a day of the week:"
    day = get_input(gets.chomp)
    puts "\nMost common crimes for #{day}:\n"
    puts Crime.most_common_crimes_by_day(day)
end

def which_day_of_the_week
    puts "Please enter a category of crime: "
    crime_type = Crime.find_by(category: get_input(gets.chomp))
    puts "\nMost NFL players seem to commit #{crime_type.category} crimes on #{crime_type.occurs_most_often_on_day}."
end

def view_player_arrests(player)
    n = 1
        #J'Marcus Webb doesn't work
        puts "\nHere Are #{player.name}'s Arrests:"
        player.arrests.each do |arr|
            puts "#{n}.Arrested for #{arr.crime.category} on #{arr.date}"
            n += 1
        end
        player.arrests
end

    def players_or_crimes
        puts table = "----------------------------------------------------"
        puts "|  Enter '1' for Players  |  Enter '2' for Crimes  |"
        puts table
    end

    def players_option
        puts "Bears and Falcons players guilty of committing crimes:\n\n"
        puts Player.name_table
        puts "Enter a player name to view arrests:"
    end

    def menu_for_player
        puts "Please select one of the following or enter the arrest number to Google the crime:"
        puts ["(P)ardon", "(S)nitch", "(N)ew Dad"]
    end

    def get_player_arrest_by_input(player_arrests, input)
        player_arrests[input-1]
    end

    def googler(player, input)
        player.arrests[input-1].google_it
    end

    def sign_off_message
        puts "Thanks for using the NFL Crime App! Goodbye!"
    end

        def snitch_on_player(player)
            puts "Report a crime for #{player.name}!"
            puts "On which day of the week did this crime occur?"
            day_of_week = get_input(gets.chomp)
            puts "What was the date of the crime? (YYYY-MM-DD)"
            date = gets.chomp
            puts "How would you categorize this crime?"
            crime = get_input(gets.chomp)
            puts "Provide a brief description of the crime:"
            description = gets.chomp
            player.snitch(day_of_week, date, description, crime)
            puts "Thank you for reporting this crime! We'll add it to our database\n\n"
        end



