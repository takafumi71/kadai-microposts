class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :added_favorite_posts, through: :fovorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
