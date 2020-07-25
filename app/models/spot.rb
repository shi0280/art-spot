class Spot < ApplicationRecord
  has_many :spot_users
  has_many :users, through: :spot_users
  has_many :posts
end
