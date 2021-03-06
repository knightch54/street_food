class ChefMoneyReceivingService
  include ApplicationHelper

  def initialize(chef, cash_balance)
    @chef = chef
  end
  
  def call(percent)
    sum = pay_daily_money_to_chef(percent)
    
    sum
  end
  
  protected
  
  def pay_daily_money_to_chef(percent)
    day_cash_balance = get_today_cash_balance
    day_cash_sum = day_cash_balance.sum

    pay_sum = percentage_of_number(day_cash_sum, percent)

    @chef.update_attribute(:money, @chef.money + pay_sum)

    day_cash_balance.update({
      sum: (day_cash_sum - pay_sum).round(2),
      user_id: @chef.id
    })
    day_cash_balance.close

    @chef.money
  end

  def get_today_cash_balance
    CashBalance.last
  end
  
  def send_email_notification
    # OrderEmailNotificationSender.new(@current_user).call
  end
end