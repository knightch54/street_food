class OrderMailer < ApplicationMailer
  default from: 'noreply@street-food.com'

  def create_order
    @user = params[:user]
    # @order = params[:order]
    attachments['order_example.pdf'] = File.read("public/user_orders/order_example.pdf")
    mail(to: @user.email, subject: 'Thank you for your order')
  end
end
