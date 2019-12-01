class Challenge < ApplicationRecord
  belongs_to :skill
  has_many :users_challenges, dependent: :destroy
  has_many :users, through: :users_challenges
end
