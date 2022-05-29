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
      create_chef_order
    else
      @order.update_attribute(:status, 2)
    end
  end

  def create_chef_order
    ChefOrder.create({
      user_id: @chef.id,
      order_id: @order.id
    })
  end
  
  def send_email_notification
    # to_do: send email to user - chef take user order
  end
end