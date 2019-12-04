class AccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def request_friend?
    true
  end
  def show?
    record.users.include? user
  end



  def accept_friend?
    record.users.include? user
  end

  def delete_friend?
    record.users.include? user
  end

end
