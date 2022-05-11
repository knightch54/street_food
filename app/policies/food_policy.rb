class FoodPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.has_any_role? :admin, :manager
  end

  def edit?
    user.has_any_role? :admin, :manager
  end

  def update?
    user.has_any_role? :admin, :manager
  end

  def show?
    @user.has_any_role? :admin, :manager
  end

  def new?
    @user.has_any_role? :admin, :manager
  end

  def create?
    @user.has_any_role? :admin, :manager
  end

  def destroy?
    @user.has_any_role? :admin, :manager
  end
end
