require_relative '../config/environment.rb'
require 'pry'
require 'tty-prompt'
clear
puts HEADER
welcome
run = true

while run
    input = get_input(PROMPT.ask(players_or_crimes, echo:false))
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
    end
    puts "do you want to go again"
    ans = get_input(gets.chomp)
if ans == "No" || ans == "N"
    sign_off_message
    run = false
elsif ans == "Yes" || ans == "Y"
    run = true
end
end
CLEAR

