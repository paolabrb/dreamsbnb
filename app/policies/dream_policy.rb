class DreamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def destroy?
    record.user == user || user.admin
  end
end
