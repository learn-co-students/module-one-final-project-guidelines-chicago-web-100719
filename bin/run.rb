require_relative '../config/environment.rb'
clear
welcome
run = true

while run
    players_or_crimes
    input = get_input(gets.chomp)
    clear
    case input
    when 1
        players_option
        # need to change players_option to take out the '2' press option since we're checking for players on the list
        player = take_player_input
        view_player_arrests(player)
        menu_for_player
        select = get_input(gets.chomp)
        case select
        when "P" || "Pardon"
            updated_player = player.pardon
            view_player_arrests(updated_player)
        end
        # more cases to come 
    when 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.category_table
        puts "choose crime:"
        crime = take_crime_input(gets.chomp)
        clear
        puts crime.category
        crime_choices(crime)
    end
    puts "do you want to go again"
    run = false unless get_input(gets.strip) == "Yes"
end
clear




