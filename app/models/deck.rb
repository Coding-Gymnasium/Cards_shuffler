require 'csv'

class Deck < ApplicationRecord
  has_many :cards

  def generate_deck(id)
    data = CSV.read('lib/assets/data/capitals.csv')
    data.each do |row|
      map_s = MapService.get_small_map({ lat: row[2], lon: row[3] })
      map_l = MapService.get_large_map({ lat: row[2], lon: row[3] })
      row != data[0] && Card.create!(
        name: row[1],
        country: row[0],
        lat: row[2].to_f,
        lon: row[3].to_f,
        map_s: map_s,
        map_l: map_l,
        deck_id: id
      )
    end
  end
end

