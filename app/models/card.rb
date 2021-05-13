class Card < ApplicationRecord
  belongs_to :deck
  validates :name, :country, :lat, :lon, :map, :deck_id, presence: true
end
