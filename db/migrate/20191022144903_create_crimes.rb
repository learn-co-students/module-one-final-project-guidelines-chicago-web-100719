class CreateCrimes < ActiveRecord::Migration[5.2]
  def change
    create_table :crimes do |t|
      t.string :category
    end
  end
end
