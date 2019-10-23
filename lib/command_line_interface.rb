require "tty-prompt"
prompt = TTY::Prompt.new

def welcome
  puts "\e[H\e[2J"
  puts "Welcome to the PUMP YOU AHP app!"
end

def main_menu
    main_menu_return = TTY::Prompt.new.select("What would you like to do?") do |menu|
    menu.choice 'Choose Exercise', 1
    menu.choice 'Edit Exercises', 2
    menu.choice 'Find All Exercises By Muscle Group', 3
    menu.choice 'Find All Exercises By Equipment', 4
  end
  if main_menu_return == 1

  elsif main_menu_return == 2

  elsif main_menu_return == 3
    puts "\e[H\e[2J"
    muscle_group_menu
  elsif main_menu_return == 4
    puts "\e[H\e[2J"
    equipment_menu
  end
end

def muscle_group_menu
    choices = MuscleGroup.display_by_name
    muscle_group_menu_choice = TTY::Prompt.new.select("Choose a muscle group", choices)

end

def equipment_menu
  choices = Equipment.display_by_name
  equipment_menu_choice = TTY::Prompt.new.select("Choose a piece of equipment", choices)

end