require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :country }
    it { should validate_presence_of :lan }
    it { should validate_presence_of :lon }
  end

  describe 'Relationships' do
    it { should belong_to :deck }
  end
end
