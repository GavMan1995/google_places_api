class GooglesController < ApplicationController
  before_action :client
  def index
    @place = "tacos in bountiful"
    @spots = @client.spots_by_query("#{@place}")
  end

  private

  def client
    @client = GooglePlaces::Client.new(ENV['API_KEY'])
  end

end
