class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def disable_header
    @disable_header = true
  end

  def disable_footer
    @disable_footer = true
  end

  def disable_hero
    @disable_hero = true
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up)
  #   devise_parameter_sanitizer.permit(:account_update)
  # end
  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
