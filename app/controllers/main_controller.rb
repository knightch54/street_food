class MainController < ApplicationController

  def index
    @foods = Food.all.order(:created_at).limit(6)
  end

  def dishes
    @foods = Food.all
  end

  def contact
  end

end
