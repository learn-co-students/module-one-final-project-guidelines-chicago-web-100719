class Arrest < ActiveRecord::Base
    belongs_to :crime
    belongs_to :player

end
