require 'rails_helper'

RSpec.describe Deck, type: :model do
  describe 'Relationships' do
    it { should have_many(:cards).through(:deck_cards) }
  end

  describe 'Instance Methods' do
    it '#generate_countries_deck' do
      VCR.use_cassette('get_countries') do
      deck = Deck.create
      deck.generate_countries_deck
      expect(deck.cards.count).to_not eq(0)
      end
    end
  end
end
