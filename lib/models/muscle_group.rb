class MuscleGroup < ActiveRecord::Base
  has_many :exercises
  has_many :equipments, through: :exercises

  def add_muscle_group(name)
    MuscleGroup.create(name)
  end

  def delete_muscle_group(name)
    MuscleGroup.delete_by(name: name)
  end

  def self.display_by_name
    self.all.map { |muscle_group| muscle_group.name }
  end

  def self.find_by_name(name)
    self.find_by name: name
  end

end