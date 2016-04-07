class GooglesController < ApplicationController
  before_action :client
  def index
  end

  def search
    @result = request.location
    @spots = @client.spots_by_query(params["search"], :types => ['restaurant', 'food', 'meal_takeaway', 'meal_delivery', 'cafe', 'bakery'])
    puts @spots.near("#{@results}", 20)
  end

  private

  def client
    @client = GooglePlaces::Client.new(ENV['API_KEY'])
  end

end
