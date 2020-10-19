class Spot < ApplicationRecord
  has_many :spot_users, dependent: :destroy
  has_many :users, through: :spot_users, dependent: :destroy
  has_many :posts, dependent: :destroy

  mount_uploader :image, ImageUploader
end
