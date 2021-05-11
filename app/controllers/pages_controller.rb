class PagesController < ApplicationController
  def index
    deck = Deck.create
    deck.generate_deck(deck.id)
    @cards = deck.cards
  end
end

