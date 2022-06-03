class FoodIngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_ingredient, only: %i[ show edit update destroy ]

  # GET /food_ingredients or /food_ingredients.json
  def index
    @food_ingredients = params[:food_id].present? ? FoodIngredient.where("food_id = ?", params[:food_id]) : FoodIngredient.all
  end

  # GET /food_ingredients/1 or /food_ingredients/1.json
  def show
  end

  # GET /food_ingredients/new
  def new
    @food_ingredient = FoodIngredient.new
  end

  # GET /food_ingredients/1/edit
  def edit
  end

  # POST /food_ingredients or /food_ingredients.json
  def create
    @food_ingredient = FoodIngredient.new(food_ingredient_params)

    respond_to do |format|
      if @food_ingredient.save
        format.html { redirect_to food_ingredient_url(@food_ingredient), notice: "Food ingredient was successfully created." }
        format.json { render :show, status: :created, location: @food_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_ingredients/1 or /food_ingredients/1.json
  def update
    respond_to do |format|
      if @food_ingredient.update(food_ingredient_params)
        format.html { redirect_to food_ingredient_url(@food_ingredient), notice: "Food ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @food_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_ingredients/1 or /food_ingredients/1.json
  def destroy
    @food_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to food_ingredients_url, notice: "Food ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_ingredient
      @food_ingredient = FoodIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_ingredient_params
      params.require(:food_ingredient).permit(:ingredient_id, :food_id)
    end
end
