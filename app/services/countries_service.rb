class CountriesService
  def self.fetch_all
    response = conn.get('all')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://restcountries.com/v2/')
  end
end

