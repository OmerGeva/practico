class ChallengePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    record.users.include? user
  end

  def finished?
    record.users.include? user
  end

  def renew?
    record.users.include? user
  end

  def schedule?
    record.users.include? user
  end

  def update?
    record.users.include? user
  end
end
