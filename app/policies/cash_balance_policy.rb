class CashBalancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.has_any_role? :admin, :manager
  end

  def show?
    user.admin?
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def close_cashbox?
    user.has_any_role? :admin, :manager
  end

  def cash_balance_history?
    user.has_any_role? :admin, :manager
  end
end