class Post < ApplicationRecord
  validates :owner_comment, presence: true
  validates :owner_sugar_amount, presence: true
  validates :difference, presence: true
  validates :owner_sugar_amount, length: { maximum: 4 }
  validates :difference, length: { maximum: 4 }
  before_save :post_check

  belongs_to :meal

  private

  # binding.pry
  def post_check
    first_post = Post.find_by(meal_id: self.meal_id)
    if first_post.present?
      errors.add(:base, "1件のみの投稿です。")
      throw :abort
    end
  end

end