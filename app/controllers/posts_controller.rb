class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @meal = Meal.find(@post.meal_id)
    if @post.save
      redirect_to meal_path(id: @meal.id), notice: '投稿しました。'
    else
      redirect_to meal_path(id: @meal.id), notice: '未入力項目があります'
    end
  end
  # @posts = Post.find_by(meal_id: @meal.id)

  private

    def post_params
      params.require(:post).permit(:owner_comment, :owner_sugar_amount, :difference, :submitter, :meal_id)
    end
end
