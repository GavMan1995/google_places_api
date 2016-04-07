class GooglesController < ApplicationController
  before_action :client
  def index
  end

  def search
    @location = request.remote_ip
    @spots = @client.spots_by_query(params["search"] + "in #{@location}", :types => ['restaurant', 'food', 'meal_takeaway', 'meal_delivery', 'cafe', 'bakery'])
    binding.pry
  end

  private

  def client
    @client = GooglePlaces::Client.new(ENV['API_KEY'])
  end

end
