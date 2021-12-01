class Personal < ApplicationRecord
  validates :birth_date, presence: true
  validate :birthday_cannot_be_in_the_future
  validates :height, presence: true
  validates :body_weight, presence: true
  validates :bmi, presence: true
  validates :waist_circumference, presence: true
  validates :hba_onec, presence: true
  validates :underlying_disease, presence: true
  validates :intake_per_oneday, presence: true
  validates :intake_per_oneday, length: { maximum: 6 }
  
  belongs_to :user

  private

  def birthday_cannot_be_in_the_future
    if birth_date&.future?
      errors.add(:birth_date, "は未来の日付は入力できません。")
    end
  end  

  enum gender: {
    男: 0,
    女: 1
  }

end
