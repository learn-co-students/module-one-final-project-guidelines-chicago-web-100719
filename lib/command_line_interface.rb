
require 'pry'
PROMPT = TTY::Prompt.new
HEADER = (TTY::Box.frame "BAD BOYS OF THE NFL").red
CLEAR = puts "\e[H\e[2J"

 def header
"         ____             __   __                              ____   __  __            _   __________ 
        / __ )____  ____ / /  / /_  ____  __  _______   _____ / __/  / /_/ /_  ___     / | / / ____/ / 
       / /_/ / __ |/ __   /  / __ // __ // / / / ___/  / __  / /_   / __/ __ // _ |   /  |/ / /_  / /  
      / /_/ / /_/ | /_/  /  / /_/ / /_/ / /_/ (__  )  / /_/ / __/  / /_/ / / /  __/  / /|  / __/ / /___
     /_____/|__/|_||__,_/  /_.___/|____/|__, /____/  /_____/_/    |___/_/ /_/|___/  /_/ |_/_/   /_____/
                                       /____/                                                         ".red
end

def clear #Clears the terminal
    puts "\e[H\e[2J"
    puts HEADER
end

def welcome #Displays Welcome message
    puts "\nWelcome to...\n\n"
    puts header
end

def get_input(input) #Run all user input through here
    if input.to_i == 0
        input = input.downcase.titleize
    else 
        input = input.to_i
    end
    clear
    input
end

def players_or_crimes   #Initial player/crime menu
    puts TTY::Box.frame "   Enter 1 to go to PLAYER MENU   |   Enter 2 to go to CRIME MENU   "
end

def sign_off_message        #Displayed when user exits program
    puts "\nThanks for using..."
    puts header
end

###PLAYER METHODS###

def find_player(player)
    Player.find_by(name: player)
end

def display_name_table   #Displayed when user selects 'players'
    puts "\nNFL players guilty of committing crimes:\n"
    puts Player.name_table
    puts "\nEnter a player name to view arrests:\n"
end

def menu_for_player(player)     #Options for each player
    if player.arrests.count == 0
        options_array = ["Snitch", "New Dad"]
    else
        options_array = ["Pardon", "Snitch", "New Dad", "Google it"]
    end
    #select menu:
    option = PROMPT.select("\nPlease select an option from the menu:") do |menu|
        options_array.each do |i|
            menu.choice i
        end
    end
    player_choices(option, player)
end

def player_choices(input, player)
    case input
    when "Pardon"
        clear
        player.pardon
        puts "\n#{player.name}'s arrests have been updated.\n"
        if player.arrests.count < 1
            puts "\n#{player.name} has been absolved of all his crimes.\n"
            player.delete
        else 
            puts "\n#{player.name} has been pardoned for his most recent crime.\n"
        end
    when "Snitch"
        clear
        snitch_on_player(player)
    when "New Dad"
        clear
        player.new_dad
        puts "\nCongratulations on procreating, #{player.name}!\n\n"
    when "Google it"
        clear
        googler(player, input)
    end
end

def view_player_arrests(player)  #Formats and displays player arrests
    n = 1
    if player.arrests.count < 1
        puts "#{player.name} has no current arrests."
    else
        puts "\nHere Are #{player.name}'s Arrests:\n"
        player.arrests.each do |arr|
            puts "#{n}.Arrested for #{arr.crime.category} on #{arr.date}\n"
            n += 1
        end
    end
    player.arrests
end

def snitch_on_player(player)    #Format and display Player#snitch
    puts report = "     🚨 Report a crime for #{player.name}! 🚨\n\n\n".blue
    puts "On which day of the week did this crime occur?\n"
    day_of_week = get_input(gets.chomp)
    puts report
    puts "What was the date of the crime? (YYYY-MM-DD)\n"
    date = gets.chomp
    clear
    puts report
    puts "How would you categorize this crime?\n"
    crime = get_input(gets.chomp)
    puts report
    puts "Provide a brief description of the crime:\n"
    description = gets.chomp
    clear
    player.snitch(day_of_week, date, description, crime)
    puts "Thank you for reporting #{player.name} for #{crime.downcase}! We take all reports very seriously.\nThis will be added to our database\n\n"
end

def googler(player, input)  #Google user arrest by selection menu
    clear
    arrest = PROMPT.select("\nPlease select one of #{player.name}'s crimes to Google!") do |menu|
        menu.enum '.'
        player.arrests.each do |arr|
            menu.choice "Arrested for #{arr.crime.category} on #{arr.date}\n", arr
        end

    end
    arrest.google_it
end

###CRIME OPTIONS###

def take_crime_input(arg)

    crime = Crime.all.find { |c| c.category.downcase.titleize == get_input(arg) }
    if crime
        return crime
    else 
        clear
        puts Crime.category_table
        puts "Not on the list. Try again:\n".yellow
        take_crime_input(gets.chomp)
    end
end

def display_crime_table
    puts "Crime categories included in the Bad Boys of the NFL database:\n\n"
    puts Crime.category_table
end

def crime_choices(crime_instance)
    # menu_for_crime
    line = "---------------------"
    choice = PROMPT.select("Please select one of the following:") do |menu|
        menu.choice "Who Dun It?"
        menu.choice "Day Most Likely To Happen..."
    end
    case choice
     when 'Who Dun It?'
        clear
        puts crime_instance.category
        puts "\nWho Dun It?\n"
        puts line
        crime_instance.who_dun_it
     when 'Day Most Likely To Happen...'
        clear
        puts crime_instance.category
        puts "\nDay Most Likely to Happen...\n"
        puts line
        arrests2 = crime_instance.arrests.map { |a| a.day_of_week }
        puts arrests2.max_by { |a| arrests2.count(a) }
        puts "\n"
    end
end


# def most_common_crimes #Formats and displays Crime#most_common_crime_by_day
#     puts "\nPlease enter a day of the week:\n"
#     day = get_input(gets.chomp)
#     puts "\nMost common crimes for #{day}:\n"
#     puts Crime.most_common_crimes_by_day(day)
# end

# def which_day_of_the_week   #Formats and displays Crime#occurs_most_often_on_day
#     puts "\nPlease enter a category of crime: \n"
#     crime_type = Crime.find_by(category: get_input(gets.chomp))
#     puts "\nMost NFL players seem to commit #{crime_type.category} crimes on #{crime_type.occurs_most_often_on_day}."
# end






