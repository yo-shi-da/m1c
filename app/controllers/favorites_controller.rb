class FavoritesController < ApplicationController

  def index
    @user = current_user
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    favorites = Favorite.where(user_id: current_user.id).pluck(:meal_id) 
    @favorite_list = Meal.find(favorites) 
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
