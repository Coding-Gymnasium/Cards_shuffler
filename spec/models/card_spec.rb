require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Validations' do
    it { should have_db_column :name }
    it { should have_db_column :capital }
    it { should have_db_column :population }
    it { should have_db_column :lat }
    it { should have_db_column :lon }
    it { should have_db_column :timezones }
    it { should have_db_column :alpha2Code }
    it { should have_db_column :languages }
    it { should have_db_column :flag }
  end

  describe 'Relationships' do
    it { should have_many(:decks).through(:deck_cards) }
  end

  describe 'Instance Methods' do
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
    end

    it '#capital_weather' do
      VCR.use_cassette('capital_weather') do
        weather = @card.capital_weather

        expect(weather[:temp]).to be_an(Numeric)
        expect(weather[:temp_min]).to be_an(Numeric)
        expect(weather[:temp_max]).to be_an(Numeric)
        expect(weather[:humidity]).to be_an(Numeric)
        expect(weather[:description]).to be_a(String)
        expect(weather[:conditions]).to be_a(String)
      end
    end
  end
end
