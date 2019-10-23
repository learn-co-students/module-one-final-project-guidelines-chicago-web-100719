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
        view_player_arrests(player)
        menu_for_player
        select = get_input(gets.chomp)
        case select
        when "P" || "Pardon"
            updated_player = player.pardon
            view_player_arrests(updated_player)
        end



    when 2
        puts "Crime categories included in the NFL crime database:\n\n"
        puts Crime.crime_types
    end
    puts "do you want to go again"
    run = false unless get_input(gets.strip) == "Yes"
end




