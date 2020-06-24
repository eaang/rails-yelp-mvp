class RestaurantsController < ApplicationController
  def index
    if params.has_key?(:type)
      @restaurants = Restaurant.where(category: params[:type])
    else
      @restaurant = Restaurant.all
    end
    @restaurants = @restaurants.sort_by(&:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.all_reviews
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.valid?
      @restaurant.save

      redirect_to @restaurant
    else
      render :new
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
