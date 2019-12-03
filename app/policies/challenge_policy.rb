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
    record.milestone <= UsersChallenge.find_by(user_id: user.id, challenge_id: record.id).user_progress
  end

  def renew?
    record.users.include? user
  end

  def update?
    record.users.include? user
  end
end
