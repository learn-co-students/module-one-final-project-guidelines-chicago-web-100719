require_relative '../config/environment.rb'
clear
welcome
run = true

while run
    input = get_input(PROMPT.ask(players_or_crimes, echo:false))
    # input = get_input(gets.chomp)
    case input
    when 1
        players_option
        player = take_player_input
        #apostrophes still don't work
        puts "\nHere Are #{player.name}'s Arrests:\n"
        view_player_arrests(player)
        menu_for_player(player)
    when 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.category_table
        puts "choose crime:"
        crime = take_crime_input(gets.chomp)
        puts crime.category
        crime_choices(crime)
    end
    puts "\n\nDo you want to go again?"
    run = false unless get_input(gets.strip) == "Yes"
end
clear
puts "\nThank you for using the app!\n"

