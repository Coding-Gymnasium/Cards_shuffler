require 'csv'

class Deck < ApplicationRecord
  has_many :cards

  def generate_deck
    data = CSV.read('lib/assets/data/capitals.csv')
    data.each do |row|
      map = MapService.get_map({ lat: row[2], lon: row[3] })
      row != data[0] && cards.create!(
        name: row[1],
        country: row[0],
        lat: row[2].to_f,
        lon: row[3].to_f,
        map: map,
      )
    end
  end
end

