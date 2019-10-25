class Equipment < ActiveRecord::Base
  self.table_name = 'equipments'
  has_many :exercises
  has_many :muscle_groups, through: :exercises

  def self.add_equipment(name)
    self.create(name)
  end

  def self.delete_equipment(name)
    self.find_by_name(name).destroy
  end

  def self.display_all_names
    self.all.map { |equipment| equipment.name }
  end

  def self.find_by_name(name)
    self.find_by(name: name)
  end

end