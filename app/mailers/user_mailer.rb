class UserMailer < ApplicationMailer
  layout 'mailer'
  
  default from: 'noreply@street-food.com'
  
  def welcome_email
    @user = params[:user] 
    @url = 'https://afternoon-ocean-59850.herokuapp.com/login#login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
end