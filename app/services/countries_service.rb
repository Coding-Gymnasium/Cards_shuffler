class CountriesService
  def self.fetch_all
    response = conn.get('all') do |f|
      f.params['fields'] = 'name;capital;population;latlng;timezones;currencies;languages;flag'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://restcountries.eu/rest/v2/')
  end
end

