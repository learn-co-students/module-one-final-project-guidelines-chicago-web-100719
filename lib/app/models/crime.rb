class Crime < ActiveRecord::Base
    has_many :arrests
    has_many :players, through: :arrests

    
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

    # def self.ten_most_recent_crimes
    #     arrests = self.all.map{|a| a.arrests}
    #     arrests.map{|a| a.date = a.date.to_datetime}
    # end
    def self.crime_types
        self.all.map{|c| c.category}
    end
    
end