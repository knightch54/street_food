module ApplicationHelper
  def menu_item_active?(path)
    return 'active' if request.path == path
    ''
  end

  def percentage_of_number(number, percent)
    number / 100 * percent
  end
end
