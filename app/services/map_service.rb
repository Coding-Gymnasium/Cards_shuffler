class MapService

  def self.get_small_map(coordinates)
    "https://www.mapquestapi.com/staticmap/v5/map?key=#{ENV["MAP_API_KEY"]}&locations=#{coordinates[:lat]},#{coordinates[:lon]}&defaultMarker=marker-sm-3B5998-22407F&size=200,200@2x&zoom=7"
  end

  def self.get_large_map(coordinates)
    "https://www.mapquestapi.com/staticmap/v5/map?key=#{ENV["MAP_API_KEY"]}&locations=#{coordinates[:lat]},#{coordinates[:lon]}&defaultMarker=marker-sm-3B5998-22407F&size=400,400@2x&zoom=7"
  end
end

