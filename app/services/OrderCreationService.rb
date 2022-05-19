class OrderCreationService

  def initialize(current_user)
    @current_user = current_user
  end
  
  def call(order_attributes)
    begin
      food = get_food(order_attributes)
      order = create_order(price: food.price)
      create_food_order(order_id: order.id, food_id: food.id)
    rescue ActiveRecord::RecordNotFound
    # rescue => e
      # p e
      Rails.logger.error "Order can't be create. Food #{order_attributes[:food_id]} not found"
      return false
    end
    # return order unless order.persisted?
    send_email_notification
    order
  end
  
  protected
  
  def create_order(order_attributes)
    order_attributes = order_attributes.merge(
      user_id: @current_user.id
    )
    Order.create(order_attributes)
  end

  def create_food_order(food_order_attributes)
    food_order_attributes = food_order_attributes.merge(
      user_id: @current_user.id
    )
    FoodOrder.create(food_order_attributes)
  end

  def get_food(order_attributes)
    Food.find(order_attributes[:food_id])
  end
  
  def send_email_notification
    OrderMailer.with(user: @current_user).create_order.deliver_now
  end
end