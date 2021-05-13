class AddMapColumnsToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :map, :text
  end
end
