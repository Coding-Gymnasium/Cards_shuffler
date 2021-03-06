class WeatherService
  def self.get_weather(city_name, country_code)
    response = conn.get('data/2.5/weather?') do |f|
      f.params[:appid] = ENV['WEATHER_API_KEY']
      f.params[:q] = "#{city_name},#{country_code}"
      f.params[:units] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org/')
  end
end

