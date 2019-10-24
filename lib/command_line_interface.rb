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
    puts CLEAR
    header
    choose_exercise_menu
  elsif main_menu_return == 2
    puts CLEAR
    header
    edit_menu
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

def choose_exercise_menu


end

def edit_menu
    edit_menu_return = PROMPT.select("What would you like to do?") do |menu|
    menu.choice 'Add New Exercise', 1
    menu.choice 'Edit Exercise', 2
    menu.choice 'Delete Exercise', 3
  end
  if edit_menu_return == 1
    puts CLEAR
    header
    add_new_exercise_menu
  elsif edit_menu_return == 2
    puts CLEAR
    header
    edit_exercise_menu
  elsif edit_menu_return == 3
    puts CLEAR
    header
    delete_exercise_menu
  end
end


def add_new_exercise_menu
    new_exercise = PROMPT.collect do
      key(:name).ask('Name?')
      key(:description).ask('Description?')
      key(:equipment_id).ask('Choose an equipment (type the number and return)
          1. Barbell
          2. Bench
          3. Dumbbell
          4. Gym Mat
          5. Incline Bench
          6. Kettlebell
          7. none (bodyweight exercise)
          8. Pull-up bar
          9. Swiss Ball
          10. SZ-bar', convert: :int)
      key(:muscle_group_id).ask('Choose a muscle group (type the number and return)
         1. Abs
         2. Arms
         3. Back
         4. Calves
         5. Chest
         6. Legs
         7. Shoulders', convert: :int)
    end
    Exercise.add_exercise(new_exercise)
    puts "Exercise Added!"
    return_to_main_menu
end

def edit_exercise_menu
  edit_exercise_menu_choice = PROMPT.select("Choose an edit option") do |menu|
    menu.choice 'Edit Name', 1
    menu.choice 'Edit Description', 2
  end
  if edit_exercise_menu_choice == 1
    edit_name
  elsif edit_exercise_menu_choice == 2
    edit_description
  end
end


def edit_name
  choices = Exercise.display_all_names
  edit_name_choice = PROMPT.select("Choose an exercise to edit", choices, per_page: 30)
  new_name = PROMPT.ask('What is the new name?')

end

def edit_description
  choices = Exercise.display_all_names
  edit_description_choice = PROMPT.select("Choose an exercise to edit", choices, per_page: 30)
  new_description = PROMPT.ask('What is the new description?')

end

def delete_exercise_menu
    choices = Exercise.display_all_names
    delete_exercise_choice = PROMPT.select("Choose an exercise to delete", choices, per_page: 30)
    Exercise.delete_exercise(delete_exercise_choice)
    return_to_main_menu
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
