class Card < ApplicationRecord
  belongs_to :deck
  validates :name, :country, :lan, :lon, :deck_id, presence: true
end
