require 'down'

class Card < ApplicationRecord
  has_many_attached :images
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  validates :name, :population, :lat, :lon, :timezones, :currencies, :flag, presence: true
  validates :capital, :languages, :alpha2Code, presence: true, allow_blank: true

  def country_map
    MapService.get_map({lat: lat, lon: lon}) if lat && lon
  end

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

  def top5_country_images(country)
    if self.images.count <= 0
      top5_images = ImagesService.get_images(country)[:top5].map { |image| image[:largeImageURL] }
      top5_images.each do |url|
        tempfile = Down.download(url)
        count = 0
        self.images.attach(io: File.open(tempfile), filename: "#{self.name}-#{count += 1}")
      end
     self.images
    end
  end

  def current_time(off_set)
    arr = plus_or_minus(off_set)
    n = extract_numbers(arr)
    sec = n.map { |num| (num == n[0] && num * 60 * 60) || (num == n[1] && num * 60) }.sum
    (Time.now.utc + sec).strftime('%A, %D -  %T')
  end

  def plus_or_minus(string)
    string.include?('+') ? string.split(/[+:]/) : string.split(/[-:]/)
  end

  def extract_numbers(off_set_array)
    off_set_array.map { |e| e.to_i if e != off_set_array[0] }.compact
  end
end

