require 'pry'

def welcome
    puts "Welcome to the Official NFL Player Arrest App!\n\n"
end

def menu
    ["OPTIONS MENU:","1. List players", "2. View a player's arrests", "3. Pardon a player for a crime", "4. List crime categories", "5. Most common crimes by day", "6. List types of crimes", "7. Find out on which day of the week a given crime is most likely to occur","* Enter q/quit to exit the program at any time"]

end

def get_input(input)
    if input.to_i == 0
        input = input.downcase.titleize
    else input = input.to_i
    end
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

def view_player_arrests
    n = 0
        puts "Which player's arrests would you like to view?"
        player = Player.find_by(name: get_input(gets.chomp))
        #J'Marcus Webb doesn't work
        puts "\nHere Are #{player.name}'s Arrests:"
        # puts "(Enter the arrest no. at any time to Google it. Otherwise, hit 'c' to continue!)\n\n"
        player.arrests.each do |i|
            n+=1
            puts "#{n}.Arrested for #{i.crime.category} on #{i.date}"
        end
        menu = true
        input = gets.chomp
        while menu
            player.arrests.each_with_index do |player, index|
                if input == index + 1
                     player.arrests[index].google_it
                end
            end
            if input == "esc"
                break
            end
        end

    end

    def players_or_crimes
        puts table = "----------------------------------------------------"
        puts "|  Enter '1' for Players  |  Enter '2' for Crimes  |"
        puts table
    end

    def players_option
        puts "Bears and Falcons players guilty of committing crimes:\n\n"
        puts 
        #substitute Player.names later
        puts "Enter a player name to view arrests:"
    end 