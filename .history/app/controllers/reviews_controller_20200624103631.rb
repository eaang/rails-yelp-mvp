class ReviewsController < ApplicationController
  def new
    @ review =  review.new
  end

  def create
    @ review =  review.new( review_params)
    if @ review.valid?
      @ review.save

      redirect_to @ review
    else
      render :new
    end
  end

  private

  def  review_params
    params.require(: review).permit(:name, :address, :phone_number, :category)
  end
end
