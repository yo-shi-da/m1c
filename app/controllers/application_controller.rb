class ApplicationController < ActionController::Base
  before_action :check_admin_authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :my_group

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to meals_path, alert: '画面を閲覧する権限がありません。'
  end

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

  def check_admin_authorization
    if request.path.start_with?('/admin')
      authorize! :access_admin_page
    end
  end

end