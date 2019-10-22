class MuscleGroup < ActiveRecord::Base
  has_many :exercises
  has_many :equipments, through: :exercises
end