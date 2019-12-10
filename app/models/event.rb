class Event < ApplicationRecord
  belongs_to :users_challenge
  belongs_to :user
  has_one :challenge, through: :users_challenge

  before_create :set_color

  COLORS = %w[#F47748 #E87EA1 #ECC30A #64ADF2 #D65F63]

  private

  def set_color
    events_count = user.users_challenges.count
    self.color = COLORS[events_count]
  end
end
