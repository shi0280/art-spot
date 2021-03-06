class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spot_users
  has_many :spots, through: :spot_users
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
         
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
