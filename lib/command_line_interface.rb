def welcome 
    puts "Thinking of hiring an NFL player? See what crimes they've committed!"
    
    
end

def get_player_or_crime
    puts "Type 'player' to see who's been bad..."
    puts "OR type 'crime' to see what they've done"
    
    gets.chomp.downcase
end

def show_list(choice)
    if choice == 'player'
        Player.all.each { |player| puts player.name }
        chosen_player = pick_player
        found_player = Player.find_by_name(chosen_player)
        found_player.crimes_and_frequency
    elsif choice == 'crime'
        Crime.all.each { |crime| puts crime.category }
    else
        puts "let's try this again"
        get_player_or_crime
    end
end

def pick_player
    puts "Go ahead. Type their name and see what they've done: "
    gets.chomp
end