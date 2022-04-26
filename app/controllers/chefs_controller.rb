class ChefsController < ApplicationController
  
  # GET /users or /users.json
  def index
    @chefs = Chef.all
  end

end
