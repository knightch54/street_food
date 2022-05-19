class OrderMailer < ApplicationMailer
  default from: 'noreply@street-food.com'

  def create_order
    @user = params[:user]
    # @order = params[:order]
    mail(to: @user.email, subject: 'Thank you for your order')
  end
end
