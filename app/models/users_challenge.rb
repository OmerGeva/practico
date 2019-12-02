class UsersChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  has_many :check_ins, dependent: :destroy
  has_many :events
end
