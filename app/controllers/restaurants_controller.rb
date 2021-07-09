class RestaurantsController < ApplicationController
before_action :find_restaurant, only: [:show, :edit, :update, :destroy ]

def index
  @restaurants = Restaurant.all
end

def show; end

def new
  @restaurant = Restaurant.new  
end

def create
  @restaurant = Restaurant.new(restaurant_params)
  @restaurant.save
  redirect_to restaurants_path
end

def edit; end

def update
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(restaurant_params)
  redirect_to restaurant_path
end

def destroy
  @restaurant.destroy
  redirect_to restaurants_path
end


private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :category)  
end

def find_restaurant
  @restaurant = Restaurant.find(params[:id])
end


end
