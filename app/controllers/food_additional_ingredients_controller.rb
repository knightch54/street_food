class FoodAdditionalIngredientsController < ApplicationController
  before_action :set_food_additional_ingredient, only: %i[ show edit update destroy ]

  # GET /food_additional_ingredients or /food_additional_ingredients.json
  def index
    @food_additional_ingredients = FoodAdditionalIngredient.all
  end

  # GET /food_additional_ingredients/1 or /food_additional_ingredients/1.json
  def show
  end

  # GET /food_additional_ingredients/new
  def new
    @food_additional_ingredient = FoodAdditionalIngredient.new
  end

  # GET /food_additional_ingredients/1/edit
  def edit
  end

  # POST /food_additional_ingredients or /food_additional_ingredients.json
  def create
    @food_additional_ingredient = FoodAdditionalIngredient.new(food_additional_ingredient_params)

    respond_to do |format|
      if @food_additional_ingredient.save
        format.html { redirect_to food_additional_ingredient_url(@food_additional_ingredient), notice: "Food additional ingredient was successfully created." }
        format.json { render :show, status: :created, location: @food_additional_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_additional_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_additional_ingredients/1 or /food_additional_ingredients/1.json
  def update
    respond_to do |format|
      if @food_additional_ingredient.update(food_additional_ingredient_params)
        format.html { redirect_to food_additional_ingredient_url(@food_additional_ingredient), notice: "Food additional ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @food_additional_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_additional_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_additional_ingredients/1 or /food_additional_ingredients/1.json
  def destroy
    @food_additional_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to food_additional_ingredients_url, notice: "Food additional ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_additional_ingredient
      @food_additional_ingredient = FoodAdditionalIngredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_additional_ingredient_params
      params.require(:food_additional_ingredient).permit(:food_id, :ingredient_id)
    end
end
