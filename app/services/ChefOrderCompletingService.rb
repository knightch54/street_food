class ChefOrderCompletingService

  def initialize(chef, order)
    @chef = chef
    @order = order
  end
  
  def call
    set_order_to_chef
  end
  
  protected
  
  def set_order_to_chef
    if @order.waiting?
      @order.update_attribute(:status, 1)
      subtract_used_ingredients(@order)
      create_chef_order
    else
      @order.update_attribute(:status, 2)
      # add money to today cashbox
      cashbox = get_today_cashbox
      cashbox.update_attribute(:sum, cashbox.sum + @order.price)
    end
  end

  def create_chef_order
    ChefOrder.create({
      user_id: @chef.id,
      order_id: @order.id
    })
  end

  def get_today_cashbox
    CashBalance.last
  end

  def subtract_used_ingredients(order)
    food_orders = order.food_orders
    food_orders.each do |food_order|
      food_order.ingredients_sum.each do |ingredient_id, quantity|
        ingredient = Ingredient.find(ingredient_id)
        ingredient.update_attribute(:amount, ingredient.amount - quantity)
      end
    end
  end 
  
  def send_email_notification
    # to_do: send email to user - chef take user order
  end
end