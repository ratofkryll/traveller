class AttractionsController < ApplicationController
  def show
    @attraction = Attraction.find params[:id]
    @reviews = @attraction.reviews
    @review = Review.new
    @itinerary_item = ItineraryItem.new
  end


end
