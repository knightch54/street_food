class OrderCreationService

  def initialize(current_user, shopping_cart)
    @current_user = current_user
    @cart = shopping_cart
  end

  def call(cart_price)
    foods = Food.where(id: @cart.keys)

    if foods.any?
      order = create_order(@current_user, cart_price)

      if order.present?
        foods.each do |food|
          ingredients = Ingredient.where(id: @cart[food.id.to_s].keys)
          create_food_order(order, food, ingredients)
        end
      end

      p "clear cart"

      return order
    end

    false
  end

  def create_order(user, cart_price)
    Order.create({
      user_id: user.id,
      price: cart_price
    })
  end
  
  def create_food_order(order, food, ingredients)
    food_order = FoodOrder.create({
      order_id: order.id,
      food_id: food.id
    })
    
    if food_order.present?
      ingredients.each do |ingredient|
        quantity = @cart[food.id.to_s][ingredient.id.to_s]
        create_food_order_ingredients(food_order, ingredient, quantity)
      end
    end
  end
  
  def create_food_order_ingredients(food_order, ingredient, quantity)
    FoodAdditionalIngredientOrder.create({
      food_order_id: food_order.id,
      ingredient_id: ingredient.id,
      quantity: quantity
    })
  end

  def send_email_notification
    OrderMailer.with(user: @current_user).create_order.deliver_now
  end
end