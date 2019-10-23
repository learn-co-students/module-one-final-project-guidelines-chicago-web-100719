class Arrest < ActiveRecord::Base
    belongs_to :crime
    belongs_to :player

    def happened_on_friday
        self.update(day_of_week: 'Friday')
    end
end
