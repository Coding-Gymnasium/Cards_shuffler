class AddMapColumnsToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :map_s, :text
    add_column :cards, :map_l, :text
  end
end
