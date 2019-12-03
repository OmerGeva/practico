class Event < ApplicationRecord
  belongs_to :users_challenge
  belongs_to :user
  has_one :challenge, through: :users_challenge

  before_create :set_color

  COLORS = %w[#89E8C0 #64ADF2 #C7EAE4 #ECC30A #F47748 #D65F63]

  private

  def set_color
    events_count = user.users_challenges.count
    self.color = COLORS[events_count]
  end
end
