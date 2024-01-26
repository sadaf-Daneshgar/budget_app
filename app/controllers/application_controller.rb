class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :root_path
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(_resource)
    user_categories_path(current_user)
  end
end
