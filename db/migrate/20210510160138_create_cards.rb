class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :country
      t.float :lan
      t.float :lon
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end