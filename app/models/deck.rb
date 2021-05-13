class Deck < ApplicationRecord
  has_many :deck_cards, dependent: :destroy
  has_many :cards, through: :deck_cards

  def generate_countries_deck
    data = CountriesService.fetch_all

    data.each do |row|
      map = MapService.get_map({ lat: row[:latlng][0], lon: row[:latlng][1] }) if row[:latlng][0] && row[:latlng][1]
      map && cards.create!(
        name: row[:name],
        capital: row[:capital],
        population: row[:population],
        lat: row[:latlng][0],
        lon: row[:latlng][1],
        timezones: row[:timezones][0],
        currencies: row[:currencies][0][:name],
        languages: row[:languages].map { |lang| lang[:name] },
        flag: row[:flag],
        map: map
      )
    end
  end
end

