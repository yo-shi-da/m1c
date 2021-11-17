class Meal < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, source: :user
  has_many :posts
  
  belongs_to :user
end
