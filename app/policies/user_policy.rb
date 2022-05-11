class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  def show?
    @record == user
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
  
end
