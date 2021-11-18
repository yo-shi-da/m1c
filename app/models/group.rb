class Group < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members, source: :user
end
