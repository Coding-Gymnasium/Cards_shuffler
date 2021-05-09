require 'rails_helper'

RSpec.describe 'Index Page Features' do
  describe 'As a user' do
    before :each do
      visit root_path
    end

    it 'Displays a card with a country and its capital' do
      expect(page).to have_content('Discover The Capital Cities Of The World')

      within '.cardsContainer' do
        within '.card' do
          expect(page).to have_content('Capital of:')
        end

        expect(page).to have_button('Click To Discover')
      end
    end
  end
end
