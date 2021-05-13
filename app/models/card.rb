class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  validates :name, :population, :lat, :lon, :timezones, :currencies, :languages, :flag, :map, presence: true
  validates :capital, presence: true, allow_blank: true
end
