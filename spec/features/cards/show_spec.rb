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
      map: 'https://www.mapquestapi.com/staticmap/v5/map?key=g...',
      alpha2Code: 'AF'
    )
  end

  describe 'Country Stats & Features' do

    it "When a visitor visits the home page can go to a card's show" do
      visit root_path

      within(first('.card')) do
        click_button 'details'
      end
      expect(current_path).to eq(card_path)
    end

    it 'It has the country name in H1' do
      visit card_path

      expect(page).to have_css(h1)
      expect(page).to have_content("#{@card.name}")
    end

    it 'It  has a map of the city' do
      visit card_path
      within('.map') do
        expect(page).to have_content("#{@card.capital}")
      end
    end

    it 'It has a list of the country stats' do
      visit card_path

      within('.stats') do 
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
    end

  end
end

