require 'rails_helper'

RSpec.describe 'Index Page Features' do
  describe "As a user" do
    it 'Displays a card with a country and its capital' do
      visit root_path

      expect(page).to have_content"Discover The Capital Cities of The World"

      within '.cardsContainer' do
        within '.card' do 
          expect(page).to have_css(h2)
          expect(page).to have_css(h3)
        end

        expect(page).to have_button('Click To Discover')
      end
    end

  end
end
