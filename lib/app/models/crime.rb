class Crime < ActiveRecord::Base
    has_many :arrests
    has_many :players, through: :arrests


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
        
    def self.crimes_by_day(day_of_week)
        arrests = Arrest.all.select{|a| a.day_of_week == day_of_week}
        arrests.map{|a| a.crime.category}
    end

    def self.most_common_crimes_by_day(day_of_week)
        # returns the day of the week that this crime is most often committed
        arrests = self.crimes_by_day(day_of_week)
        arrests.sort_by{|a| arrests.count(a)}[0..4].uniq
    end

    def occurs_most_often_on_day
        arrests2 = self.arrests.map{|a| a.day_of_week}
        arrests2.max_by{|a| arrests2.count(a)}
    end

    def self.all_crime_categories
        self.all.map{|c| c.category}
    end

    def self.crime_types
        self.all.map{|c| c.category}
    end
    
end