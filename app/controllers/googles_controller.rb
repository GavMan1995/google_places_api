class GooglesController < ApplicationController
  before_action :client
  def index
  end

  def search
    @spots = @client.spots_by_query(params["search"])
  end

  private

  def client
    @client = GooglePlaces::Client.new(ENV['API_KEY'])
  end

end
