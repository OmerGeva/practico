class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_challenges
  has_many :messages, dependent: :destroy
  has_many :challenges, through: :users_challenges
  has_many :events
  has_friendship
end
