module ApplicationHelper
  def menu_item_active?(path)
    return 'active' if request.path == path
    ''
  end
end
