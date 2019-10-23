class Equipment < ActiveRecord::Base
  self.table_name = 'equipments'
  has_many :exercises
  has_many :muscle_groups, through: :exercises

  def add_equipment(name)
    Equipment.create(name)
  end

  def delete_equipment(name)
    Equipment.delete_by(name: name)
  end

end