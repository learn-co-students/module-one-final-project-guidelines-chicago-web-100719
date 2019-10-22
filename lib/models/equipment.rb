class Equipment < ActiveRecord::Base
  self.table_name = 'equipments'
  has_many :exercises
  has_many :muscle_groups, through: :exercises
end