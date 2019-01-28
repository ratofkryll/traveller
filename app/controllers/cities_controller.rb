class CitiesController < ApplicationController
  def show
    @city = City.find params[:id]
    @attractions = @city.attractions
  end
 
  def index
    @cities = City.all.order(name: :desc)
  end
end
