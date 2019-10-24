
require 'pry'
PROMPT = TTY::Prompt.new
HEADER = (TTY::Box.frame "BAD BOYS OF THE NFL").red

def clear #Clears the terminal
    puts "\e[H\e[2J"
    puts HEADER
end

def welcome #Displays Welcome message
    puts "Welcome to the Official NFL Player Arrest App!\n\n"
end

def get_input(input) #Run all user input through here
    if input.to_i == 0
        input = input.downcase.titleize
    else input = input.to_i
    end
    clear
    input
end


def most_common_crimes #Formats and displays Crime#most_common_crime_by_day
    puts "Please enter a day of the week:"
    day = get_input(gets.chomp)
    puts "\nMost common crimes for #{day}:\n"
     puts Crime.most_common_crimes_by_day(day)
end

def which_day_of_the_week   #Formats and displays Crime#occurs_most_often_on_day
    puts "Please enter a category of crime: "
    crime_type = Crime.find_by(category: get_input(gets.chomp))
    puts "\nMost NFL players seem to commit #{crime_type.category} crimes on #{crime_type.occurs_most_often_on_day}."
end

def view_player_arrests(player)     #Formats and displays player arrests
    n = 1
    # J'Marcus Webb doesn't work
    player.arrests.each do |arr|
        puts "#{n}.Arrested for #{arr.crime.category} on #{arr.date}"
        n += 1
    end
    player.arrests
end

def players_or_crimes   #Initial player/crime menu
    puts table = "----------------------------------------------------"
    puts "|  Enter '1' for Players  |  Enter '2' for Crimes  |"
    puts table
end

def players_option      #Displayed when user selects 'players'
    puts "\nNFL players guilty of committing crimes:\n"
    puts Player.name_table
    puts "\nEnter a player name to view arrests:\n"
end

def menu_for_player(player)     #Options for each player
    puts "\nPlease select one of the following:\n"
    puts ["(P)ardon", "Pardon (A)ll", "(S)nitch", "(N)ew Dad", "(G)oogle it"]
    select = get_input(gets.chomp)
    player_choices(select, player)
end

def googler(player, input)  #Google user arrest by selection menu
    arrest = PROMPT.select("\nPlease select one of #{player.name}'s crimes to Google!\n") do |menu|
        menu.enum '.'
        view_player_arrests(player).each do |arr|
            menu.choice "Arrested for #{arr.crime.category} on #{arr.date}", arr
        end

    end
    arrest.google_it
end

def sign_off_message        #Displayed when user exits program
    puts "\nThanks for using the NFL Crime App! Goodbye!\n"
end

def snitch_on_player(player)    #Format and display Player#snitch
    puts "Report a crime for #{player.name}!"
    puts "On which day of the week did this crime occur?"
    day_of_week = get_input(gets.chomp)
    puts "What was the date of the crime? (YYYY-MM-DD)"
    date = gets.chomp
    clear
    puts "How would you categorize this crime?"
    crime = get_input(gets.chomp)
    puts "Provide a brief description of the crime:"
    description = gets.chomp
    clear
    player.snitch(day_of_week, date, description, crime)
    puts "Thank you for reporting #{player.name} for #{crime}! We'll add it to our database\n\n"
end

def player_choices(input, player)
    case input
    when "P","Pardon"
        player.pardon
        view_player_arrests(player)
        if player.arrests.count < 1
            puts "#{player.name} has been absolved of all his crimes."
        else 
            puts "#{player.name} has been pardoned for his most recent crime."
        end

    when "S","Snitch"
        snitch_on_player(player)
    when "N", "New Dad"
        player.new_dad
        puts "Congratulations on procreating, #{player.name}!"
    when "G", "Google"
        googler(player, input)
    when "A", "Pardon All"
        player.pardon_all
        puts "\n#{player.name} has been absolved of all his crimes!\n"
    end
end



