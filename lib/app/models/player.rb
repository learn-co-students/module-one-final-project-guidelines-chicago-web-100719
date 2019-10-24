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
        self.arrests.delete(most_recent_arrest)
        Crime.all.each do |c|
            if c.arrests.count < 1
                Crime.all.delete(c)
            end
        end
        if self.arrests.count < 1
            self.class.all.delete(self)
        end
        self.arrests
    end

    def pardon_all
        (self.arrests.count).times do
            self.pardon
        end
        puts "hello"
        self.delete
        # if self.arrests.count < 1
        #     self.class.all.delete(self)
        #     binding.pry
        # end
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
        puts table.render(:unicode, padding: [0.5, 1, 2, 1])
    end

    def pardon_all
        self.arrests.each { |arrest| self.arrests.delete(arrest) }
    end

end