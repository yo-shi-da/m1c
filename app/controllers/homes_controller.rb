class HomesController < ApplicationController

  def index
    @q = Meal.all.ransack(params[:q])
    @meals = @q.result.page(params[:page])
  end

  def show
    @meal = Meal.find(params[:id])
    @user = User.find(@meal.user_id)
    @group = @user&.joined_group
    @favorite = current_user.favorites.find_by(meal_id: @meal.id)
  end
  
end
