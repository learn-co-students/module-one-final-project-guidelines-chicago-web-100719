require_relative '../config/environment.rb'
clear
# puts HEADER
welcome
run = true

while run
    input = get_input(PROMPT.ask(players_or_crimes, echo:true))
    case input
    when 1
        players_option
        # need to change players_option to take out the '2' press option since we're checking for players on the list
        player = take_player_input
        puts "\nHere Are #{player.name}'s Arrests:"
        view_player_arrests(player)
        menu_for_player(player)
    when 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.category_table
        puts "choose crime:"
        crime = take_crime_input(gets.chomp)
        puts crime.category
        crime_choices(crime)
    else
        puts "Wrong input. Must be 1 or 2. Now you have to start over.".yellow
    end
    puts "Enter 'Yes' or 'Y' to go again..."
    puts "Enter anyting else to exit"
    ans = get_input(gets.chomp)
if ans == "Yes" || ans == "Y"
    run = true
else 
    sign_off_message
    run = false
end
end

