class ChefsController < ApplicationController
  before_action :set_chef, only: %i[ show edit update destroy ]

  # GET /chefs or /chefs.json
  def index
    @chefs = Chef.all
  end

  # GET /chefs/1 or /chefs/1.json
  def show
  end

  # GET /chefs/new
  def new
    @chef = Chef.new
  end

  # GET /chefs/1/edit
  def edit
  end

  # POST /chefs or /chefs.json
  def create
    @chef = Chef.new(chef_params)

    respond_to do |format|
      if @chef.save
        format.html { redirect_to chef_url(@chef), notice: "Chef was successfully created." }
        format.json { render :show, status: :created, location: @chef }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chefs/1 or /chefs/1.json
  def update
    respond_to do |format|
      if @chef.update(chef_params)
        format.html { redirect_to chef_url(@chef), notice: "Chef was successfully updated." }
        format.json { render :show, status: :ok, location: @chef }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chefs/1 or /chefs/1.json
  def destroy
    @chef.destroy

    respond_to do |format|
      format.html { redirect_to chefs_url, notice: "Chef was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef
      @chef = Chef.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chef_params
      # params.fetch(:chef, {})
      params.require(:chef).permit(:name, :email)
    end
end
