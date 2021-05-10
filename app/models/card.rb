class Card < ApplicationRecord
  belongs_to :deck
  validates :name, :country, :lat, :lon, :deck_id, presence: true
end
