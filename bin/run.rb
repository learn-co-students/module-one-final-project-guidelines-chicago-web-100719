require_relative '../config/environment.rb'
require 'pry'
require 'tty-prompt'
puts HEADER
welcome
run = true

while run
    new_input = PROMPT.ask(players_or_crimes, echo:false)
    input = get_input(new_input)
    # input = get_input(gets.chomp)
    case input
    when 1
        players_option
        player = Player.find_by_name(get_input(gets.chomp))
        #apostrophes still don't work
        puts "\nHere Are #{player.name}'s Arrests:"
        view_player_arrests(player)
        menu_for_player(player)
    when 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.category_table
        puts "choose crime:"
        crime = get_input(gets.chomp)
        crime_instance = Crime.all.find { |c| c.category.downcase.titleize == crime }
        puts "(w)ho dun it?"
        puts "(d)ay most likely to happen..."
        choice = get_input(gets.chomp)
        case choice
        when 'W'
            crime_instance.who_dun_it
        when 'D'
            crime_instance.occurs_most_often_on_day
        end
    end
puts "do you want to go again?"
ans = get_input(gets.chomp)
if ans == "No" || ans == "N"
    sign_off_message
    run = false
elsif ans == "Yes" || ans == "Y"
    run = true
end
end

