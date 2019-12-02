class UsersChallengePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def accept?
    record.user == user
  end

  def decline?
    record.user == user
  end
end
