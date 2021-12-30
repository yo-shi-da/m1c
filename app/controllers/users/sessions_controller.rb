# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.guest #ここでUserを作成しているので必須。
    sign_in User.last
    redirect_to meals_path, notice: 'ゲストユーザーとしてログインしました'
  end

  def new_guest_admin
    user = User.guest_admin
    sign_in User.last
    redirect_to meals_path, notice: 'ゲスト管理者ユーザーとしてログインしました'
  end
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # Login後を指定している。
  def after_sign_in_path_for(resource)
    meals_path
  end

end
