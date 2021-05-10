require 'rails_helper'

RSpec.describe 'Index page features', type: :feature do
  it 'Visiting the index page creates a deck of cards' do
    expect { visit root_path }.to change { Deck.count }.by(1)
  end

  it 'A deck has cards' do
    visit root_path
    expect(Deck.last.cards.count).to_not eq(0)
  end

  it 'There is a Deck of cards that includes a Capital name and the corresponding country' do
    visit root_path
    expect(page).to have_content('Discover The Capital Cities Of The World')

    within(first('.card')) do
      expect(page).to have_content('Sukhumi')
      expect(page).to have_content('Abkhazia')
    end
  end

  it 'Deck cards are listed in alphabetical order by country' do
  end

  xit 'There is shuffle button that when clicked shuffles the cards' do
  end
end

