class Card < ApplicationRecord

  has_many :deck_cards
  has_many :decks, through: :deck_cards
  validates :name, :population, :lat, :lon, :timezones, :currencies, :flag, :map, presence: true
  validates :capital, :languages, :alpha2Code, presence: true, allow_blank: true

  def capital_weather
    weather = WeatherService.get_weather(capital, alpha2Code)

    {
      temp: weather[:main][:temp],
      temp_min: weather[:main][:temp_min],
      temp_max: weather[:main][:temp_max],
      humidity: weather[:main][:humidity],
      description: weather[:weather][0][:description],
      conditions: weather[:weather][0][:main]
    }
  end
end
