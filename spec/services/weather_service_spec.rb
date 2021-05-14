require 'rails_helper'

RSpec.describe WeatherService do
  it 'can get the forecast from city name and country code' do
    VCR.use_cassette('current_weather') do
      city_name = 'Oslo'
      country_code = 'NO'
      weather = WeatherService.get_weather(city_name, country_code)

      expect(weather).to be_a(Hash)
      expect(weather[:weather][0][:main]).to be_a(String)
      expect(weather[:weather][0]).to have_key(:description)
      expect(weather[:main][:temp]).to be_an(Float)
      expect(weather[:main]).to have_key(:temp_min)
      expect(weather[:main]).to have_key(:temp_max)
      expect(weather[:main]).to have_key(:humidity)
    end
  end
end
