require 'csv'

class PagesController < ApplicationController
  def index
    data = CSV.read('lib/assets/data/capitals.csv')
    capitals = []
    data.each do |arr|
      arr != data[0] && capitals << { country: arr[0], capital: arr[1], lat: arr[2].to_f, lon: arr[3].to_f }
    end
    @random_capital = capitals.shuffle
  end
end
