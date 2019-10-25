class CreateExercises < ActiveRecord::Migration[5.2]

  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :equipment_id
      t.integer :muscle_group_id
    end
  end

end