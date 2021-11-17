class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @meals = Meal.all
    @q = Meal.all.ransack(params[:q])

    # binding.pry
    @meals = @q.result.page(params[:page])
  end

  def show

    if user_signed_in?
      @meal = Meal.find(params[:id])
      @favorite = current_user.favorites.find_by(meal_id: @meal.id)
    end

  end
  
end
