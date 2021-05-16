class MapService

  def self.get_map(coordinates)
    #response = conn.get('staticmap/v5/map?') do |f|
    #  f.params[:key] = ENV["MAP_API_KEY"]
    #  f.params[:center] = "#{coordinates[:lat]},#{coordinates[:lon]}"
    #  f.params[:zoom] = 3
    #end

    #JSON.parse(response.body, symbolize_names: true)

    "https://www.mapquestapi.com/staticmap/v5/map?key=#{ENV["MAP_API_KEY"]}&center=#{coordinates[:lat]},#{coordinates[:lon]}&size=400,200@2x&zoom=3"
  end

  #def self.conn
  #  Faraday.new('https://www.mapquestapi.com')
  #end
end

