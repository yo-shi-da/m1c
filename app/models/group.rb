class Group < ApplicationRecord
  validates :name, length: { maximum: 255 }

  has_many :members, dependent: :destroy
  has_many :users, through: :members, source: :user
end
