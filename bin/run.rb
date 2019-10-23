require_relative '../config/environment'
# puts "HELLO WORLD"

# welcome
# player_crime = get_player_or_crime
# show_list(player_crime)
# player_names = Player.all.collect { |p| p.name }
# player_pairs = player_names.each_slice(3).to_a
# if player_pairs.last.count < 3
#     player_pairs.last << "" until player_pairs.last.count == 3
# end

# table = TTY::Table.new player_pairs
# puts table
# Player.name_table
Crime.category_table