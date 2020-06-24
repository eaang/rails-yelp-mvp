class ReviewsController < ApplicationController
  def create
    @review.restaurant = @restaurant
    if @review.valid?
      @review.save

      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
