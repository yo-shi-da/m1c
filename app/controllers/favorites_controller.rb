class FavoritesController < ApplicationController

  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:meal_id) 
    @favorite_lists = Meal.find(favorites) 

    @favorite_lists.each do |favorite_list|
      @meal = Meal.find(favorite_list.id)
      @favorites = current_user.favorites.find_by(meal_id: @meal.id)
    end
  end

  def create
    favorite = current_user.favorites.create(meal_id: params[:meal_id])
    redirect_to favorites_path, notice: "お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "お気に入り解除しました"
  end

end
