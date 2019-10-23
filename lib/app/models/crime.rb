class Crime < ActiveRecord::Base
    has_many :arrests
    has_many :players, through: :arrests

    def most_on_which_day
        # returns the day of the week that this crime is most often committed
    end

    def self.category_table
        crime_categories = self.all.collect { |c| c.category }
        crime_pairs = crime_categories.each_slice(3).to_a
        if crime_pairs.last.count < 3
            crime_pairs.last << "" until crime_pairs.last.count == 3
        end

        table = TTY::Table.new crime_pairs
        puts table.render(:unicode, padding: [0.5, 1, 2, 1])
    end

    def who_dun_it
        puts "\n"
        self.players.each { |player| puts player.name }
        puts "\n"
    end

    def occurs_most_often_on_day
        puts "\n"
        arrests2 = self.arrests.map { |a| a.day_of_week }
        puts arrests2.max_by { |a| arrests2.count(a) }
        puts "\n"
    end

    
    
end