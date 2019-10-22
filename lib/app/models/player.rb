class Player < ActiveRecord::Base
    has_many :arrests
    has_many :crimes, through: :arrests

    def crimes_and_frequency
        return_hash = {}
        self.arrests.each do |arrest|
            if return_hash[arrest.crime.category]
                return_hash[arrest.crime.category] += 1
            else return_hash[arrest.crime.category] = 1
            end
        end
        puts return_hash
        # returns a hash of crime keys with value of the frequency of each crime
    end

    def most_recent_arrest
        self.arrests.max { |a, b| a.date.to_datetime <=> b.date.to_datetime }
    end
    
    def pardon
        most_recent_arrest.destroy
    end
end