class ReviewsController < ApplicationController
 before_action :find_restaurant, except: [:destroy]

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new #Using the instance of Review that failed to save
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end
  


private

  def params_review
    params.require(:review).permit(:rating, :content)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
