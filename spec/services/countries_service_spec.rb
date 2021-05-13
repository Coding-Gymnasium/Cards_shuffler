require 'rails_helper'

RSpec.describe CountriesService do
  it 'Makes an API request to Rest Countries Api' do
    VCR.use_cassette('get_countries') do
      countries = CountriesService.fetch_all

      expect(countries).to be_an(Array)
      expect(countries[0]).to be_a(Hash)
      expect(countries[0][:name]).to eq('Afghanistan')
      expect(countries[0][:capital]).to eq('Kabul')
      expect(countries[0][:population]).to be > 27_000_000
      expect(countries[0][:latlng][0]).to eq(33.0)
      expect(countries[0][:latlng][1]).to eq(65.0)
      expect(countries[0][:timezones][0]).to eq('UTC+04:30')
      expect(countries[0][:currencies][0][:name]).to eq('Afghan afghani')
      expect(countries[0][:languages].class).to be_an(Array)
      expect(countries[0][:languages].count).to eq(3)
      expect(countries[0][:languages][0][:name]).to eq('Pashto')
      expect(countries[0][:flag]).to be_a(String)
      expect(countries[0][:flag]).to include('svg')
    end
  end
end

