class CitiesController < ApplicationController
  def show
    @city = City.find params[:id]
    @attractions = @city.attractions 
    @categories = categories(@attractions)
  end
 
  def index
    @cities = City.all.order(name: :desc)
  end

  def categories(attractions)
    allCategories = ['gallery', 'garden', 'historical', 'kids', 'museum', 'nature', 'shopping']
    categories = []
    allCategories.each do |category|
      attractions.each do |attraction|
        if attraction.categories.include?(category) && !categories.include?(category)
          categories << category
        end
      end
    end
    categories
  end

end
