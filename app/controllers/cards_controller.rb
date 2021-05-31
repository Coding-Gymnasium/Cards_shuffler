class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @card.top5_country_images(@card.name)
  end
end

