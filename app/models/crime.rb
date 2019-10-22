class Crime < ActiveRecord::Base[5.2]
    has_many :arrests
    has_many :players, through: :arrests

    def most_on_which_day
        # returns the day of the week that this crime is most often committed
    end
    
end