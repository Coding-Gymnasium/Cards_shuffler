require 'rails_helper'

RSpec.describe Deck, type: :model do
  describe 'Relationships' do
    it { should have_many(:cards).through(:deck_cards) }
  end

  describe 'Instance Methods' do
    it '#generate_deck' do
      deck = Deck.create
      deck.generate_deck
      expect(deck.cards.count).to_not eq(0)
    end
  end
end
