class ReviewsController < ApplicationController

  before_action :authenticate_user

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.attaraction_id = params[:attraction_id]
    @review.user = current_user

    if @review.save!
      flash[:notice] = 'Thanks for your review!'
    else
      flash[:notice] = `Woops something went wrong with your review. Please ensure you're logged in`
    end

    redirect_to attraction_path(@review.attraction_id)
  end

  def destroy
    @review = Review.find(params[:id])
    attraction = @review.attraction
    @review.destroy!
    redirect_to attraction_path(attraction)
  end

  private
  def review_params
    params.require(:review).permit(
      :review,
      :rating
    )
  end

end
