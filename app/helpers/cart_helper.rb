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
      ingredients = Ingredient.where(id: ingredients_data.keys)
      cart.push({
        food: food,
        ingredients: ingredients,
        ingredients_quantity: ingredients_data
      })
    end

    cart
  end

  def shopping_cart_price
    shopping_cart_data.sum do |food_order| 
      food_price = food_order[:food].price
      ingredients_price = food_order[:ingredients].sum do |ingredient| 
        ingredient.price * food_order[:ingredients_quantity][ingredient.id.to_s].to_i
      end
      food_price + ingredients_price
    end
  end

  def shopping_cart_clear
    session[:shopping_cart] = {}
  end
end
