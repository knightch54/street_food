module ApplicationHelper
  def generate_body_classes
    home_class = current_page?(root_url) ? "home-page" : ""
    theme_class = @user_logged_in_and_is_staff ? "staff-theme" : "client-theme"
    role_class = user_signed_in? ? current_user.role + "-role".dasherize : ""
    [home_class, theme_class, role_class].join(" ");
  end

  def menu_item_active?(path)
    return 'active' if request.path == path
    ''
  end

  def percentage_of_number(number, percent)
    (number.to_f / 100 * percent.to_f).round(2)
  end
end
