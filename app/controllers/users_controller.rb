class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end
  
  def show
  end

  def edit
  end

  def update
    if @user.update(post_params)
      redirect_to @user, notice: '更新しました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user.users.find(params[:id])
  end

  def user_params
  end

end
