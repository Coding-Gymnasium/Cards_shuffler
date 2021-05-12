class Card < ApplicationRecord
  belongs_to :deck
  validates :name, :country, :lat, :lon, :map_s, :map_l, :deck_id, presence: true
end
