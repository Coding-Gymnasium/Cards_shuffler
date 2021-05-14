class PagesController < ApplicationController
  def index
    deck = Deck.create
    deck.generate_countries_deck
    @cards = deck.cards
  end
end

