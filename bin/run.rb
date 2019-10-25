require_relative '../config/environment.rb'
CLEAR
welcome
run = true

while run
    input = get_input(PROMPT.ask(players_or_crimes, echo:true))
    case input
    when 1
        display_name_table  
        player = Player.find_or_create_by(name: get_input(gets.chomp))
        view_player_arrests(player)
        menu_for_player(player)
    when 2
        display_crime_table
        puts "choose crime:"
        crime = take_crime_input(gets.chomp)
        puts crime.category
        crime_choices(crime)
    else
        puts "Wrong input. Please enter 1 or 2.\n\n".yellow
        next
    end
    puts "\n\n\nEnter 'Yes' or 'Y' to go again...".red
    puts "Enter anything else to exit".red
    ans = get_input(gets.chomp)
if ans == "Yes" || ans == "Y"
    run = true
else 
    sign_off_message
    run = false
end
end
CLEAR

