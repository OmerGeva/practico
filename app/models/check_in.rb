class CheckIn < ApplicationRecord
  belongs_to :users_challenge

  mount_uploader :photo, PhotoUploader
end
