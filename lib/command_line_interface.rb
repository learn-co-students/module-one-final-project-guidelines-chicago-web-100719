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
    main_menu_choice = PROMPT.select("What would you like to do?") do |menu|
    menu.choice 'Choose Exercise', 1
    menu.choice 'Edit Exercises', 2
    menu.choice 'Exit', 3
  end
  if main_menu_choice == 1
    puts CLEAR
    header
    choose_exercise_menu
  elsif main_menu_choice == 2
    puts CLEAR
    header
    edit_menu
  elsif main_menu_choice == 3
    puts CLEAR
    exit
  end
end

def choose_exercise_menu
  puts CLEAR
  header
    choose_exercise_menu_choice = PROMPT.select("What would you like to do?") do |menu|
    menu.choice 'View all exercises', 1
    menu.choice 'Find exercise by Muscle Group and Equipment', 2
    menu.choice 'Find All Exercises By Muscle Group', 3
    menu.choice 'Find All Exercises By Equipment', 4
    end
  if choose_exercise_menu_choice == 1
    puts CLEAR
    header
    choose_from_exercise_list
  elsif choose_exercise_menu_choice == 2
    puts CLEAR
    header
    match_muscle_group_and_equipment
  elsif choose_exercise_menu_choice == 3
    puts CLEAR
    header
    muscle_group_menu
  elsif choose_exercise_menu_choice == 4
    puts CLEAR
    header
    equipment_menu
  end
end

def choose_from_exercise_list
  choices = Exercise.display_all_names
  exercise_list_choice = PROMPT.select("Choose an Exercise", choices, per_page: 20)
  Exercise.find_and_display_by_name(exercise_list_choice)
  return_to_main_menu
end

def match_muscle_group_and_equipment
    equipment_choices = Equipment.display_all_names
    muscle_group_choices = MuscleGroup.display_all_names
    equipment_list_choice = PROMPT.select("Choose an Equipment", equipment_choices, per_page: 20)
    muscle_group_list_choice = PROMPT.select("Choose a Muscle Group", muscle_group_choices, per_page: 20)
    Exercise.find_by_muscle_group_and_equipment(muscle_group_list_choice, equipment_list_choice)
    return_to_main_menu
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
    end
    new_muscle_group = PROMPT.select('Choose Muscle Group') do |menu|
      menu.choice 'Abs', 1
      menu.choice 'Arms', 2
      menu.choice 'Back', 3
      menu.choice 'Calves', 4
      menu.choice 'Chest', 5
      menu.choice 'Legs', 6
      menu.choice 'Shoulders', 7
    end
    
    new_equipment = PROMPT.select('Choose Equipment') do |menu|
      menu.choice 'Barbell', 1
      menu.choice 'Bench', 2
      menu.choice 'Dumbbell', 3
      menu.choice 'Gym Mat', 4
      menu.choice 'Incline Bench', 5
      menu.choice 'Kettlebell', 6
      menu.choice 'none (bodyweight exercise)', 7
      menu.choice 'Pull-up Bar', 8
      menu.choice 'Swiss Ball', 9
      menu.choice 'SZ-bar', 10
    end
    new_exercise[:equipment_id] = new_equipment
    new_exercise[:muscle_group_id] = new_muscle_group
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
  Exercise.edit_by_name(edit_name_choice, new_name)
end

def edit_description
  choices = Exercise.display_all_names
  edit_description_choice = PROMPT.select("Choose an exercise to edit", choices, per_page: 30)
  new_description = PROMPT.ask('What is the new description?')
  Exercise.edit_by_description(edit_description_choice, new_description)
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
