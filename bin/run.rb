require_relative '../config/environment.rb'
welcome
run = true

while run
    players_or_crimes
    input = get_input(gets.chomp)
    case input
    when 1
        players_option
        player = find_player(get_input(gets.chomp))
        #put player table into players_option
        view_player_arrests(player)
        menu_for_player
        select = get_input(gets.chomp)
        case select
        when "P" || "Pardon"
            player.pardon
            view_player_arrests(player)
        end
    when 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.category_table
        puts "choose crime:"
        crime = get_input(gets.chomp)
        # crime_instance = Crime.find_by(category: crime)
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
run = false unless get_input(gets.strip) == 'Yes'
end

