class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_staff
  before_action :build_shopping_cart
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def disable_header
    @disable_header = true
  end

  def disable_footer
    @disable_footer = true
  end

  def disable_hero
    @disable_hero = true
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: File.join(Rails.root, 'public', "404.html"), status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def set_staff
    @user_logged_in_and_is_staff = user_signed_in? && !current_user.client? 
  end

  private

  def build_shopping_cart
    @shopping_cart = session[:shopping_cart] ||= {}
  end

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def after_sign_in_path_for(resource)
    path_by_role
  end

  def path_by_role
    case current_user.role
    when "chef"
      orders_path
    when "manager"
      foods_path
    when "admin"
      users_path
    else
      root_path
    end
  end

end
