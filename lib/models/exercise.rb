class Exercise < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :muscle_group

  def add_exercise(attributes)
    Exercise.create(attributes)
  end

  def self.delete_exercise(name)
    exercise = self.find_by(name: name)
    exercise.destroy
  end

  def self.find_by_name(name)
    self.find_by name: name
  end

  def self.display_all_names
    self.all.map { |exercise| exercise.name }
  end

  def display_name_with_description
      puts "-----------------------------------"
      puts "#{self.name}"
      puts "#{self.description}"
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

end