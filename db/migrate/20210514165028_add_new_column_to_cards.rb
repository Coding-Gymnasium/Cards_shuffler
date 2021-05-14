class AddNewColumnToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :alpha2Code, :string
  end
end
