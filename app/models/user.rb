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
    self.remote_photo_url = 'https://res.cloudinary.com/alisasilina/image/upload/v1585250680/avatar-placeholder_hm3fr3.svg'
  end
end
