classreviewsController < ApplicationController
  def new
    @review = review.new
  end

  def create
    @review = review.new(review_params)
    if @review.valid?
      @review.save
      @restaurant = Restaurant.find(@review.restaurant_id)

      redirect_to @revirestaurantew
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
