require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Validations' do
    it { should have_db_column :name }
    it { should have_db_column :capital }
    it { should have_db_column :population }
    it { should have_db_column :lat }
    it { should have_db_column :lon }
    it { should have_db_column :timezones }
    it { should have_db_column :alpha2Code }
    it { should have_db_column :languages }
    it { should have_db_column :flag }
    it { should have_db_column :map }
  end

  describe 'Relationships' do
    it { should have_many(:decks).through(:deck_cards) }
  end
end
