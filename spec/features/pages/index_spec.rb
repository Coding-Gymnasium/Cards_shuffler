require 'rails_helper'

RSpec.describe 'Index page features', type: :feature do
  before :each do
    @deck = Deck.create
  end

  it 'Visiting the index page creates a deck of cards' do
    expect { visit root_path }.to change { Deck.count }.by(1)
  end

  xit 'A deck has cards' do
    binding.pry
    expect(@deck.cards.count).to_not eq(0)
  end

  xit 'Deck cards are listed in alphabetical order' do
  end

  xit 'There is shuffle button that when clicked shuffles the cards' do
  end

end
