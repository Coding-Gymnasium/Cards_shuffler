require 'rails_helper'

RSpec.describe 'Cards Show Page Features' do
  before :each do
    @card = Card.create(
      name: 'Afghanistan',
      capital: 'Kabul',
      population: 27_657_145,
      lat: 33.0,
      lon: 65.0,
      timezones: 'Saturday, 05/15/21 -  01:15:13',
      currencies: 'Afghan afghani',
      languages: 'Pashto, Uzbek, Turkmen',
      flag: 'https://restcountries.eu/data/afg.svg',
      alpha2Code: 'AF'
    )

    VCR.use_cassette('show_page_weather') do
      visit card_path(@card)
    end
  end

  describe 'Country Stats & Features' do
    it 'It has the country name' do
      expect(page).to have_content("#{@card.name}")
    end

    it 'It  has a map of the country' do
      within('#countryMap') do
        expect(page).to have_content("#{@card.capital}")
      end
    end

    it 'It has a list of the country stats' do
      within('#stats') do
        expect(page).to have_content('Country Stats')
        expect(page).to have_content('Name: Afghanistan')
        expect(page).to have_content('Population: 27657145')
        expect(page).to have_content('Currency: Afghan afghani')
        expect(page).to have_content('Languages: Pashto, Uzbek, Turkmen')
      end
    end

    it 'It has a images of the country' do
    end

    it 'It has the capital city weather' do
      within('#capitalWeather') do
        expect(page).to have_content('Kabul Current Weather')
        expect(page).to have_content('Temperature')
        expect(page).to have_content('Minimum')
        expect(page).to have_content('Maximum')
        expect(page).to have_content('Humidity')
        expect(page).to have_content('Conditions')
      end
    end
  end
end

