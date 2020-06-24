class ReviewsController < ApplicationController
  def new
    @review = Review.new
    find_restaurant
  end

  def create
    @review = Review.new(review_params)
    @review.rating = @review.rating[0]
    if @review.valid?
      @review.save
      find_restaurant
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
