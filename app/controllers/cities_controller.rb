class CitiesController < ApplicationController
  def show
    @city = City.find param[:id]
    @attraction = @city.attractions
  end

  def index
    @cities = City.all
  end
end
