class Player < ActiveRecord::Base
    has_many :arrests
    has_many :crimes, through: :arrests
    after_destroy { |player| player.arrests }

    def most_recent_arrest
        self.arrests.max { |a, b| a.date.to_datetime <=> b.date.to_datetime }
    end
    
    def pardon
        self.most_recent_arrest.delete
        Crime.all.each do |c|
            if c.arrests.count < 1
                c.delete
            end
        end
        self.arrests
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

end