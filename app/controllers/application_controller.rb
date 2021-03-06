class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :my_group

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin])
  end

  def my_group
    if Member.find_by(user_id: current_user.id).present?
      @current_user_members = Member.find_by(user_id: current_user.id)
      @current_user_mygroup = @current_user_members.group
    end
  end

end