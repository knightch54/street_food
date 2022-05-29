class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.chef?
        scope.where("status = 0 OR status = 1")
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
    user.client?
  end

  def destroy?
    user.has_any_role? :admin, :manager, :chef
  end

  def open_order?
    user.present? && user == record.user
  end

  def completed_list?
    user.chef?
  end

  def chef_update_order?
    user.chef?
  end
end
