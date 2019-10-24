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
    # until player do
    #     puts "not on the list. try again: "
    #     take_player_input
    
    n = 0
    alphabet = [*'A'..'Z']
        #J'Marcus Webb doesn't work
        puts "\nHere Are #{player.name}'s Arrests:"
        player.arrests.each do |arr|
            puts "#{alphabet[n]}.Arrested for #{arr.crime.category} on #{arr.date}"
            n += 1
        end
end

def take_player_input
    player = nil
    until player do
        player = find_player(get_input(gets.chomp))
        puts "not on the list. try again" unless player
    end
    player
end

def take_crime_input(arg)
    # crime = nil

    crime = Crime.all.find { |c| c.category.downcase.titleize == get_input(arg) }
    # unless crime
    if crime
        return crime
    else 
        puts "not on the list\ntry again:"
        take_crime_input(gets.chomp)
    end
end

    def players_or_crimes
        puts table = "----------------------------------------------------"
        puts "|  Enter '1' for Players  |  Enter '2' for Crimes  |"
        puts table
    end

    def players_option
        puts "Bears and Falcons players guilty of committing crimes:\n\n"
        Player.name_table
        # puts Player.all.map{|p| p.name}
        #substitute Player.names later
        puts "Enter a player name to view arrests or press '2' to view all crimes:"
    end

    def menu_for_player
        puts "Please select one of the following:"
        puts ["(P)ardon", "(S)nitch", "(N)ew Dad"]
    end

    def crime_choices(crime_instance)
        menu_for_crime
        choice = get_input(gets.chomp)
        case choice
        when 'W'
            crime_instance.who_dun_it
        when 'D'
            # crime_instance.occurs_most_often_on_day
            arrests2 = crime_instance.arrests.map { |a| a.day_of_week }
            puts "\n"
            puts arrests2.max_by { |a| arrests2.count(a) }
            puts "\n"
        else               
            puts "not an option"
            crime_choices
        end
    end

    def menu_for_crime
        puts "(W)ho dun it?"
        puts "(D)ay most likely to happen..."
    end
    # def find_crime
    #     crime_instance = Crime.all.find { |c| c.category.downcase.titleize == crime }
    # end