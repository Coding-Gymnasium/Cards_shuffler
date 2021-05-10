require 'rails_helper'

RSpec.describe Deck, type: :model do
  describe 'Relationships' do
    it { should have_many :cards }
  end
end
