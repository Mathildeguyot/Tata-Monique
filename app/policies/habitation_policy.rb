class HabitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    return true
  end

  def update?
    return true
  end
end
