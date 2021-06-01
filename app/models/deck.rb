class Deck < ApplicationRecord
  has_many :deck_cards, dependent: :destroy
  has_many :cards, through: :deck_cards

  def generate_countries_deck
    data = CountriesService.fetch_all
    create_cards(data)
  end

  def create_cards(data)
    data.each do |country_hash|
      country_hash[:latlng][0] && country_hash[:latlng][1] && cards.create!(
        name: country_hash[:name],
        capital: country_hash[:capital],
        population: country_hash[:population],
        lat: country_hash[:latlng][0],
        lon: country_hash[:latlng][1],
        timezones: country_hash[:timezones][0],
        alpha2Code: country_hash[:alpha2Code],
        currencies: country_hash[:currencies][0][:name],
        languages: languages(country_hash[:languages]),
        flag: country_hash[:flag]
      )
    end
  end

  def languages(lang_arr)
    lang_string = lang_arr.map { |lang| lang[:name].capitalize }
    lang_string.join(', ')
  end
end

