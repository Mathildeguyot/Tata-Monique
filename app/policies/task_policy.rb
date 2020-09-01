class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create
    return true
  end

  def show?
    return true
  end

  def fetch_tasks?
    true
  end
end
