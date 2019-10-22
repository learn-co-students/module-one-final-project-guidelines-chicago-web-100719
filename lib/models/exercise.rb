class Exercise < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :muscle_group
end