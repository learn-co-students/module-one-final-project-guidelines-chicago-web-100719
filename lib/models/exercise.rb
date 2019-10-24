class Exercise < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :muscle_group

  def self.add_exercise(attributes)
    self.create(attributes)
  end

  def self.delete_exercise(name)
    exercise = self.find_by(name: name)
    exercise.destroy
  end

  def self.find_by_name(name)
    self.find_by(name: name)
  end

  def self.display_all_names
    self.all.map { |exercise| exercise.name }
  end

  def display_name_with_description
      puts "-----------------------------------"
      puts "#{self.name}"
      puts "#{self.description}"
  end

  def self.find_and_display_by_name(name)
    self.find_by_name(name).display_name_with_description
  end

  def self.find_by_muscle_group(muscle_group_name)
    muscle_group = MuscleGroup.find_by_name(muscle_group_name)
    exercises = self.all.select { |exercise| exercise.muscle_group_id == muscle_group.id }
    exercises.map { |exercise| exercise.display_name_with_description }
  end

  def self.find_by_equipment(equipment_name)
    equipment = Equipment.find_by_name(equipment_name)
    exercises = self.all.select { |exercise| exercise.equipment_id == equipment.id }
    exercises.map { |exercise| exercise.display_name_with_description }
  end

  def self.find_by_muscle_group_and_equipment(muscle_group_name, equipment_name)
    muscle_group = MuscleGroup.find_by_name(muscle_group_name)
    equipment = Equipment.find_by_name(equipment_name)
    exercises = self.all.select { |exercise| (exercise.muscle_group_id == muscle_group.id) && (exercise.equipment_id == equipment.id) }
    exercises.map { |exercise| exercise.display_name_with_description }
  end

  def self.edit_by_name(name, new_name)
    self.find_by_name(name).update(name: new_name)
  end

  def self.edit_by_description(name, new_description)
    self.find_by_name(name).update(description: new_description)
  end

  def self.edit_by_equipment(exercise_name, equipment_name)
    new_id = Equipment.find_by_name(equipment_name).id
    self.find_by_name(exercise_name).update(equipment_id: new_id)
  end

  def self.edit_by_muscle_group(exercise_name, muscle_group_name)
    new_id = MuscleGroup.find_by_name(muscle_group_name).id
    self.find_by_name(exercise_name).update(muscle_group_id: new_id)
  end

end