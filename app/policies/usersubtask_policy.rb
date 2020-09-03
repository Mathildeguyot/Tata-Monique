class UsersubtaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

end
