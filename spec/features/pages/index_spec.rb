require 'rails_helper'

RSpec.describe 'Index page features', type: :feature do
  it 'Visiting the index page creates a deck of cards' do
    expect { visit root_path }.to change { Deck.count }.by(1)
  end

  it 'A deck has cards' do
    visit root_path
    expect(Deck.last.cards.count).to_not eq(0)
  end

  xit 'Deck cards are listed in alphabetical order' do
  end

  xit 'There is shuffle button that when clicked shuffles the cards' do
  end
end

