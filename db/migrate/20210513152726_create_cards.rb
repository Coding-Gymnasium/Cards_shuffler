class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :capital
      t.integer :population
      t.float :lat
      t.float :lon
      t.string :timezones
      t.string :alpha2Code
      t.string :currencies
      t.string :languages
      t.string :flag

      t.timestamps
    end
  end
end
