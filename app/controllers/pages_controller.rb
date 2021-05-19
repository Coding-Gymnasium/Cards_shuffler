class PagesController < ApplicationController
  def index
    deck = Deck.first || Deck.create
    if deck.cards.none? 
      deck.generate_countries_deck
    end
    @cards = deck.cards
  end
end

