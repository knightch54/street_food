class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.chef?
        scope.where(:chef_id => user.id)
      else
        scope.all
      end
    end
  end

  def index?
    user.has_any_role? :admin, :manager, :chef
  end

  def edit?
    user.has_any_role? :admin, :manager, :chef
  end

  def update?
    user.has_any_role? :admin, :manager, :chef
  end

  def show?
    user.has_any_role? :admin, :manager, :chef
  end

  def new?
    user.has_any_role? :admin, :manager, :chef
  end

  def create?
    user.has_any_role? :admin, :manager, :chef
  end

  def destroy?
    user.has_any_role? :admin, :manager, :chef
  end
end
