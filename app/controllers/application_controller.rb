class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :my_group

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
  end

  # 参加しているグループを取得
  def my_group
    if Member.find_by(user_id: current_user.id).present?
      @current_user_middle = Member.find_by(user_id: current_user.id)
      @current_user_mygroup = @current_user_middle.group
    end
  end

end