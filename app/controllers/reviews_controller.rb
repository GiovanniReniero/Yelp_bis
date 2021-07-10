class ReviewsController < ApplicationController
 before_action :find_restaurant   

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant)
  end
  
private

  def params_review
    params.require(:review).permit(:rating, :content)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
