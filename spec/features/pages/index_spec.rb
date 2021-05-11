require 'rails_helper'

RSpec.describe 'Index page features', type: :feature do
  it 'Visiting the index page creates a deck of cards' do
    expect { visit root_path }.to change { Deck.count }.by(1)
  end

  it 'A deck has cards' do
    visit root_path
    expect(Deck.last.cards.count).to_not eq(0)
  end

  it 'Cards include a Capital and its country and is listed in alphabetical order by country' do
    visit root_path
    expect(page).to have_content('Discover The Capital Cities Of The World')

    within(first('.card')) do
      expect(page).to have_content('Sukhumi')
      expect(page).to have_content('Abkhazia')
    end

    within all('.card').last do
      expect(page).to have_content('Harare')
      expect(page).to have_content('Zimbabwe')
    end
  end

  it 'There is shuffle button that when clicked shuffles the cards' do
    visit root_path

    expect(page).to have_button('Shuffle')
  end
end

