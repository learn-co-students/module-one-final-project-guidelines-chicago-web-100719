class Arrest < ActiveRecord::Base
    belongs_to :crime
    belongs_to :player



def google_it
    puts "http://www.google.com/search?q=#{self.player.name.gsub(" ","+")}+#{self.crime.category.gsub(" ","+")}+#{self.date}"
end
end