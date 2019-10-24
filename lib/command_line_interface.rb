require "tty-prompt"
require "tty-font"
require 'io/console'                                                                                                       


PROMPT = TTY::Prompt.new
CLEAR = "\e[H\e[2J"

def header
  font = TTY::Font.new(:doom)
  pastel = Pastel.new
  puts pastel.red(font.write("PUMP  YOU  UP"))
end

def return_to_main_menu                                                                                                             
  puts "            \r" 
  puts "Press any key to return to main menu"                                                                                                    
  STDIN.getch       
  puts "            \r"
  main_menu
end  

def main_menu
    puts CLEAR
    header
    main_menu_return = PROMPT.select("What would you like to do?") do |menu|
    menu.choice 'Choose Exercise', 1
    menu.choice 'Edit Exercises', 2
    menu.choice 'Find All Exercises By Muscle Group', 3
    menu.choice 'Find All Exercises By Equipment', 4
    menu.choice 'Exit', 5
  end
  if main_menu_return == 1

  elsif main_menu_return == 2

  elsif main_menu_return == 3
    puts CLEAR
    header
    muscle_group_menu
  elsif main_menu_return == 4
    puts CLEAR
    header
    equipment_menu
  elsif main_menu_return == 5
    puts CLEAR
    exit
  end
end

def muscle_group_menu
    choices = MuscleGroup.display_all_names
    muscle_group_menu_choice = PROMPT.select("Choose a muscle group", choices, per_page: 7)
    Exercise.find_by_muscle_group(muscle_group_menu_choice)
    return_to_main_menu
end

def equipment_menu
  choices = Equipment.display_all_names
  equipment_menu_choice = PROMPT.select("Choose a piece of equipment", choices, per_page: 15)
  Exercise.find_by_equipment(equipment_menu_choice)
  return_to_main_menu
end
