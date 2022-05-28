module CartHelper
  def shopping_cart_contain_products?
    shopping_cart_size > 0
  end

  def shopping_cart_size
    @shopping_cart.keys.size
  end

  # return array with food records
  def shopping_cart_data
    cart = []
    foods = Food.where(id: @shopping_cart.keys)

    foods.each do |food|
      ingredients_data = @shopping_cart[food.id.to_s]
      cart.push({food: food, ingredients: Ingredient.where(id: ingredients_data.keys)})
    end

    cart
  end

  def shopping_cart_price
    shopping_cart_data.sum{|food_order| food_order[:food].price + food_order[:ingredients].sum{|ingredients| ingredients.price} }
  end

  def shopping_cart_clear
    session[:shopping_cart] = {}
  end
end
