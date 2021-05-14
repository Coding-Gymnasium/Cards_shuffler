class Deck < ApplicationRecord
  has_many :deck_cards, dependent: :destroy
  has_many :cards, through: :deck_cards

  def generate_countries_deck
    data = CountriesService.fetch_all
    create_cards(data)
  end

  def create_cards(data)
    data.each do |row|
      map = get_maps(row)
      map && cards.create!(
        name: row[:name],
        capital: row[:capital],
        population: row[:population],
        lat: row[:latlng][0],
        lon: row[:latlng][1],
        timezones: current_time(row[:timezones][0]),
        alpha2Code: row[:alpaha2Code],
        currencies: row[:currencies][0][:name],
        languages: languages(row[:languages]),
        flag: row[:flag],
        map: map
      )
    end
  end

  def get_maps(row)
    MapService.get_map({ lat: row[:latlng][0], lon: row[:latlng][1] }) if row[:latlng][0] && row[:latlng][1]
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

