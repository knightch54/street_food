class CashBalancesController < ApplicationController
  before_action :set_cash_balance, only: %i[ show edit update destroy close_cashbox ]

  # GET /cash_balances or /cash_balances.json
  def index
    initialize_cash_balance
    if current_user.admin?
      @cash_balances = params[:status].present? ? CashBalance.where("status = ?", params[:status]) : CashBalance.all
    else
      @orders = Order.today_completed
      @chef = @orders.present? ? @orders.first.chef : nil
      @cash_balance = CashBalance.last
    end
  end

  # GET /cash_balances/1 or /cash_balances/1.json
  def show
    authorize @cash_balance
  end

  # GET /cash_balances/new
  def new
    @cash_balance = CashBalance.new
    # authorize @cash_balance
  end

  # GET /cash_balances/1/edit
  def edit
  end

  # POST /cash_balances or /cash_balances.json
  def create
    @cash_balance = CashBalance.new(cash_balance_params)

    respond_to do |format|
      if @cash_balance.save
        format.html { redirect_to cash_balance_url(@cash_balance), notice: "Cash balance was successfully created." }
        format.json { render :show, status: :created, location: @cash_balance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cash_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_balances/1 or /cash_balances/1.json
  def update
    respond_to do |format|
      if @cash_balance.update(cash_balance_params)
        format.html { redirect_to cash_balance_url(@cash_balance), notice: "Cash balance was successfully updated." }
        format.json { render :show, status: :ok, location: @cash_balance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cash_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_balances/1 or /cash_balances/1.json
  def destroy
    @cash_balance.destroy

    respond_to do |format|
      format.html { redirect_to cash_balances_url, notice: "Cash balance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def close_cashbox
    salary_percentage = params[:salary_percentage]
    chef = User.find(params[:chef_id])

    ChefMoneyReceivingService.new(chef, @cash_balance).call(salary_percentage)

    redirect_to cash_balances_url
  end

  def cash_balance_history
    @cash_balances = CashBalance.closed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_balance
      @cash_balance = CashBalance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cash_balance_params
      params.fetch(:cash_balance, {})
    end

    def initialize_cash_balance
      CashBalance.create unless CashBalance.opened.any?
    end
end