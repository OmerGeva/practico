class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_picture

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_challenges
  has_many :messages, dependent: :destroy
  has_many :challenges, through: :users_challenges
  has_many :events
  has_friendship
  has_many :wins
  has_many :check_ins, through: :users_challenges

  mount_uploader :photo, PhotoUploader

  def set_picture
    self.remote_photo_url = 'https://i.kym-cdn.com/photos/images/newsfeed/001/452/271/0f9'
  end
end
