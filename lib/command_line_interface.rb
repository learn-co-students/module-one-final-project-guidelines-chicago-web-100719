require "tty-prompt"
require "tty-font"
PROMPT = TTY::Prompt.new
CLEAR = puts "\e[H\e[2J"

def welcome
  CLEAR
  header
end

def header
  font = TTY::Font.new(:doom)
  pastel = Pastel.new
  puts pastel.red(font.write("PUMP  YOU  UP"))
end

def main_menu
    main_menu_return = PROMPT.select("What would you like to do?") do |menu|
    menu.choice 'Choose Exercise', 1
    menu.choice 'Edit Exercises', 2
    menu.choice 'Find All Exercises By Muscle Group', 3
    menu.choice 'Find All Exercises By Equipment', 4
  end
  if main_menu_return == 1

  elsif main_menu_return == 2

  elsif main_menu_return == 3
    CLEAR
    header
    muscle_group_menu
  elsif main_menu_return == 4
    CLEAR
    header
    equipment_menu
  end
end

def muscle_group_menu
    choices = MuscleGroup.display_by_name
    muscle_group_menu_choice = PROMPT.select("Choose a muscle group", choices)

end

def equipment_menu
  choices = Equipment.display_by_name
  equipment_menu_choice = PROMPT.select("Choose a piece of equipment", choices)

end