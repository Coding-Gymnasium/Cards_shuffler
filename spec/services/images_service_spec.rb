require 'rails_helper'

RSpec.describe ImagesService do
  it "Gets country images by querying country's name" do
    VCR.use_cassette('country_images') do
      country = 'Norway'
      image = ImagesService.get_images(country)

      expect(image).to be_a(Hash)
      expect(image[:images]).to be_an(Array)
      expect(image[:top5]).to be_an(Array)
      expect(image[:other]).to be_a(Hash)
      expect(image[:images][0][:type]).to eq('photo')
      expect(image[:images][0][:user]).to be_a(String)
    end
  end

end

