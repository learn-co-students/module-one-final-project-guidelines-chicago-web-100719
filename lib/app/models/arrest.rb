class Arrest < ActiveRecord::Base
    belongs_to :crime
    belongs_to :player

    def google_it
    puts "http://www.google.com/search?q=#{self.player.name.gsub(" ","+")}+#{self.crime.category.gsub(" ","+")}+#{self.date}\n\n"
    end
    
    def happened_on_friday
        self.update(day_of_week: 'Friday')
    end
end