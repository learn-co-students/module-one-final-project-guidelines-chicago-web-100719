class CreateArrests < ActiveRecord::Migration[5.2]
  def change
    create_table :arrests do |t|
      t.string :day_of_week
      t.string :description
      t.integer :crime_id
      t.integer :player_id
    end
  end
end
