class MainController < ApplicationController

  def index
    if @user_logged_in_and_is_staff
      redirect_to path_by_role
    else
      @foods = Food.all.order(:created_at).limit(6)
    end
  end

  def dishes
    @foods = Food.all
  end

  def contact
  end

end