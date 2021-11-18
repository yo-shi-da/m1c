class Group < ApplicationRecord
  has_one :member, dependent: :destroy
  has_one :users, through: :members, source: :user
  belongs_to :user
end
