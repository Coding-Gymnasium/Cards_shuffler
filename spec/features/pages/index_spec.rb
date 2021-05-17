require 'rails_helper'

RSpec.describe 'Index page features', type: :feature do
  it 'Visiting the index page creates a deck of cards' do
    VCR.use_cassette('get_countries') do
      expect { visit root_path }.to change { Deck.count }.by(1)
    end
  end

  it 'A deck has cards' do
    VCR.use_cassette('get_countries') do
      visit root_path
      expect(Deck.last.cards.count).to_not eq(0)
    end
  end

  it 'Cards include a Capital and its country and is listed in alphabetical order by country' do
    VCR.use_cassette('get_countries') do
      visit root_path
      expect(page).to have_content('Explore The Countries Of The World')

      within(first('.card')) do
        expect(page).to have_content('Kabul')
        expect(page).to have_content('Afghanistan')
        expect(page).to have_content('Population: 27657145')
        expect(page).to have_content('Currency: Afghan afghani')
        expect(page).to have_content('Languages: Pashto, Uzbek, Turkmen')
        expect(page).to have_content('Date & Time:')
      end

      within all('.card').last do
        expect(page).to have_content('Harare')
        expect(page).to have_content('Zimbabwe')
      end
    end
  end

  it 'There is shuffle button that when clicked shuffles the cards' do
    VCR.use_cassette('get_countries') do
      visit root_path

      expect(page).to have_button('Shuffle')
    end
  end

  it "When a visitor visits the home page can go to a card's show" do
    VCR.use_cassette('get_countries') do
      visit root_path
    end

    VCR.use_cassette('get_show_weather') do
      card = Card.all.first.id
      within(first('.card')) do
        expect(page).to have_link('Details')
        click_link 'Details'
      end
      expect(current_path).to eq(card_path(card))
    end
  end
end

