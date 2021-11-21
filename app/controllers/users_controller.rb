class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = current_user
    # if current_user == nil
    #   redirect_to meals_path, notice: '他のユーザーを見ることはできません。'
    # else
    # end
  end

end
