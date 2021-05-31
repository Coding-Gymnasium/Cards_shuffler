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
        timezones: current_time(country_hash[:timezones][0]),
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

