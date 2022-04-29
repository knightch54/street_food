class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def disable_nav
    @disable_nav = true
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up)
  #   devise_parameter_sanitizer.permit(:account_update)
  # end
  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
