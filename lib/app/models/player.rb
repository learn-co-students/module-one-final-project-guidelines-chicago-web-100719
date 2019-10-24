class Player < ActiveRecord::Base
    has_many :arrests
    has_many :crimes, through: :arrests
    after_destroy { |player| player.arrests }

    def crimes_and_frequency
        return_hash = {}
        self.arrests.each do |arrest|
            if return_hash[arrest.crime.category]
                return_hash[arrest.crime.category] += 1
            else return_hash[arrest.crime.category] = 1
            end
        end
        return_hash.each { |key, value| puts "#{key}... #{value} time(s)"}
        # returns a hash of crime keys with value of the frequency of each crime
    end

    def most_recent_arrest
        self.arrests.max { |a, b| a.date.to_datetime <=> b.date.to_datetime }
    end
    
    def pardon
        crime_to_delete = Crime.all.select { |c| c.arrests.count == 1 && c.arrests.include?(most_recent_arrest) }
        Crime.all.delete(crime_to_delete)
        self.arrests.delete(most_recent_arrest)
        # must close pry session before object deleted from arrests
        if self.arrests.count < 1
            self.class.all.delete(self)
        end
    end

    def self.repeat_offenders
        self.select { |player| player.arrests.count > 1 }
        # returns array of player objects
    end
    
    def snitch(day_of_week, date, description, crime)
        Arrest.create({
            day_of_week: day_of_week,
            date: date,
            description: description,
            crime_id: Crime.find_or_create_by(category: crime).id,
            player_id: self.id
        })
    end

    def new_dad
        self.update(name: self.name + ' Sr')
    end

    def self.name_table
        player_names = self.all.collect { |p| p.name }
        player_pairs = player_names.each_slice(4).to_a
        if player_pairs.last.count < 4
            player_pairs.last << "" until player_pairs.last.count == 4
        end

        table = TTY::Table.new player_pairs
        puts table.render(:unicode)
    end

    def pardon_all
        self.arrests.each { |arrest| arrest.destroy }
    end

end