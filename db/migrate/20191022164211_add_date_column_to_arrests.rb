class AddDateColumnToArrests < ActiveRecord::Migration[5.2]
  def change
    add_column :arrests, :date, :string
  end
end
