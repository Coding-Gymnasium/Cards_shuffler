require 'rails_helper'

RSpec.describe MapService do
  it 'Makes and API request to Mapquest' do
    map = MapService.get_map({ lat: 39.738453, lon: -104.984853 })

    expect(map).to be_a(String)
    expect(map).to include('https://www.mapquestapi.com/staticmap/v5/map?')
  end
end
