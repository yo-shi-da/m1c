class Post < ApplicationRecord
  validates :owner_sugar_amount, length: { maximum: 4 }
  validates :difference, length: { maximum: 4 }

  belongs_to :meal
end
