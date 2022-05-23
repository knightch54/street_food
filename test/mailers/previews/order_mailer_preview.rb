class OrderMailerPreview < ActionMailer::Preview

  def create_order
    OrderMailer.with(user: User.first).create_order
  end

end