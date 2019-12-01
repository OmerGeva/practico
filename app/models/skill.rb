class Skill < ApplicationRecord
  has_many :challenges, dependent: :destroy
end
