class Win < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :challenge

end
