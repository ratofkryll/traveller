class AttractionsController < ApplicationController
  def show
    @attraction = Attraction.find params[:id]
    @reviews = @attraction.reviews
    @review = Review.new
  end
end
