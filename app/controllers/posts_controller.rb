class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @meal = Meal.find(@post.meal_id)
    if @post.save
      redirect_to meal_path(id: @meal.id), notice: '投稿しました。'
    else
      render :new
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post, notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: '削除しました。'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:owner_comment, :owner_sugar_amount, :difference, :submitter, :meal_id)
    end
end
