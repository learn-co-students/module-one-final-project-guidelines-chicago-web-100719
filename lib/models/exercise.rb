class Exercise < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :muscle_group

  def add_exercise(attributes)
    Exercise.create(attributes)
  end

  def delete_exercise(name)
    Exercise.destroy_by(name: name)
  end

end