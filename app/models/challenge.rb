class Challenge < ApplicationRecord
  belongs_to :skill
  has_many :chat_room
  has_many :users_challenges, dependent: :destroy
  has_many :users, through: :users_challenges
  has_many :check_ins, through: :users_challenges

  TIME_TYPE = ['hours', 'days', 'weeks']
  COUNT_TYPE = ['in a row', 'total']
  VALIDATION_TYPE = ['checkbox', 'duration']
end
