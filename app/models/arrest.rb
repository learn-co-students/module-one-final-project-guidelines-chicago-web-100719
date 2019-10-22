class Arrest < ActiveRecord::Base[5.2]
    belongs_to :crime
    belongs_to :player

end