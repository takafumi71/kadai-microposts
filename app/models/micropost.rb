class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :reverses_of_add_favorites, through: :fovorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
