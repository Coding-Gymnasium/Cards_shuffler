class MapService
  def self.get_map(coordinates)
    "https://www.mapquestapi.com/staticmap/v5/map?key=#{ENV["MAP_API_KEY"]}&locations=#{coordinates[:lat]},#{coordinates[:lon]}&defaultMarker=marker-sm-3B5998-22407F&size=200,200@2x&zoom=7"
  end
end

