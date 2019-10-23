class Crime < ActiveRecord::Base
    has_many :arrests
    has_many :players, through: :arrests

    def most_on_which_day
        # returns the day of the week that this crime is most often committed
    end

    def self.category_table
        crime_categories = self.all.collect { |c| c.category }
        crime_pairs = crime_categories.each_slice(2).to_a
        if crime_pairs.last.count < 2
            crime_pairs.last << "" until crime_pairs.last.count == 2
        end

        table = TTY::Table.new crime_pairs
        puts table
    end
    
end