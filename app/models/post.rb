class Post < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
